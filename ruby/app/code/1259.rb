#!/usr/bin/ruby

if __FILE__ == $0
    quantidade = (gets.strip).to_i - 1
    array = Array.new(quantidade + 1)
    for elemento in 0..quantidade
        value = (gets.strip).to_i
        array[index] = value
    end
    puts "#{array}"
end
