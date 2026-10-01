# typed: false
# frozen_string_literal: true

cask "pi-garden" do
  version "1.0.4"
  sha256 "e2279391af2ded90098e0ba2907aa6155fb7566bd96dac0f87dc611c581184f9"

  url "https://github.com/etsenake/pi-garden/releases/download/v1.0.4/pi-garden-1.0.4-arm64.dmg"
  name "Pi Garden"
  desc "Codex-style desktop shell for pi"
  homepage "https://github.com/etsenake/pi-garden"

  depends_on arch: :arm64

  app "Pi Garden.app"
end
