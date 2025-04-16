class Journal
  @@collection = {}

  def create
    puts "date"
    date = gets.chomp
    puts "body"
    body = gets.chomp
    @@collection[date] = body
  end

  def edit
    puts "enter date of entry you wish to edit"
    date = gets.chomp
    puts "please edit- your previous entry will be overidden"
    body = gets.chomp
    @@collection[date] = body
  end

  def deletion
    puts "enter date of entry you wish to delete"
    date = gets.chomp
    if @@collection.keys.include?(date)
      @@collection.delete(@@collection[date])
    end
  end

  def view
    puts @@collection.keys
  end

end
