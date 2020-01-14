#!/usr/bin/ruby

# =============================================================================
# FUNCTIONS
# =============================================================================

def filter(array)
    puts "#{array}"
    return ((array.map{ |valor| valor if valor % 2 == 0 }).compact).size
end

# =============================================================================
# MAIN
# =============================================================================

if __FILE__ == $0
    values = Array.new(5)
    values.each_with_index do |value, index|
        values[index] = (gets.strip).to_i
    end
    puts "#{filter(values)} valores pares"
end
