cask "passarc" do
  version "0.1.0"
  sha256 "3da9b42f698bbd8993f491fd874d377418e9d18d9513dba5d5b30d053357d3a2"

  url "https://github.com/hiromaily/passarc/releases/download/v#{version}/PassArc-arm64.zip"
  name "PassArc"
  desc "Create password-protected archives from Finder"
  homepage "https://github.com/hiromaily/passarc"

  depends_on arch: :arm64
  depends_on macos: :sequoia
  depends_on formula: ["sevenzip", "zstd"]

  app "PassArc.app"

  uninstall quit: "local.passarc.app"

  postflight do
    bundle = appdir/"PassArc.app"
    system_command "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister",
                   args: ["-f", bundle]
    system_command "/usr/bin/pluginkit", args: ["-a", bundle/"Contents/PlugIns/PassArcFinder.appex"]
  end

  uninstall_preflight do
    system_command "/usr/bin/pluginkit",
                   args: ["-r", appdir/"PassArc.app/Contents/PlugIns/PassArcFinder.appex"],
                   must_succeed: false
  end

  caveats <<~EOS
    Enable PassArcFinder under System Settings > General > Login Items & Extensions > Finder.
  EOS
end
