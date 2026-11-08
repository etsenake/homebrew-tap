# typed: false
# frozen_string_literal: true

require_relative "../lib/parc_private_release_download_strategy"

cask "parc" do
  version "1.6.0"
  sha256 "d6f9c5b73d15504e0c0269c0f462e9e7f9f070fe34e14f45fffd5a5854acee3e"

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
