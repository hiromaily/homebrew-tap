# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class GoBookTeacher < Formula
  desc "find teacher's lesson"
  homepage "https://github.com/hiromaily/go-book-teacher"
  version "1.0.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/hiromaily/go-book-teacher/releases/download/v1.0.0/go-book-teacher_1.0.0_Darwin_x86_64.tar.gz"
    sha256 "ccc1c1930ae2f362ee93134ba1cbeac506a71b82cead205783e2092796020fea"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/hiromaily/go-book-teacher/releases/download/v1.0.0/go-book-teacher_1.0.0_Linux_x86_64.tar.gz"
    sha256 "e8e53c720e6d45fe09092ff3701055bf76f23e3ed5a6997f460d736894c40f62"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/hiromaily/go-book-teacher/releases/download/v1.0.0/go-book-teacher_1.0.0_Linux_arm64.tar.gz"
    sha256 "68ad4a80fe4943c0abeec3a33f53e648b6e09d81509a24325e3b7681194d726e"
  end

  def install
    bin.install "book-teacher"
    etc.install "book-teacher.toml"
    etc.install "book-teacher.json"
  end

  test do
    system "#{bin}/book-teacher -v"
  end
end
