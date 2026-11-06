# typed: false
# frozen_string_literal: true

require "download_strategy"

# Resolve credentials only while downloading, never while evaluating the cask.
# The public tap contains no credentials; Parc's signed assets remain private.
class ParcPrivateReleaseDownloadStrategy < CurlDownloadStrategy
  private

  def release_coordinates
    match = %r{\Ahttps://github\.com/etsenake/parc/releases/download/([^/]+)/([^/]+\.(?:zip|dmg))\z}.match(url)
    raise CurlDownloadStrategyError.new(url, "Unrecognised Parc release URL") unless match

    [match[1], match[2]]
  end

  def resolve_url_basename_time_file_size(_url, timeout: nil)
    _, filename = release_coordinates
    [url, filename, nil, nil, nil, false]
  end

  def _fetch(url:, resolved_url:, timeout:)
    tag, filename = release_coordinates
    token = GitHub::API.credentials
    if token.blank?
      raise CurlDownloadStrategyError.new(
        url, "Parc is private. Run `gh auth login` with access to etsenake/parc, then retry."
      )
    end

    release = GitHub.get_release("etsenake", "parc", tag)
    asset = release.fetch("assets").find { |item| item.fetch("name") == filename }
    unless asset&.fetch("url")&.match?(%r{\Ahttps://api\.github\.com/repos/etsenake/parc/releases/assets/\d+\z})
      raise CurlDownloadStrategyError.new(url, "The Parc release asset is missing or has an unexpected URL")
    end

    # Homebrew sends Authorization headers through curl's stdin and redacts the
    # token from diagnostics. curl strips Authorization on cross-host redirects.
    curl_download asset.fetch("url"), "--header", "Accept: application/octet-stream",
                  "--header", "Authorization: token #{token}",
                  to: temporary_path, timeout: timeout, secrets: [token], try_partial: @try_partial
  end
end
