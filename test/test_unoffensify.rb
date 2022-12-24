# frozen_string_literal: true

require "test_helper"

class TestUnoffensify < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Unoffensify::VERSION
  end

  def test_check_files_to_change_by_content
    # create enmpty file named black_list.rb
    File.open("tmp/denylist.rb", "w") do |f|
      f.write("class BlackList")
      f.write("end")
    end
    files = Unoffensify.check_files_to_change
    File.delete("tmp/denylist.rb")

    assert_equal ["tmp/denylist.rb"], files
  end

  def test_check_files_to_change
    # create enmpty file named black_list.rb
    File.open("tmp/black_list.rb", "w") {}

    assert_equal ["tmp/black_list.rb"], Unoffensify.check_files_to_change

    #delete file
    File.delete("tmp/black_list.rb")
  end
end
