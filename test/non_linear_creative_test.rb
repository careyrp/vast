# frozen_string_literal: true

require 'test_helper'

class NonLinearCreativeTest < Test::Unit::TestCase
  def test_should_know_attributes
    document_file = example_file('document_with_one_inline_ad.xml')
    document = VAST::Document.parse!(document_file)
    creative = document.inline_ads.first.non_linear_creatives.first

    assert_equal 300, creative.width
    assert_equal 50, creative.height
    assert creative.maintain_aspect_ratio?
  end

  def test_should_know_static_resource
    document_file = example_file('document_with_one_inline_ad.xml')
    document = VAST::Document.parse!(document_file)
    creative_with_static = document.inline_ads.first.non_linear_creatives.first

    assert_equal 'image/jpeg', creative_with_static_resource.creative_type
    url = 'http://cdn.liverail.com/adasset/228/330/overlay.jpg'
    assert_equal url, creative_with_static.resource_url.to_s
  end

  def test_should_know_iframe_resource
    document_file = example_file('document_with_one_inline_ad.xml')
    document = VAST::Document.parse!(document_file)
    creative_with_iframe = document.inline_ads.first.non_linear_creatives.last

    assert_equal :iframe, creative_with_iframe_resource.resource_type
    url = 'http://ad3.liverail.com/util/non_linear.php'
    assert_equal url, creative_with_iframe.resource_url.to_s
  end
end
