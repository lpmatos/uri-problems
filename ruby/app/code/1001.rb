#!/usr/bin/ruby

def soma(first, last)
    if first.kind_of? Integer and last.kind_of? Integer
        return first + last
    end
end

if __FILE__ == $0
    first = (gets.strip).to_i
    last = (gets.strip).to_i
    puts "X = #{soma(first, last)}"
end 
