# typed: false
# frozen_string_literal: true

cask "parc" do
  version "2.10.1"
  sha256 "0e83a51a3c143d9a3580aa55ab7a6ec8954da8fc87c6f9bdb72083cc04aa4186"

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
