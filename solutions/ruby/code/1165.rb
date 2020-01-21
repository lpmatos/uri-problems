def core(value)
    if value.kind_of? Integer
        contador = 0
        1.upto(value) do |conteudo|
            contador += 1 if value % conteudo == 0
        end
        return contador
    end
end

def primo(value)
    puts "#{core(value) == 2 ? "#{value} eh primo" : "#{value} nao eh primo"}"
end

if __FILE__ == $0
    quantidade = (gets.strip).to_i
    1.upto(quantidade) do
        valor = (gets.strip).to_i
        primo(valor)
    end
end
