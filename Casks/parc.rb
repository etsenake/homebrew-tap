# typed: false
# frozen_string_literal: true

require_relative "../lib/parc_private_release_download_strategy"

cask "parc" do
  version "1.1.0"
  sha256 "fed4f4afa6da9be33de28de4cc05072a3eae437f1c5ecb3e2a1a5598d0da8201"

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
