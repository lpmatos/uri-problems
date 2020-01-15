#!/usr/bin/ruby

if __FILE__ == $0
    quantidade = (gets.strip).to_i
    array = Array.new(quantidade)
    array.each_with_index do |content, index|
        array[index] = (gets.strip).to_i
    end
    puts "#{array}"
end
