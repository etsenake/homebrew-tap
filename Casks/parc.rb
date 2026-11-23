# typed: false
# frozen_string_literal: true

cask "parc" do
  version "2.17.0"
  sha256 "f7a47e8b59a418a12dc6a8e379044be5ae323d22119fbcf5a2deda0bff3ff8ca"

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
