# frozen_string_literal: true

require 'test_helper'

class MediafileTest < Test::Unit::TestCase
  def test_should_know_attributes
    document_file = example_file('document_with_one_inline_ad.xml')
    document = VAST::Document.parse!(document_file)
    mediafile = VAST::Mediafile.new(document.at('MediaFile'))

    vurl = 'http://cdnp.tremormedia.com/video/acudeo/Carrot_400x300_500kb.flv'
    assert_equal vurl, mediafile.url.to_s
    assert_equal 500, mediafile.bitrate
    assert mediafile.maintain_aspect_ratio?
  end
end
