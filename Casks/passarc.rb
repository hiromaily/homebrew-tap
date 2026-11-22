cask "passarc" do
  version "0.7.0"
  sha256 "e6568a611791f4f2f16d9a8dbf746e86f6ab0587cdc57915545595609ea55651"

  url "https://github.com/hiromaily/passarc/releases/download/v#{version}/PassArc-arm64.zip"
  name "PassArc"
  desc "Create password-protected archives from Finder"
  homepage "https://github.com/hiromaily/passarc"

  depends_on arch: :arm64
  depends_on macos: :sequoia
  depends_on formula: ["sevenzip", "zstd", "age"]

  app "PassArc.app"

  uninstall quit: "local.passarc.app"

  caveats <<~EOS
    Open PassArc and follow the prompt to enable PassArcFinder.
    You can also find PassArcFinder under System Settings > General > Login Items & Extensions > Finder.
  EOS
end
