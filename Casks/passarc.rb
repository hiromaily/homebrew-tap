cask "passarc" do
  version "0.1.1"
  sha256 "259a80c74eb208dfd59e2bf6b1e5d6368548dc34b586f0fe57364ee3edd73d94"

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
    Open PassArc once so macOS can discover its Finder extension.
    Enable PassArcFinder under System Settings > General > Login Items & Extensions > Finder.
  EOS
end
