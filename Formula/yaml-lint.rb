# typed: false
# frozen_string_literal: true

# Homebrew formula for yaml-lint
# Repository: https://github.com/hiromaily/homebrew-tap
class YamlLint < Formula
  desc "A fast YAML linter written in Rust"
  homepage "https://github.com/hiromaily/yaml-lint-rs"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hiromaily/yaml-lint-rs/releases/download/v#{version}/yaml-lint-x86_64-apple-darwin.tar.gz"
      sha256 "85596e0b0128d18a8c362890974ac2e0b5b804fe37f450c91307670398e75ea0"
    end

    on_arm do
      url "https://github.com/hiromaily/yaml-lint-rs/releases/download/v#{version}/yaml-lint-aarch64-apple-darwin.tar.gz"
      sha256 "ac0d92f3feb7dde914b307b3e13d5bf37059adadc4445f2edd21ad448bab5076"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hiromaily/yaml-lint-rs/releases/download/v#{version}/yaml-lint-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "704a0eba8cead9756d5b55da78e9b634cd834683723a713797cc43f759f18c34"
    end

    on_arm do
      url "https://github.com/hiromaily/yaml-lint-rs/releases/download/v#{version}/yaml-lint-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "15fd45a7c51753c50ab7e0059f640c6ee6151a6412c2414bbfa015674fab2432"
    end
  end

  def install
    bin.install "yaml-lint"
  end

  test do
    # Create a test YAML file
    (testpath/"test.yaml").write <<~EOS
      key: value
      list:
        - item1
        - item2
    EOS

    # Run yaml-lint and check it exits successfully
    system "#{bin}/yaml-lint", testpath/"test.yaml"
  end
end
