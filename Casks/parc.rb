# typed: false
# frozen_string_literal: true

cask "parc" do
  version "2.4.0"
  sha256 "e77ce13a83b1de020e3f825b39b67989bdabbbbeab3dab11f714a8c9d560ae50"

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
