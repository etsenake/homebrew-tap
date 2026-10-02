# typed: false
# frozen_string_literal: true

cask "pi-garden" do
  version "1.1.1"
  sha256 "e7dde64f40372957829b8cffe4ede929b581c89e34e98a3740f8fecd89a21f96"

  url "https://github.com/etsenake/pi-garden/releases/download/v1.1.1/pi-garden-1.1.1-arm64.dmg"
  name "Pi Garden"
  desc "Codex-style desktop shell for pi"
  homepage "https://github.com/etsenake/pi-garden"

  depends_on arch: :arm64

  app "Pi Garden.app"
end
