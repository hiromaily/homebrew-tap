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
    sha256 "7897e9827b1a7540e63df1483d81ef2ac1c851b6af0b49ea815c28fe181418ad"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/hiromaily/go-book-teacher/releases/download/v1.0.0/go-book-teacher_1.0.0_Linux_x86_64.tar.gz"
    sha256 "f5e42a4f7482dbd625771c705cc39ad452a7809ac5108f9f13eebd30ad31bd6c"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/hiromaily/go-book-teacher/releases/download/v1.0.0/go-book-teacher_1.0.0_Linux_arm64.tar.gz"
    sha256 "3712c4acbc92268af1b20b743df6b20b7c36391467e568d1230e8461f82f1c39"
  end

  def install
    bin.install Dir['*']
  end

  test do
    system "#{bin}/book-teacher -v"
  end
end
