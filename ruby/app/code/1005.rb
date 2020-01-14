#!/usr/bin/ruby

# =============================================================================
# FUNCTIONS
# =============================================================================

def media(first, last)
    if first.kind_of? Float and last.kind_of? Float
        return (((first * 3.5) + (last * 7.5))/(11.0))
    end
end

# =============================================================================
# MAIN
# =============================================================================

if __FILE__ == $0
    first = ((gets.strip).to_f).round(1)
    last = ((gets.strip).to_f).round(1)
    puts sprintf "MEDIA = %.5f\n" % (media(first, last))
end
