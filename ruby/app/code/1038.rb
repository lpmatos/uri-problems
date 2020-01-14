#!/usr/bin/ruby

# =============================================================================
# GLOBAL VARIABLE
# =============================================================================

$codes = (%w(1 2 3 4 5)).map{ |value| value.to_i } # Usando map para converter todo array para inteiro
$prices = (%w(4 4.50 5 2 1.5)).map(&:to_f) # Usando map para converter todo array para float
$table = $codes.zip($prices)

# =============================================================================
# MAIN
# =============================================================================

if __FILE__ == $0
    valores = ((STDIN.gets).strip).split(" ")
    puts "#{valores.class}"
    puts "#{valores}"
    puts "#{$codes}"
    puts "#{$prices}"
    puts "#{$table}"
end
