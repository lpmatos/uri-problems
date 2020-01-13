#!/usr/bin/ruby

def soma(first, last)
    return if first.kind_of? Integer and last.kind_of? Integer then first + last else "" end
end

if __FILE__ == $0
    first = (gets.strip).to_i
    last = (gets.strip).to_i
    puts "X = #{soma(first, last)}"
end 
