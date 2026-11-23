# typed: false
# frozen_string_literal: true

cask "parc" do
  version "2.18.2"
  sha256 "12ee84a6c71e9ecf0b0d6033dff238f33e0746b7c558d27e40dc9aa94d3be85a"

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
