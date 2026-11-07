# typed: false
# frozen_string_literal: true

require_relative "../lib/parc_private_release_download_strategy"

cask "parc" do
  version "1.3.0"
  sha256 "cc2f1bb5795e63e1db0a67611d89f4eddc14de092938dfcbdd2592e23467a6b5"

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
