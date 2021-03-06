#!/usr/bin/ruby

# =============================================================================
# FUNCTIONS
# =============================================================================

def par(value)
    if value.kind_of? Integer
        if value % 2 == 0
            return true
        else
            return false
        end
    end
end

# =============================================================================

def count_par(array)
    if array.kind_of? Array
        return array.count { |value| value % 2 == 0 }
    end
end

# =============================================================================

def count_impar(array)
    if array.kind_of? Array
        return array.count { |value| value % 2 != 0 }
    end
end

# =============================================================================

def sort(array)
    if array.kind_of? Array
        return array.sort
    end
end

# =============================================================================

def compact(array)
    return array.count(nil) > 0 ? array.compact : array
end

# =============================================================================

def core(array)
    array = sort(array)
    par = Array.new(count_par(array))
    impar = Array.new(count_impar(array))
    for valor in array
        if par(valor)
            par.push(valor)
        else
            impar.push(valor)
        end
    end
    return compact(par.concat(impar.reverse))
end

# =============================================================================
# MAIN
# =============================================================================

if __FILE__ == $0
    # PEGANDO QUANTIDADE
    quantidade = (gets.strip).to_i
    # CRIANDO ARRAY COM ESSA QUATIDADE
    array = Array.new(quantidade)
    # POPULANDO ARRAY
    array.each_with_index do |content, index|
        array[index] = (gets.strip).to_i
    end
    # CHAMANDO FUNÇÃO CORE
    array = core(array)
    # EXIBINDO
    core(array).each { |value| puts value }
end
