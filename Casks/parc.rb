# typed: false
# frozen_string_literal: true

cask "parc" do
  version "2.6.0"
  sha256 "6dadca8ca0742feb7cba3174cae57900ded3c939bc4cb57a5df613afda3a93de"

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
