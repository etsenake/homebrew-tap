# typed: false
# frozen_string_literal: true

cask "parc" do
  version "2.15.0"
  sha256 "cac391ba6a9e44b7714207f2bb95cbf6493367179fb1886a8eaea595e1eb2bb3"

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
