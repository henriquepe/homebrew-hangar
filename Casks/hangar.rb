cask "hangar" do
  version "0.2.2"
  sha256 "becc07711e3c51b3f855d67ea8a948cf67cd0415cda656f98a3abecaa519dc28"

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
