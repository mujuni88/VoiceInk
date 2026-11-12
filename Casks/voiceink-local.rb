cask "voiceink-local" do
  version :latest
  sha256 :no_check

  url "https://github.com/mujuni88/VoiceInk/releases/download/local-build/VoiceInk-local.zip"
  name "VoiceInk (Local Build)"
  desc "Voice-to-text app built from source with the unrestricted LOCAL_BUILD flag"
  homepage "https://github.com/mujuni88/VoiceInk"

  conflicts_with cask: "voiceink"
  depends_on macos: :sonoma

  app "VoiceInk.app"

  caveats <<~EOS
    This build is ad-hoc signed, so install it without Gatekeeper quarantine:

      brew install --cask --no-quarantine voiceink-local

    Automatic updates are disabled in local builds. To upgrade, run the
    "Build Local App" workflow on GitHub, then:

      brew reinstall --cask --no-quarantine voiceink-local
  EOS

  zap trash: [
    "~/Library/Application Support/com.prakashjoshipax.VoiceInk",
    "~/Library/Preferences/com.prakashjoshipax.VoiceInk.plist",
  ]
end
