# typed: false
# frozen_string_literal: true

cask "parc" do
  version "1.12.0"
  sha256 "6a4a26cfad06f119a459ba0e0d0dbb1ec3675e3a97644f54d3ab8c8da39a507f"

  url "https://github.com/etsenake/parc-releases/releases/download/v#{version}/Parc-#{version}-arm64.dmg"
  name "Parc"
  desc "Native browser with an independent Chromium engine"
  homepage "https://github.com/etsenake/parc-releases"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Parc.app"

  uninstall quit: "org.parc.Browser"
end
