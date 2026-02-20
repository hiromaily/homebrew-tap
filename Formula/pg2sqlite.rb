# typed: false
# frozen_string_literal: true

# Homebrew formula for pg2sqlite
# Repository: https://github.com/hiromaily/homebrew-tap
class Pg2sqlite < Formula
  desc "PostgreSQL 16 DDL to SQLite3 DDL schema converter"
  homepage "https://github.com/hiromaily/pg2sqlite-rs"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hiromaily/pg2sqlite-rs/releases/download/v#{version}/pg2sqlite-x86_64-apple-darwin.tar.gz"
      sha256 "24d34e1096e795c1cc4366a9dad254eedb9082a11177bb7078c347fce32afa60"
    end

    on_arm do
      url "https://github.com/hiromaily/pg2sqlite-rs/releases/download/v#{version}/pg2sqlite-aarch64-apple-darwin.tar.gz"
      sha256 "cd9a6dd78ab4b8618e8a59a9b94527efbddfa20be9e39472b718526ce0b33e79"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hiromaily/pg2sqlite-rs/releases/download/v#{version}/pg2sqlite-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3f899dc6b452837156d1df57f923d3f7df81603425ff6894ea245ec1832e541d"
    end

    on_arm do
      url "https://github.com/hiromaily/pg2sqlite-rs/releases/download/v#{version}/pg2sqlite-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "525b4ae91c2e3df4cd98e204aab5cb1379aa18f137dc2cd284887461574dca70"
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
