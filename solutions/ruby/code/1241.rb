#!/usr/bin/ruby

# =============================================================================
# MAIN
# =============================================================================

if __FILE__ == $0
    quantidade = (gets.strip).to_i - 1
    for elemento in 0..quantidade
        first, last = gets.strip, gets.strip
        if (first.length > 0 and last.length > 0) and (first.length <= 1000 and last.length)
            tamanho = last.length
            corte = (first.length - last.length).abs
            atual = first[corte, first.length - 1]
            puts atual
        else
            exit
        end
    end
end
