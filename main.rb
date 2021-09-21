require_relative 'enumerable'

puts 'my_each vs each'
numbers = [1, 2, 3, 4, 5]
numbers.each { |item| puts item }
puts "\n"
numbers.my_each { |item| puts item }

puts 'my each with index vs each with index'
numbers.each_with_index { |item, index| puts item, index }
puts "\n"
numbers.my_each_with_index { |item, index| puts item, index }

puts 'my select vs select'
puts numbers.select { |item| item.even? }
puts "\n"
puts numbers.my_select { |item| item.even? }

puts 'my all vs all'
puts numbers.all? { |item| item.even? }
puts "\n"
puts numbers.my_all? { |item| item.even? }

puts 'my any vs any'
puts numbers.any? { |item| item.even? }
puts "\n"
puts numbers.my_any? { |item| item.even? }

puts 'my none vs none'
puts numbers.none? { |item| item.even? }
puts "\n"
puts numbers.my_none? { |item| item.even? }

puts 'my count vs count'
puts numbers.count { |item| item.even? }
puts "\n"
puts numbers.my_count { |item| item.even? }

puts 'my map vs map'
puts numbers.map { |item| item * item }
puts "\n"
puts numbers.my_map { |item| item * item }

puts 'my inject vs inject'
puts numbers.inject { |i, n| i + n }
puts "\n"
puts numbers.my_inject { |i, n| i + n }

puts 'multiply els'
multiply = [0]
puts multiply.multiply_els([2, 4, 5])

puts 'my_map_proc'
map_proc = proc { |item| item * item }
puts numbers.my_map_proc(map_proc)

puts 'my map options'
map_proc_options = proc { |item| item + item }
puts numbers.my_map_options { |item| item * item }
puts "\n"
puts numbers.my_map_options(&map_proc_options)
