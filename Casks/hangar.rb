cask "hangar" do
  version "0.2.3"
  sha256 "b7e085b2ca7c4c5bff6e312cce769cf31c09b4471a0f0121f9a135ce0afa8611"

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
