# frozen_string_literal: true

require_relative "unoffensify/version"

module Unoffensify
  class Error < StandardError; end
  Terms = ['blacklist', 'black_list', 'white_list'].freeze


  def self.check_files_to_change
    files = []
    Dir.glob("tmp/*.rb") do |file|
      content = File.open(file, "r") { |f| f.read }

      file_name = File.basename(file)
      Terms.each do |term|
        files << file if file_name.match(/#{term}/i)
        files << file if content.match(/#{term}/i)
      end
    end

    files
  end
end
