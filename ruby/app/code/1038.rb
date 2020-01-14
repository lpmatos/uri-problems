#!/usr/bin/ruby

# =============================================================================
# GLOBAL VARIABLE
# =============================================================================

$codes = (%w(1 2 3 4 5)).map{ |value| value.to_i } # Usando map para converter todo array para inteiro
$prices = (%w(4 4.50 5 2 1.5)).map(&:to_f) # Usando map para converter todo array para float
$table = $codes.zip($prices)

# =============================================================================
# FUNCTIONS
# =============================================================================

def soma(first, last)
    if first.kind_of? Integer and last.kind_of? Integer
        return first + last
    end
end

# =============================================================================
# MAIN
# =============================================================================

if __FILE__ == $0
    valores = ((STDIN.gets).strip).split(" ")
    if valores.size == 2
        first = (valores[0]).to_i
        last = (valores[1]).to_i
        puts sprintf "Total: R$ %.2f\n" % (soma(first[1], last[1]))
    end
end
