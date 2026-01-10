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
      sha256 "b62f9bcbcb45271846bb4f0fcb563936ffe129aa7908b9f630b00fe4fe6ff630"
    end

    on_arm do
      url "https://github.com/hiromaily/yaml-lint-rs/releases/download/v#{version}/yaml-lint-aarch64-apple-darwin.tar.gz"
      sha256 "1da584980274ca4167b33b5aa75ef54917356b87a7300f7e517332557dec7e6d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hiromaily/yaml-lint-rs/releases/download/v#{version}/yaml-lint-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e0a7945af1562a94d9fb8305a5107ac4e5101194acb2f7fcaca69514ff9afdd7"
    end

    on_arm do
      url "https://github.com/hiromaily/yaml-lint-rs/releases/download/v#{version}/yaml-lint-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "000d182c3545adff2e62916059020ae03952f37e1e6e2a766cf70401646fdce2"
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
