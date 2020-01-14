#!/usr/bin/ruby

# =============================================================================
# FUNCTIONS
# =============================================================================

def validate(value)
    if value.kind_of? Float
        return value
    end
end

# =============================================================================

def intervalo(value)
    if value >= 0 and value <= 25 
        puts "Intervalo [0,25]"
    elsif value > 25 and value <= 50 
        puts "Intervalo (25,50]"
    elsif value > 50 and value <= 75
        puts "Intervalo (50,75]"
    elsif value > 75 and value <= 100
        puts "Intervalo (75,100]"
    else
        puts "Fora de intervalo"
    end
end

# =============================================================================
# MAIN
# =============================================================================

if __FILE__ ==  $0
    first = validate(((gets.strip).to_f).round(2))
    intervalo(first)
end
