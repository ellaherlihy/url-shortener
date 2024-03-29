require "test_helper"

class MetadataTest < ActiveSupport::TestCase

  test "title attribute" do
    assert_equal "Hello", Metadata.new("<title>Hello</title>").title
  end

  test "missing title attribute" do
    assert_nil Metadata.new.title
  end

  test "meta description" do
    assert_equal "blog post", Metadata.new("<meta name='description' content='blog post'>").description
  end

  test "missing meta description" do
    assert_nil Metadata.new.description
  end

  test "og:image attribute" do
    assert_equal "https//:example.org/favicon.ico", Metadata.new("<meta property='og:image' content='https//:example.org/favicon.ico'>").image
  end

  test "missing og:image attribute" do
    assert_nil Metadata.new.image
  end
end
