cask "hangar" do
  version "0.1.0"
  sha256 "d30b5e2f75dd4e3239ecc7848ad56c97920aec6a7d98cb1b08d6ce691c9edef8"

  url "https://github.com/henriquepe/homebrew-hangar/releases/download/v#{version}/Hangar-#{version}.dmg"
  name "Hangar"
  desc "Native macOS terminal for AI coding agents (Claude Code, Codex)"
  homepage "https://github.com/henriquepe/hangar"

  depends_on macos: ">= :sequoia"

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
