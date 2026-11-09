# typed: false
# frozen_string_literal: true

cask "parc" do
  version "1.8.2"
  sha256 "9cd5d7bcb6aff9b27b4d0ce525a1412afbdc09df7e63c4138ea1b1ba0ceeb6b6"

  url "https://github.com/etsenake/parc-releases/releases/download/v#{version}/Parc-#{version}-arm64.dmg"
  name "Parc"
  desc "Native browser with an independent Chromium engine"
  homepage "https://github.com/etsenake/parc-releases"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Parc.app"

  uninstall quit: "org.parc.Browser"
end
