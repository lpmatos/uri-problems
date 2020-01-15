#!/usr/bin/ruby

# =============================================================================
# CONSTANTS
# =============================================================================

$alfabeto = (%w(a b c d e f g h i j k l m n o p q r s t u v x z)).map{ |value| value.to_s }

# =============================================================================
# MAIN
# =============================================================================

if __FILE__ == $0
    quantidade = (gets.strip).to_i - 1
    for elemento in 0..quantidade
        frase = (gets.to_s).gsub(" ", "")
        frase = frase.gsub(",", "")
        puts "#{$alfabeto}"
        puts "#{$frase}"
    end
end
