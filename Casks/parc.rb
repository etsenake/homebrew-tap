# typed: false
# frozen_string_literal: true

cask "parc" do
  version "1.9.0"
  sha256 "1ee0154d1a3d115eb8dbabe9cc7e6c6172251c9a5551e48bfba09b5d3f71170f"

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
