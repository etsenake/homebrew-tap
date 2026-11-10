# typed: false
# frozen_string_literal: true

cask "parc" do
  version "1.12.2"
  sha256 "7d8bbb6b663c4a020f416cda59b5a6ae91685886cddc55f3037ca05b9e6aa321"

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
