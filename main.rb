class Journal 
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
    puts "Enter the date for your entry."
    date = self.ask_date
    puts "What's on your mind?"
    body = gets.chomp
    @@collection[date] = body
  end

  def ask_date
    loop do
      puts "Month?(00)"
      @month = gets.chomp
      if @month =~ /[a-z]/
        puts "Please use numbers."
      elsif @month.length == 2 && @month.to_i <= 12
        break
      else
        puts "Invalid. Please follow the format (00)"
      end
    end

    loop do
      puts "Day?(00)"
      @day = gets.chomp
      if @day =~ /[a-z]/
        puts "Please use numbers."
      elsif @day.length == 2 && @day.to_i <= 31
        break
      else
        puts "Invalid. Please follow the format (00)"
      end
    end

    loop do
      puts "Year?(00)"
      @year = gets.chomp
      if @year =~ /[a-z]/
        puts "Please use numbers."
      elsif @year.length == 2
        break
      else
        puts "Invalid. Please follow the format (00)"
      end
    end
    return "#{@month}-#{@day}-#{@year}"
  end

  def deletion
    puts @@collection.keys
    loop do
      puts "Enter the date of the entry you wish to delete.(00-00-00; please include dashes)"
      date = gets.chomp
      if @@collection.keys.include?(date)
        @@collection.delete(date)
        puts "Entry deleted."
        break
      else
        puts "Date not found. Try another one."
      end
    end
  end

  def view
    puts @@collection.keys
    unless @@collection.empty?
      puts "Would you like to view an entry?(type 'yes' or 'no')"
      @reply = gets.chomp
      if @reply.downcase == 'yes'
        loop do
          puts "Enter the date of an entry you'd like to view.(00-00-00; please include dashes)"
          date = gets.chomp
          unless @@collection.include?(date)
            puts "Invalid entry. Try another one."
          else
            puts @@collection[date]
            break
          end
        end
      elsif @reply == 'no'
        puts "Returning home."
      else
        puts "Invalid response. Returning home."
      end
    else
      puts "There are no entries. Enter 'create' to make a new one."
    end
  end
end

new_entry = Journal.new("")
new_entry.console
