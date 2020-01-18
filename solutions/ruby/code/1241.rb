#!/usr/bin/ruby

# =============================================================================
# MAIN
# =============================================================================

if __FILE__ == $0
    quantidade = (gets.strip).to_i - 1
    for elemento in 0..quantidade
        valores = ((STDIN.gets).strip).split(" ")
        if valores.size == 2
            first, last = valores[0].to_s, valores[1].to_s
            if (first.length > 0 and last.length > 0) and (first.length <= 1000 and last.length <= 1000)
                tamanho = last.length
                diferenca = (first.length - tamanho).abs
                atual = first[diferenca..(first.length - 1)]
                unless atual == last
                    puts "encaixa"
                else
                    puts "nao encaixa"
                end
            else
                exit
            end
        end
    end
end
