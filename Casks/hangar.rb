cask "hangar" do
  version "0.2.0"
  sha256 "5fef0a481880a2cd0e4cbd5a42839d88526bea17f0455ba07e637e5c6273d6dd"

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
