# typed: false
# frozen_string_literal: true

# Homebrew formula for pg2sqlite
# Repository: https://github.com/hiromaily/homebrew-tap
class Pg2sqlite < Formula
  desc "PostgreSQL 16 DDL to SQLite3 DDL schema converter"
  homepage "https://github.com/hiromaily/pg2sqlite-rs"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hiromaily/pg2sqlite-rs/releases/download/v#{version}/pg2sqlite-x86_64-apple-darwin.tar.gz"
      sha256 "3cfcebc27c9f868e2b4838a8a747ca58933ac06ebba821518a25bbcabbdc325c"
    end

    on_arm do
      url "https://github.com/hiromaily/pg2sqlite-rs/releases/download/v#{version}/pg2sqlite-aarch64-apple-darwin.tar.gz"
      sha256 "02c6899bd7a2e3e4b15b89146ee4dc0e3dae009fb4623d582888c2d4ff531c28"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hiromaily/pg2sqlite-rs/releases/download/v#{version}/pg2sqlite-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "775fee5b753f8ddbae32296d6d192ff97318fd0cdec8dad1fb7333f2b6d8250c"
    end

    on_arm do
      url "https://github.com/hiromaily/pg2sqlite-rs/releases/download/v#{version}/pg2sqlite-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "186946a607b40d3160b7204f00dae39e6ff4b055c7384d12d83c178bfbf46275"
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
