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
    # GETTING QUANTIDADE
    quantidade = (gets.strip).to_i - 1
    # LOOP QUANTIDADE
    for elemento in 0..quantidade
        # GETTING NUMBER
        number = (gets.strip).split("")
        # LOOP
        number.each do |value|
            number[value.to_i] = $LEDS[value.to_i]
        end
        # SHOW
        puts "#{number}"
    end
end
