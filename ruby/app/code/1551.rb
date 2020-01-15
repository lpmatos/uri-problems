#!/usr/bin/ruby

# =============================================================================
# CONSTANTS
# =============================================================================

$alfabeto = (%w(a b c d e f g h i j k l m n o p q r s t u v x z)).map{ |value| value.to_s }

# =============================================================================

def exit(value)
    if value.length < 3 and value.length > 1000
        exit
    end
end

# =============================================================================
# MAIN
# =============================================================================

if __FILE__ == $0
    quantidade = (gets.strip).to_i - 1
    for elemento in 0..quantidade
        frase = ((gets.chop).to_s).gsub(",", "") # O método gsub executa o replace em todas as instâncias, o que é diferente do método sub que executa apenas na primeira ocorrência
        exit(frase)
        frase = frase.gsub(" ", "")
        words = frase.split("")
        unique = words.uniq
        puts "#{$alfabeto}\n"
        puts "#{frase}\n"
        puts "#{words}\n"
        puts "#{unique}\n"
    end
end
