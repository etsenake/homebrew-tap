# typed: false
# frozen_string_literal: true

cask "parc" do
  version "1.12.3"
  sha256 "0f8227fdbbd560b1c7092063561e1196bbba09e7244632943d529a0d114af05d"

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
