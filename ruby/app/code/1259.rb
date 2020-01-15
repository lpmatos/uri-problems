#!/usr/bin/ruby

if __FILE__ == $0
    quantidade = (gets.strip).to_i - 1
    array = Array.new(quantidade + 1)
    for elemento in 0..quantidade
        value = (gets.strip).to_i
        array.each_with_index do | content, index |
            array[index] = value
        end
    end
    puts "#{array}"
end
