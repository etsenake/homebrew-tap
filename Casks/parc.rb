# typed: false
# frozen_string_literal: true

cask "parc" do
  version "1.8.1"
  sha256 "3ec4601d09e7543c9955f21329292bc0a1bb8b737570263ee35578378d4fa812"

  url "https://github.com/etsenake/parc-releases/releases/download/v#{version}/Parc-#{version}-arm64.dmg"
  name "Parc"
  desc "Native browser with an independent Chromium engine"
  homepage "https://github.com/etsenake/parc-releases"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Parc.app"

  uninstall quit: "org.parc.Browser"
end
