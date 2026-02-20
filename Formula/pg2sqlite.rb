# typed: false
# frozen_string_literal: true

# Homebrew formula for pg2sqlite
# Repository: https://github.com/hiromaily/homebrew-tap
class Pg2sqlite < Formula
  desc "PostgreSQL 16 DDL to SQLite3 DDL schema converter"
  homepage "https://github.com/hiromaily/pg2sqlite-rs"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hiromaily/pg2sqlite-rs/releases/download/v#{version}/pg2sqlite-x86_64-apple-darwin.tar.gz"
      sha256 "bb78b96dd1fd0cf9caa5f1e9ca327dc0db38f6a6048cb05e3d0b04e377b53518"
    end

    on_arm do
      url "https://github.com/hiromaily/pg2sqlite-rs/releases/download/v#{version}/pg2sqlite-aarch64-apple-darwin.tar.gz"
      sha256 "5f9be61869ebf183e26bc4c11d5365958b49e57fae8ec236314b6907faa6b812"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hiromaily/pg2sqlite-rs/releases/download/v#{version}/pg2sqlite-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9af4f9d4f95d91cce5aad09e6f5985ec689482cf21f839d6b1b7a63e50d8593d"
    end

    on_arm do
      url "https://github.com/hiromaily/pg2sqlite-rs/releases/download/v#{version}/pg2sqlite-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "68d3d26e56baec27c3c6a5729af68281fbc170909034bc83c43ee6f52b8dd7d7"
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
