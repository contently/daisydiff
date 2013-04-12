# require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'spec_helper'

describe "DaisyDiff" do
  it "works?" do
    html1 = <<-HTML
"<p>I got some text here.<p>"
    HTML
    html2 = <<-HTML
"<p>I got <i>even more</i> text here.</p>"
    HTML

    puts DaisyDiff.strings(html1, html2)

  end

  it "works again" do
    # file_1 = File.new File.expand_path(File.dirname(__FILE__) + '/fixtures/example_1_1.html')
    # file_2 = File.new File.expand_path(File.dirname(__FILE__) + '/fixtures/example_1_2.html')
    # output_file_path = File.expand_path(File.dirname(__FILE__) + '/fixtures/example_1_diff.html')

    # line = ::Cocaine::CommandLine.new("java", "-jar :jar_path :file_1_path :file_2_path --file=:output_file_path")
    # # puts line.command
    # line.run(:jar_path => File.expand_path(File.dirname(__FILE__) + '/../lib/daisydiff/daisydiff.jar'), :file_1_path => file_1.path, :file_2_path => file_2.path, :output_file_path => output_file_path)
  end
end
