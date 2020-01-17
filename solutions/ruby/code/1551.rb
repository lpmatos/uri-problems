#!/usr/bin/ruby

# =============================================================================
# CONSTANTS
# =============================================================================

$ALFABETO = 26

# =============================================================================
# FUNCTIONS
# =============================================================================

def core(value)
    if value.kind_of? Integer
        if value == $ALFABETO
            puts "frase completa"
        elsif value >= $ALFABETO/2 and value < $ALFABETO
            puts "frase quase completa"
        else
            puts "frase mal elaborada"
        end
    end
end

# =============================================================================
# MAIN
# =============================================================================

if __FILE__ == $0
    quantidade = (gets.strip).to_i - 1
    for elemento in 0..quantidade
        frase = ((gets.chop).to_s).gsub(",", "")
        if frase.length < 3 and frase.length > 1000
            exit
        end
        words = ((frase.gsub(" ", "")).split("").uniq).size
        core(words)
    end
end
