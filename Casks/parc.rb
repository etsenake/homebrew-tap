# typed: false
# frozen_string_literal: true

cask "parc" do
  version "2.7.0"
  sha256 "dfc47894b010d39bf4078dc8605436a3fa4703303306cc4cc507e502686c5344"

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
