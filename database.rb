require "./journal.rb"

puts "welcome. would you like to journal today?"
response = gets.chomp

while response == 'y'
  puts "what do you wanna do (create, delete, view, exit)"
  select = gets.chomp
  unless select == 'exit'
    while select == 'create'
      entry = Journal.new.create
      puts "another?"
      another = gets.chomp
      unless another == 'y'
        break
      end
    end 
      
    while select == 'delete'
      entry = Journal.new.deletion
      puts "another?"
      another = gets.chomp
      unless another == 'y'
        break
      end
    end
      
    while select == 'view'
      entry = Journal.new.view
      puts "keep viewing?"
      answer = gets.chomp
      unless answer == 'y'
        break
      end
    end  
  else
    break
  end
end
