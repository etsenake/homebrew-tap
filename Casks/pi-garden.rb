# typed: false
# frozen_string_literal: true

cask "pi-garden" do
  version "1.1.0"
  sha256 "146378b7777344b7aa3b6516472fd8c73a200dd0c1473c9974dd8f8e9c74d512"

  url "https://github.com/etsenake/pi-garden/releases/download/v1.1.0/pi-garden-1.1.0-arm64.dmg"
  name "Pi Garden"
  desc "Codex-style desktop shell for pi"
  homepage "https://github.com/etsenake/pi-garden"

  depends_on arch: :arm64

  app "Pi Garden.app"
end
