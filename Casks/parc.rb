# typed: false
# frozen_string_literal: true

cask "parc" do
  version "2.3.0"
  sha256 "1841ff0f47339d7fb222e0afd1c7fe495a7170736840d197651a5aceb527ac3a"

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
