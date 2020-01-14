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
    when 0..26
        puts "Intervalo [0,25]"
    when 26..51
        puts "Intervalo (25,50]"
    when 51..76
        puts "Intervalo (50,75]"
    when 76..101
        puts "Intervalo (25,100]"
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
