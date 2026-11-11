# typed: false
# frozen_string_literal: true

cask "parc" do
  version "2.0.0"
  sha256 "89d280a543bff6635ed8dbbf05ae4f6523484fca70fac1f5fc3e6bd51ee6032b"

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
