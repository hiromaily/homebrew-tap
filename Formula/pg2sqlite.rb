# typed: false
# frozen_string_literal: true

# Homebrew formula for pg2sqlite
# Repository: https://github.com/hiromaily/homebrew-tap
class Pg2sqlite < Formula
  desc "PostgreSQL 16 DDL to SQLite3 DDL schema converter"
  homepage "https://github.com/hiromaily/pg2sqlite-rs"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hiromaily/pg2sqlite-rs/releases/download/v#{version}/pg2sqlite-x86_64-apple-darwin.tar.gz"
      sha256 "f3995301d9b6842c61c784af305a30d1d8cc022dc6410aad61efcace00e923e6"
    end

    on_arm do
      url "https://github.com/hiromaily/pg2sqlite-rs/releases/download/v#{version}/pg2sqlite-aarch64-apple-darwin.tar.gz"
      sha256 "3ace384397ee85667c508b00759aa76f2515b33ee50e7dfef9a8d7fbfabbccd1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hiromaily/pg2sqlite-rs/releases/download/v#{version}/pg2sqlite-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2c39871ca7fc01cbfb2212ea6eac48e7c7df47e5b4ece2716631cc71b4f191fa"
    end

    on_arm do
      url "https://github.com/hiromaily/pg2sqlite-rs/releases/download/v#{version}/pg2sqlite-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6cd902c735207f0591ac4749748cfc9bf970afe283bee1a5b44360fb809bdee9"
    end
  end

  def install
    bin.install "pg2sqlite"
  end

  test do
    # Create a test PostgreSQL DDL file
    (testpath/"test.sql").write <<~EOS
      CREATE TABLE users (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL
      );
    EOS

    # Run pg2sqlite and check it produces output
    output = shell_output("#{bin}/pg2sqlite -i #{testpath}/test.sql")
    assert_match "CREATE TABLE", output
  end
end
