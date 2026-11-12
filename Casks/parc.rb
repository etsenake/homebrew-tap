# typed: false
# frozen_string_literal: true

cask "parc" do
  version "2.1.0"
  sha256 "1568c4b61e588340f2ca1fb85c43a1f45d449795a1ad2ff2ba39c62dc775ce7a"

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
