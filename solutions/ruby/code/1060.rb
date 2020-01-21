def validation(value)
    if value.kind_of? Integer or value.kind_of? Float
        return value.positive? ? true : false
    end
end

if __FILE__ == $0
    contador = 0
    for elemento in 0..5
        value = (gets.strip).to_i
        contador += 1 if validation(value)
    end
    puts "#{contador} valores positivos"
end
