# typed: false
# frozen_string_literal: true

cask "parc" do
  version "2.1.1"
  sha256 "879f3fc4656af003f93220d76b25a2da0d1a53a5753fffddaca27e6258a9e857"

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
