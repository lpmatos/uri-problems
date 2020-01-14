#!/usr/bin/ruby

# =============================================================================
# CONSTANTS
# =============================================================================

$LEDS = (%w(2 5 5 4 5 6 3 7 6 6)).map{ |value| value.to_i }
$VALUES = Array.new(10)

# =============================================================================
# MAIN
# =============================================================================

if __FILE__ == $0
    quantidade = (gets.strip).to_i - 1
    for elemento in 0..quantidade
        number = ((gets.strip).split("")).map(&:to_i)
        number.each_with_index do |value, index|
            $VALUES[index] = $LEDS[value - 1]
        end
        puts "#{$VALUES}"
    end
end
