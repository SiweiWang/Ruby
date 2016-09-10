# Currrying is technique in which a function accepts n parameters and turns it into a sequence of n functions, each of them takes 1 parameter.

multiply_numbers = -> (x, y) do 
  x*y
end

doubler = multiply_numbers.curry.(2)
tripler = multiply_numbers.curry.(3)

puts doubler.(4) # 8
puts tripler.(4) # 12

# multiply_numbers.curry.(2) returns a lambda which takes only one parameter necessary for calculation.

# Write a curry, which per-fills power_function with variable base

power_function = -> (x, z) {
    (x) ** z
}

base = gets.to_i
raise_to_power = power_function.curry.(base)

power = gets.to_i
puts raise_to_power.(power)
