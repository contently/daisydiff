require "daisydiff/version"
require 'tempfile'
require 'cocaine'

module DaisyDiff

   def self.strings(html_1, html_2)
    begin
      file_1 = create_tempfile('html_1', html_1)
      file_2 = create_tempfile('html_2', html_2)
      output_file = create_tempfile('html_diff')

      line = ::Cocaine::CommandLine.new("java", "-jar :jar_path :file_1_path :file_2_path --file=:output_file_path")
      # puts line.command
      line.run(:jar_path => File.expand_path(File.dirname(__FILE__) + '/daisydiff/daisydiff.jar'), :file_1_path => file_1.path, :file_2_path => file_2.path, :output_file_path => output_file.path)

      results = output_file.read
    # rescue
      #handle the error here
    ensure
      close_tempfile file_1
      close_tempfile file_2
      close_tempfile output_file
    end

  end

  protected

  def self.create_tempfile(filename, contents=nil)
    tempfile = Tempfile.new(filename)
    tempfile.write(contents) unless contents.nil?
    tempfile
  end

  def self.close_tempfile(tempfile)
    unless tempfile.nil?
      tempfile.close
      tempfile.unlink
    end
  end

end

