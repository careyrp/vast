# frozen_string_literal: true

require 'test_helper'

class Vast3InlineAdTest < Test::Unit::TestCase
  def test_ad_should_know_attributes
    document_file = example_file('vast3_inline.xml')
    document = VAST::Document.parse!(document_file)

    inline_ad = document.inline_ads.first

    assert_equal 3, document.inline_ads.length
    assert_equal '3.0', document.xpath('/VAST/@version').first.value
    assert_equal 'Ooyla test m3u8 midroll 1', inline_ad.ad_title
  end
end
