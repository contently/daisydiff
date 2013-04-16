require 'nokogiri'

class DaisyDiff::Result

  attr_reader :html

  def initialize(result_text)
    doc = Nokogiri::HTML.parse result_text
    body = doc.css('body')
    body.css('script').remove
    body.css('div.diff-topbar').remove
    
    body.xpath("//@*[starts-with(name(.), 'on')]").remove # Remove any daisy diff ui js handler
    # body.xpath('//@id').remove
    # body.xpath('//@changeid').remove
    # body.xpath('//@previous').remove
    # body.xpath('//@next').remove

    # body.xpath('//@changes').remove

    @html = body.inner_html
  end

end
