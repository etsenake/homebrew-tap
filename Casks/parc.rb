# typed: false
# frozen_string_literal: true

cask "parc" do
  version "2.10.2"
  sha256 "c8e2d5827a4eeef7566c1787dc0ea30ec156a1217d24bcaa852750d90cea321a"

  url "https://github.com/etsenake/parc-releases/releases/download/v#{version}/Parc-arm64.dmg"
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
