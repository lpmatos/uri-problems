#!/usr/bin/ruby

# =============================================================================
# CONSTANTS
# =============================================================================

$LEDS = (%w(2 5 5 4 5 6 3 7 6 6)).map{ |value| value.to_i }

# =============================================================================
# FUNCTIONS
# =============================================================================

def sum(array)
    return array.inject(0){ |sum, value| sum + value } # inject (value_initial) { |result_memo, object| block }
end

# =============================================================================

def compact(array)
    return array.count(nil) > 0 ? array.compact : array # condition ? statement_A (yes) : statement_B (no)
end

# =============================================================================
# MAIN
# =============================================================================

if __FILE__ == $0
    quantidade = (gets.strip).to_i - 1
    for elemento in 0..quantidade
        $VALUES = Array.new(10)
        number = ((gets.strip).split("")).map(&:to_i)
        number.each_with_index do |value, index|
            $VALUES[index] = $LEDS[value - 1]
        end
        puts "#{sum(compact($VALUES))} leds"
    end
end
