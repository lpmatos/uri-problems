#!/usr/bin/ruby

# =============================================================================
# GLOBAL VARIABLE
# =============================================================================

$codes = (%w(1 2 3 4 5)).map{ |value| value.to_i } # Usando map para converter todo array para inteiro
$prices = [4, 4.5, 5, 2, 1.5].map(&:to_f) # Usando map para converter todo array para float
$table = $codes.zip($prices)

# =============================================================================
# FUNCTIONS
# =============================================================================

def prod(first, count)
    if first.kind_of? Integer and count.kind_of? Integer
        return (first * count).to_f
    end
end

# =============================================================================
# MAIN
# =============================================================================

if __FILE__ == $0
    valores = ((STDIN.gets).strip).split(" ")
    array = $table
    if valores.size == 2
        first = (($table[(((valores[0]).to_i) - 1)]).last()).to_i
        count = (valores[1]).to_i
        puts "#{$prices}"
        puts sprintf "Total: R$ %.2f\n" % (prod(first, count))
    end
end
