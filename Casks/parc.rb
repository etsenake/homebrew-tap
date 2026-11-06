# typed: false
# frozen_string_literal: true

require_relative "../lib/parc_private_release_download_strategy"

cask "parc" do
  version "0.1.0,20261106T023749Z-e38d702a"
  sha256 "495ff5481f6f3a55e160833eea4da1361897a1c67e6b5b6b77cf77f25ca50d49"

  url "https://github.com/etsenake/parc/releases/download/app-#{version.csv.second}/Parc-#{version.csv.second}.zip",
      using: ParcPrivateReleaseDownloadStrategy
  name "Parc"
  desc "Native browser with an independent Chromium engine"
  homepage "https://github.com/etsenake/parc"

  livecheck do
    skip "Private releases; the release publisher updates this cask"
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "development/Parc.app"

  uninstall quit: "org.parc.Browser"
end
