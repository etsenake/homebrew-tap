# typed: false
# frozen_string_literal: true

cask "pi-garden" do
  version "1.0.3"
  sha256 "ea4a51ded42a8db77982c77809fad4a86ebef2ec26fb43799684b9bd20aab299"

  url "https://github.com/etsenake/pi-garden/releases/download/v1.0.3/pi-garden-1.0.3-arm64.dmg"
  name "Pi Garden"
  desc "Codex-style desktop shell for pi"
  homepage "https://github.com/etsenake/pi-garden"

  depends_on arch: :arm64

  app "Pi Garden.app"
end
