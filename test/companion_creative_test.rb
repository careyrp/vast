# frozen_string_literal: true

require 'test_helper'

class CompanionCreativeTest < Test::Unit::TestCase
  def test_should_know_attributes
    document_file = example_file('document_with_one_inline_ad.xml')
    document = VAST::Document.parse!(document_file)
    creative = document.inline_ads.first.companion_creatives.first

    assert_equal 'big_box', creative.id
    assert_equal 'http://www.tremormedia.com', creative.click_through_url.to_s
    assert_equal 'Display this instead of the ad', creative.alt_text
  end

  def test_should_know_static_resource
    document_file = example_file('document_with_one_inline_ad.xml')
    document = VAST::Document.parse!(document_file)
    creative_with_resource = document.inline_ads.first.companion_creatives.first

    assert_equal :static, creative_with_resource.resource_type
    assert_equal 'image/jpeg', creative_with_resource.creative_type
    url = 'http://demo.tremormedia.com/proddev/vast/Blistex1.jpg'
    assert_equal url, creative_with_resource.resource_url.to_s
  end

  def test_should_know_iframe_resource
    document_file = example_file('document_with_one_inline_ad.xml')
    document = VAST::Document.parse!(document_file)
    creative_with_iframe = document.inline_ads.first.companion_creatives.last

    assert_equal :iframe, creative_with_iframe.resource_type
    url = 'http://ad3.liverail.com/util/companions.php'
    assert_equal url, creative_with_iframe.resource_url.to_s
  end
end
