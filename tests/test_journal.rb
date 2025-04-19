require "minitest/autorun"
require "./main"

class TestJournal < Minitest::Test
  @@collection = {}
  def test_create
    journal = Journal.new("")
    assert_equal @@collection = "so cold outside", journal.create, "Creation failed"
  end
  #checks to see if @@collection contains the assigned phrase when typed by the user

  def test_deletion
    journal = Journal.new("")
    assert_equal @@collection = nil, journal.deletion, "Deletion failed"
  end
  #checks to see if @@collection contains nothing after deleting a previously created entry
end


  
