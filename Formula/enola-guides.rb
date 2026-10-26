# Written by the release workflow from packaging/homebrew/enola-guides.rb.in
# in misabegovic/enola-guides; edit it there.
class EnolaGuides < Formula
  desc "Guides, examples, laws, skills and templates for enola, from one command"
  homepage "https://github.com/misabegovic/enola-guides"
  url "https://github.com/misabegovic/enola-guides/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "1f0e8892fa5806a163fe8bc5f9f1dc8869bcc139804917ed46f66313001b4168"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/enola-guides"
  end

  test do
    assert_equal "enola-guides #{version}", shell_output("#{bin}/enola-guides version").strip
    assert_match "laws/foreign-keys", shell_output("#{bin}/enola-guides list laws")
  end
end
