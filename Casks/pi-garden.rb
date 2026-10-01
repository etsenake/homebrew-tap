# typed: false
# frozen_string_literal: true

cask "pi-garden" do
  version "1.0.2"
  sha256 "6b27e1f7f9a3a94982bcc1d967dbf18586c69c1dc71587652d46adf4ff55027e"

  url "https://github.com/etsenake/pi-garden/releases/download/v1.0.2/pi-garden-1.0.2-arm64.dmg"
  name "Pi Garden"
  desc "Codex-style desktop shell for pi"
  homepage "https://github.com/etsenake/pi-garden"

  depends_on arch: :arm64

  app "Pi Garden.app"
end
