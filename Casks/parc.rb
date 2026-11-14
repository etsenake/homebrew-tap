# typed: false
# frozen_string_literal: true

cask "parc" do
  version "2.1.2"
  sha256 "8831662c2cab397efdca5f1b54cd9566385378571c4ea8cbce4922a2382bc9e3"

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
