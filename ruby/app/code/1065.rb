#!/usr/bin/ruby

# =============================================================================
# FUNCTIONS
# =============================================================================

def filter(array)
    return (array.map{ |valor| valor % 2 == 0 }).size
end

# =============================================================================
# MAIN
# =============================================================================

if __FILE__ == $0
    values = Array.new(5)
    for elemento in 0..4
        values[elemento] = (gets.strip).to_i
    end
    puts "#{values}"
end
