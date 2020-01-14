#!/usr/bin/ruby

# =============================================================================
# CONSTANTS
# =============================================================================

$LEDS = (%w(2 5 5 4 5 6 3 7 6 6)).map{ |value| value.to_i } 

# =============================================================================
# FUNCTIONS
# =============================================================================

# =============================================================================
# MAIN
# =============================================================================

if __FILE__ == $0
    count = (gets.strip).to_i - 1
    for elemento in 0..count
        puts "#{$LEDS}"
    end
end
