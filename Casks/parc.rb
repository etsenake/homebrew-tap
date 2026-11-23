# typed: false
# frozen_string_literal: true

cask "parc" do
  version "2.17.1"
  sha256 "154f853fa1aa79d89a9ed65faa7ea49e660e263fab7178d0b7a2217a89c63178"

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
