# require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'spec_helper'

describe "DaisyDiff" do
  it "working" do
    html1 = <<-HTML
"<p>I got some text here.<p>"
    HTML
    html2 = <<-HTML
"<p>I got <i>even more</i> text here.</p>"
    HTML

    puts DaisyDiff.strings(html1, html2)

  end
end
