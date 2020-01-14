#!/usr/bin/ruby

# =============================================================================
# CONSTANTS
# =============================================================================

$LEDS = (%w(2 5 5 4 5 6 3 7 6 6)).map{ |value| value.to_i } 

# =============================================================================
# FUNCTIONS
# =============================================================================

def sum(array)
    return array.inject(0){|sum, value| sum + value }
end

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
        # INICIALIZA ARRAY
        values = Array.new
        # LOOP
        number.each do |value|
            values.push($LEDS[value.to_i])
        end
        # TIRA NULOS
        values = values.compact
        # SHOW
        puts "#{sum(values)} leds"
    end
end
