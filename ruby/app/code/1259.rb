#!/usr/bin/ruby

# =============================================================================
# FUNCTIONS
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
    array = array.sort
    par = Array.new(count_par(array))
    impar = Array.new(count_par(array))
    for valor in array
        if par(valor.to_i)
            par.push(valor)
        else
            impar.push(valor)
        end
    end
    return par.concat(impar)
end

# =============================================================================

def par(value)
    if value.kind_of? Integer
        if value % 2 == 0
            return true
        else
            return false
    end
end

# =============================================================================
# MAIN
# =============================================================================

if __FILE__ == $0
    quantidade = (gets.strip).to_i
    array = Array.new(quantidade)
    array.each_with_index do |content, index|
        array[index] = (gets.strip).to_i
    end
    puts "#{array}"
    puts "#{sort(array)}"
end
