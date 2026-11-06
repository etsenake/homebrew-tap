# typed: false
# frozen_string_literal: true

# Run with `brew ruby test/parc_download_strategy_test.rb`. No network, real
# credentials or application installation is used by this harness.
require_relative "../lib/parc_private_release_download_strategy"

def check(condition, message)
  raise message unless condition
end

class ParcDownloadProbe < ParcPrivateReleaseDownloadStrategy
  attr_reader :download_args, :download_options

  def curl_download(*args, **options)
    @download_args = args
    @download_options = options
  end
end

credential_reads = 0
credential = "fixture-secret"
asset_url = "https://api.github.com/repos/etsenake/parc/releases/assets/123"
assets = [{ "name" => "Parc-1.0.0-arm64.zip", "url" => asset_url }]
GitHub::API.define_singleton_method(:credentials) do
  credential_reads += 1
  credential
end
GitHub.define_singleton_method(:get_release) do |owner, repo, tag|
  check([owner, repo, tag] == ["etsenake", "parc", "v1.0.0"], "Wrong release requested")
  { "assets" => assets }
end

url = "https://github.com/etsenake/parc/releases/download/v1.0.0/Parc-1.0.0-arm64.zip"
probe = ParcDownloadProbe.new(url, "parc", "1.0.0")
metadata = probe.send(:resolve_url_basename_time_file_size, url)
check(credential_reads.zero?, "Loading metadata accessed credentials")
check(metadata[1] == "Parc-1.0.0-arm64.zip", "Incorrect archive basename")
probe.send(:_fetch, url: url, resolved_url: url, timeout: 15)
check(credential_reads == 1, "Fetch did not resolve credentials once")
check(probe.download_args.first == asset_url, "Fetch did not use the GitHub asset API")
check(probe.download_args.include?("Authorization: token fixture-secret"), "Missing authentication")
check(probe.download_options[:secrets] == [credential], "Credential not redacted")
check(probe.send(:meta).to_s.exclude?(credential), "Credential leaked into cask metadata")

credential = nil
begin
  probe.send(:_fetch, url: url, resolved_url: url, timeout: 15)
  raise "Unauthenticated fetch was accepted"
rescue CurlDownloadStrategyError => e
  check(e.message.include?("gh auth login"), "Missing actionable authentication error")
end

credential = "fixture-secret"
assets[0]["url"] = "https://example.invalid/steal"
begin
  probe.send(:_fetch, url: url, resolved_url: url, timeout: 15)
  raise "Unexpected asset host was accepted"
rescue CurlDownloadStrategyError
  # Expected: credentials must never go to another API endpoint.
end

bad_url = "https://github.com/other/private/releases/download/v1.0.0/Parc.zip"
bad = ParcDownloadProbe.new(bad_url, "parc", "1.0.0")
before = credential_reads
begin
  bad.send(:_fetch, url: bad_url, resolved_url: bad_url, timeout: 15)
  raise "Unexpected repository was accepted"
rescue CurlDownloadStrategyError
  check(credential_reads == before, "Invalid URL accessed credentials")
end

puts "Parc downloader: metadata isolation, authentication, redaction and origin checks passed"
