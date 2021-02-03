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
    sha256 "d6ba64e321f1c0d946cc8e03bde7ecc2f26cb18d9666c94466140fef0916f72e"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/hiromaily/go-book-teacher/releases/download/v1.0.0/go-book-teacher_1.0.0_Linux_x86_64.tar.gz"
    sha256 "29cfbbe64940b5682bdf542f89eda9e66b3cf41626bf41407b317beb3704bb8d"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/hiromaily/go-book-teacher/releases/download/v1.0.0/go-book-teacher_1.0.0_Linux_arm64.tar.gz"
    sha256 "4d17e872b3649bb666e3a93a811cebf2461ad63e46b980b8b37361ab3da17ae7"
  end

  def install
    bin.install Dir['*']
  end

  test do
    system "#{bin}/book-teacher -v"
  end
end
