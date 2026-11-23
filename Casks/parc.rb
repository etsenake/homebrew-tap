# typed: false
# frozen_string_literal: true

cask "parc" do
  version "2.18.1"
  sha256 "5e092a4de31f14b28ec1b057578d704efa1eb44b2c866ff2cb66d20ecbb3ceb7"

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
