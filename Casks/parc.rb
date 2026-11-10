# typed: false
# frozen_string_literal: true

cask "parc" do
  version "1.10.0"
  sha256 "9fb1186b6e6c9ed409c59794b11ffe85599bc140b41c324975f352623b6ca2ac"

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
