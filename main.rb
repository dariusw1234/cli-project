require "minitest/autorun"

class Journal < Minitest::Test
  attr_accessor :reply
  @@collection = {}

  def initialize(reply)
    @reply = reply
  end

  def console
    loop do 
      puts "Welcome. What would you like to do today?(type 'create', 'delete', 'view', or 'exit')"
      @reply = gets.chomp
      case @reply.downcase
      when 'create' then self.create
      when 'delete' then self.deletion
      when 'view' then self.view
      when 'exit' then break
      else
        puts "Please type a given response."
      end
    end
  end

  def create
    puts "Enter the date for your entry.(00-00-00)"
    date = gets.chomp
    puts "What's on your mind?"
    body = gets.chomp
    @@collection[date] = body
  end

  def deletion
    puts @@collection.keys
    puts "Enter the date of the entry you wish to delete.(00-00-00)"
    date = gets.chomp
    if @@collection.keys.include?(date)
      @@collection.delete(date)
      puts "Entry deleted."
    else
      puts "Date not found. Try another one."
    end
  end

  def view
    puts @@collection.keys
    unless @@collection.empty?
      puts "Would you like to view an entry?(type 'yes' or 'no')"
      @reply = gets.chomp
      if @reply.downcase == 'yes'
        puts "Enter the date of an entry you'd like to view.(00-00-00)"
        date = gets.chomp
        unless @@collection.include?(date)
          puts "Date not found. Try another one."
        else
          puts @@collection[date]
        end
      end
    else
      puts "There are no entries. Enter 'create' to make a new one."
    end
  end
end

new_entry = Journal.new("")
new_entry.console
