#!/usr/bin/ruby

include Math

def area(raio)
    if raio.kind_of? Float
        return PI * (raio ** 2)
    end
end

raio = ((gets.strip).to_f).round(2)

puts sprintf "A=%.4f" % (area(raio))
