# typed: false
# frozen_string_literal: true

cask "parc" do
  version "2.12.0"
  sha256 "cc221edc91d1d1f81833bc937e5e995b08d1be9dcb6ed7eb98abc6a04735f8e5"

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
