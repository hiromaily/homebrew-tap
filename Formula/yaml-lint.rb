# typed: false
# frozen_string_literal: true

# Homebrew formula for yaml-lint
# Repository: https://github.com/hiromaily/homebrew-tap
class YamlLint < Formula
  desc "A fast YAML linter written in Rust"
  homepage "https://github.com/hiromaily/yaml-lint-rs"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hiromaily/yaml-lint-rs/releases/download/v#{version}/yaml-lint-x86_64-apple-darwin.tar.gz"
      sha256 "2f8b0dcd435d36a64b5c388c413a836885a4386939d6466e8d16cc86a9b6035a"
    end

    on_arm do
      url "https://github.com/hiromaily/yaml-lint-rs/releases/download/v#{version}/yaml-lint-aarch64-apple-darwin.tar.gz"
      sha256 "ff3d8333a8093859f0f90a0dc30759db4c3f5109e18a58101f0a62d80e512c97"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hiromaily/yaml-lint-rs/releases/download/v#{version}/yaml-lint-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5f7d431fa059cbb3eaf01bc3a146a2b00a158724e43feb2ff38a59dafe3eb2c6"
    end

    on_arm do
      url "https://github.com/hiromaily/yaml-lint-rs/releases/download/v#{version}/yaml-lint-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "56b933457d59b3b457d0fe54ace03f177fffbbf84fe8724ae2b12926574d09bc"
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
