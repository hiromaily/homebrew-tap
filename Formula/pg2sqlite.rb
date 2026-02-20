# typed: false
# frozen_string_literal: true

# Homebrew formula for pg2sqlite
# Repository: https://github.com/hiromaily/homebrew-tap
class YamlLint < Formula
  desc "A fast YAML linter written in Rust"
  homepage "https://github.com/hiromaily/pg2sqlite-rs"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hiromaily/pg2sqlite-rs/releases/download/v#{version}/pg2sqlite-x86_64-apple-darwin.tar.gz"
      sha256 "58c959aa84bc0f3432838aac7e96ba688dddc6305bea169b1596cbf950b180f5"
    end

    on_arm do
      url "https://github.com/hiromaily/pg2sqlite-rs/releases/download/v#{version}/pg2sqlite-aarch64-apple-darwin.tar.gz"
      sha256 "c94c14162ef4fc83035c55f15f55e5666b4606af98b51a3a00f0f53df6592b84"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hiromaily/pg2sqlite-rs/releases/download/v#{version}/pg2sqlite-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "07c04e551ba18b2355218bf95a079963e7dfefdc0c442347259c2bfba6727ed9"
    end

    on_arm do
      url "https://github.com/hiromaily/pg2sqlite-rs/releases/download/v#{version}/pg2sqlite-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e8e05dc39b4c36c2d8ad868a4ea720c8881857861dd8c5e87d66b3a4aef96009"
    end
  end

  def install
    bin.install "pg2sqlite"
  end

  test do
    # Create a test YAML file
    (testpath/"test.yaml").write <<~EOS
      key: value
      list:
        - item1
        - item2
    EOS

    # Run pg2sqlite and check it exits successfully
    system "#{bin}/pg2sqlite", testpath/"test.yaml"
  end
end
