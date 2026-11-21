# typed: false
# frozen_string_literal: true

cask "parc" do
  version "2.14.0"
  sha256 "6c0f2f376c4df4e9792968f0b6ea7d7f1d133c9b9b878c62c64feed406600535"

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
