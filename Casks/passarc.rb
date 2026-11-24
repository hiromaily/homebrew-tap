cask "passarc" do
  version "0.7.4"
  sha256 "42df8e6cb3f3de0f6fad0fa49b4c3068053877ce7f3abc7213902c52d042d8c1"

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
