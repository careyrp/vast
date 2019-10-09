# frozen_string_literal: true

require 'test/unit'
require 'rubygems'
require 'bundler'

Bundler.setup(:default, :test)
Bundler.require(:default, :test)

require 'vast'

def example_file(filename)
  file_path = File.expand_path(File.join(__dir__, 'examples', filename))
  File.read file_path
end
