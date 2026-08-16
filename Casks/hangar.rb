cask "hangar" do
  version "0.2.1"
  sha256 "02e8e8083d800fba187ab5bdeada767a6102b4fb3be9b114427440ecc8b472eb"

  url "https://github.com/henriquepe/homebrew-hangar/releases/download/v#{version}/Hangar-#{version}.dmg"
  name "Hangar"
  desc "Native macOS terminal for AI coding agents (Claude Code, Codex)"
  homepage "https://github.com/henriquepe/hangar"

  depends_on macos: :sequoia

  app "Hangar.app"

  # Launch once so Hangar wires up its Claude Code / Codex hooks.
  postflight do
    system_command "/usr/bin/open", args: ["-a", "#{appdir}/Hangar.app"]
  end

  zap trash: [
    "~/Library/Application Support/Hangar",
    "~/.hangar",
  ]
end
