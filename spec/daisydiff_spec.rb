# require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'spec_helper'

require 'terrapin'
require 'ruby-prof'
require 'benchmark'


describe "DaisyDiff" do
  it "works?" do
    html1 = <<-HTML
<p>I got some text here.<p>
    HTML

    html2 = <<-HTML
<p>I got <i>even more</i> text here.</p>
    HTML

    puts DaisyDiff.strings(html1, html2)

  end

  it "works again" do
    file_1 = File.new File.expand_path(File.dirname(__FILE__) + '/fixtures/example_1_1.html')
    file_2 = File.new File.expand_path(File.dirname(__FILE__) + '/fixtures/example_1_2.html')

    # RubyProf.start

    before = get_memory_usage
    puts "BEFORE: #{before}"

    Benchmark.bm do |x|
       x.report("diff") {
        100.times {
          benchmark_test(file_1, file_2)
        }
      }
    end

    after = get_memory_usage
    puts "AFTER: #{after}"
    puts "DIFF: #{after-before}"

    # result = RubyProf.stop
    # printer = RubyProf::GraphHtmlPrinter.new(result)
    # printer.print(File.expand_path(File.dirname(__FILE__) + '/prof.html'), :min_percent => (ENV['MIN_PERCENT'] || 0.1).to_f)

    # printer = RubyProf::GraphPrinter.new(result)
    # printer.print(STDOUT, :min_percent => 2)

  end


  def get_memory_usage
    `ps -o rss= -p #{Process.pid}`.to_i
  end

  def benchmark_test(file_1, file_2)
    output_file = Tempfile.new('example_1_diff.html')
    line = Terrapin::CommandLine.new("java", "-jar :jar_path :file_1_path :file_2_path --file=:output_file_path")
    line.run(:jar_path => File.expand_path(File.dirname(__FILE__) + '/../lib/daisydiff/daisydiff.jar'), :file_1_path => file_1.path, :file_2_path => file_2.path, :output_file_path => output_file.path)
  end

end
