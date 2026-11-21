cask "passarc" do
  version "0.3.0"
  sha256 "2dea28a06dacb8d178c025ba9d62eb93b4c4120c4468e9e589201f3fa819174e"

  url "https://github.com/hiromaily/passarc/releases/download/v#{version}/PassArc-arm64.zip"
  name "PassArc"
  desc "Create password-protected archives from Finder"
  homepage "https://github.com/hiromaily/passarc"

  depends_on arch: :arm64
  depends_on macos: :sequoia
  depends_on formula: ["sevenzip", "zstd"]

  app "PassArc.app"

  uninstall quit: "local.passarc.app"

  caveats <<~EOS
    Open PassArc and follow the prompt to enable PassArcFinder.
    You can also find PassArcFinder under System Settings > General > Login Items & Extensions > Finder.
  EOS
end
