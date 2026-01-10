# typed: false
# frozen_string_literal: true

# Homebrew formula for yaml-lint
# Repository: https://github.com/hiromaily/homebrew-tap
class YamlLint < Formula
  desc "A fast YAML linter written in Rust"
  homepage "https://github.com/hiromaily/yaml-lint-rs"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hiromaily/yaml-lint-rs/releases/download/v#{version}/yaml-lint-x86_64-apple-darwin.tar.gz"
      sha256 "ef43d8482ff64f359638ad90671c6dfeb535038b947ed1144a88f74c27e7064b"
    end

    on_arm do
      url "https://github.com/hiromaily/yaml-lint-rs/releases/download/v#{version}/yaml-lint-aarch64-apple-darwin.tar.gz"
      sha256 "5d2e05f796abbbaecfe19af8a2d628c9e2f3dd4556d65eae951f5db94c7e8186"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hiromaily/yaml-lint-rs/releases/download/v#{version}/yaml-lint-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "afc6eb3008e8395b6e2f9a8cc4e2df613774e84335543459b7d9fedbf98cbc6d"
    end

    on_arm do
      url "https://github.com/hiromaily/yaml-lint-rs/releases/download/v#{version}/yaml-lint-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bfb0be8b68fc781b25fb4cc5d670be5d3c0ffea15e705aaf24c30f243ce92ec6"
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
