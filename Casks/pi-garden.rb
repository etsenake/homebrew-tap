# typed: false
# frozen_string_literal: true

cask "pi-garden" do
  version "1.0.1"
  sha256 "31030bc1f81ac9d6702fafa2f8fc7bcceb98f613227f95ee261fafcf3f3646d2"

  url "https://github.com/etsenake/pi-garden/releases/download/v#{version}/pi-garden-#{version}-arm64.dmg"
  name "pi-garden"
  desc "Codex-style desktop shell for pi"
  homepage "https://github.com/etsenake/pi-garden"

  depends_on arch: :arm64

  app "pi-garden.app"
end
