# typed: false
# frozen_string_literal: true

require_relative "../lib/parc_private_release_download_strategy"

cask "parc" do
  version "1.2.0"
  sha256 "a76614e0eba486cb8ebdb788435abc0d7cc047a70dc884ffe161b01d32ea8e04"

  url "https://github.com/etsenake/parc/releases/download/v#{version}/Parc-#{version}-arm64.dmg",
      using: ParcPrivateReleaseDownloadStrategy
  name "Parc"
  desc "Native browser with an independent Chromium engine"
  homepage "https://github.com/etsenake/parc"

  livecheck do
    skip "Private releases; the release publisher updates this cask"
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Parc.app"

  uninstall quit: "org.parc.Browser"
end
