# typed: false
# frozen_string_literal: true

cask "parc" do
  version "2.16.0"
  sha256 "9ae60d1c1d214e34925aee4fe4205fcbd60841978fa6c05b232ba5cee3f4dd1c"

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
