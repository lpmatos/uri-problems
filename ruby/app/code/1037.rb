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
    case value
    when value.between?(0, 25)  
        puts "Intervalo [0,25]"
    when value.between?(26, 50)  
        puts "Intervalo (25,50]"
    when value.between?(51, 75)  
        puts "Intervalo (50,75]"
    when value.between?(76, 100) 
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
