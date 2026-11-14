# typed: false
# frozen_string_literal: true

cask "parc" do
  version "2.2.0"
  sha256 "3c1df1315c5f660f0d30e24c054dcb70574c77cfdd7b4cf871c7efc91c399d87"

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
