# Partial function application is the ability to take a function of many parameters and apply arguments to some of the parameters 
# to create a new function that needs only the application of the remaining argument to produce the equivalent of applying all argument to the original functions
# E.g:
# Given values v1, v2 and f(param1, param2), partial(f, param1=v1) returns f'(param2) such that f (param1=v1, param2=v2) == f'(param2=v2) (for any value v2)
# Note that in the partial appication of a parameter, ( in the above case param1), other parameters are not explicitly mentioned. This is a recurring featrue of partial function

multiply_function = -> (number) do
  -> (another_number) do
    number * another_number
  end
end

doubler = multiply_function.(2)
tripler = multiply_function.(3)

puts doubler.(4) # 8
puts tripler.(4) # 12

# Here , the lambda will take number as a parameter and return a lambda. When you call this lambda with another_number, it will return the product of the two.


# Write a combination method is a variable that stores a partial application which computes combination nCr (n choose r)

# n choose r
combination = -> (n) do
    -> (r) do
        ((n-r+1)..n).reduce(:*)/(1..r).reduce(:*)
    end
end
n = gets.to_i
r = gets.to_i
nCr = combination.(n)
puts nCr.(r)



