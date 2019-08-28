# frozen_string_literal: true

require 'test_helper'

class LinearCreativeTest < Test::Unit::TestCase
  def test_should_know_attributes
    document_file = example_file('document_with_one_inline_ad.xml')
    document = VAST::Document.parse!(document_file)
    creative = document.inline_ads.first.linear_creatives.first

    click_url = 'http://myTrackingURL/click1'
    assert_equal click_url, creative.click_tracking_urls.first.to_s
    custom_url = 'http://myTrackingURL/custom2'
    assert_equal custom_url, creative.custom_click_urls[:custom_two].to_s
  end

  def test_should_have_mediafiles
    document_file = example_file('document_with_one_inline_ad.xml')
    document = VAST::Document.parse!(document_file)
    creative = document.inline_ads.first.linear_creatives.first

    assert creative.mediafiles.first.is_a?(VAST::Mediafile)
  end
end
