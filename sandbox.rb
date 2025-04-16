require "./classes/journal.rb"
puts "welcome. would you like to journal today?"
response = gets.chomp
puts "what do you wanna do (create, edit, delete, view)"
select = gets.chomp
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
