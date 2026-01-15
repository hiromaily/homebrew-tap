# typed: false
# frozen_string_literal: true

# Homebrew formula for yaml-lint
# Repository: https://github.com/hiromaily/homebrew-tap
class YamlLint < Formula
  desc "A fast YAML linter written in Rust"
  homepage "https://github.com/hiromaily/yaml-lint-rs"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hiromaily/yaml-lint-rs/releases/download/v#{version}/yaml-lint-x86_64-apple-darwin.tar.gz"
      sha256 "ff3b9e9cbcd4f6ad5b74e2da1bb0197651083794dfd1f2b82e87f7b4dd413ec2"
    end

    on_arm do
      url "https://github.com/hiromaily/yaml-lint-rs/releases/download/v#{version}/yaml-lint-aarch64-apple-darwin.tar.gz"
      sha256 "d5a6d77ff02fa1a433ac979b961e316180300ca055f4fd7b54f2f0bcbfc0a269"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hiromaily/yaml-lint-rs/releases/download/v#{version}/yaml-lint-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3ce8658b21df38b1f778fd440613a9634386d26b606c04e3c36a2cce1b6e5162"
    end

    on_arm do
      url "https://github.com/hiromaily/yaml-lint-rs/releases/download/v#{version}/yaml-lint-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "482b5e71dbe71a1c9878bae18b247d258023ddf4eecff1ccc859ddcd6fa867b1"
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
