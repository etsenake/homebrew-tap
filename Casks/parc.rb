# typed: false
# frozen_string_literal: true

cask "parc" do
  version "2.9.0"
  sha256 "4a89dc675b04ea11f2e97d795b1d8786475d19642268eb7d6bebc1ae11fed27a"

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
