# typed: false
# frozen_string_literal: true

cask "parc" do
  version "2.19.0"
  sha256 "c066c4479d002138469b109f66e546cc3e380a95533ba946cb81573af008aec9"

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
