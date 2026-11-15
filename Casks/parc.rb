# typed: false
# frozen_string_literal: true

cask "parc" do
  version "2.5.0"
  sha256 "5c9cc2d22d6a65fac91ac4627f3d971212de1b4d58abf9a37d5d4d6627dbc309"

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
