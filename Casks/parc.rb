# typed: false
# frozen_string_literal: true

cask "parc" do
  version "2.8.0"
  sha256 "fb23177b0cfe99ee5180e43350acae9e57ca86e294a16aa804a5f1934e09ee03"

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
