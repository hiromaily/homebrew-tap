# typed: false
# frozen_string_literal: true

# Homebrew formula for yaml-lint
class YamlLint < Formula
  desc "A fast YAML linter written in Rust - 20-60x faster than Python yamllint"
  homepage "https://github.com/hiromaily/yaml-lint-rs"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hiromaily/yaml-lint-rs/releases/download/v#{version}/yaml-lint-x86_64-apple-darwin.tar.gz"
      sha256 "3e7cae5d0092d103c4bf2e29c1cb7fbaf8b272409780c97793840d6e9d8b0292"
    end

    on_arm do
      url "https://github.com/hiromaily/yaml-lint-rs/releases/download/v#{version}/yaml-lint-aarch64-apple-darwin.tar.gz"
      sha256 "ead4c6abae47cc02a6d615a15781b8d68a27aaf73ced8b4384c3a279b3bae470"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hiromaily/yaml-lint-rs/releases/download/v#{version}/yaml-lint-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "be6068ee4bdcb80f2cd4e1e1bbe23905e2162810e4a280b3fc2e9ee6126ae603"
    end

    on_arm do
      url "https://github.com/hiromaily/yaml-lint-rs/releases/download/v#{version}/yaml-lint-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "45e3bf29b6855b20c45b0b6de4613616b08e0738d20c7474345bf53bec430e3f"
    end
  end

  def install
    bin.install "yaml-lint"
  end

  test do
    (testpath/"test.yaml").write <<~EOS
      key: value
      list:
        - item1
        - item2
    EOS
    system "#{bin}/yaml-lint", testpath/"test.yaml"
  end
end
