cask "passarc" do
  version "0.1.2"
  sha256 "893724ab3f372a3dae69e428aba59aefc553bf8124a830b35bc8a6a8a2e78970"

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
