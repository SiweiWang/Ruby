# Lazy evaluation is an evaluation strategy that delays the assessment of an expression ubtil its value is needed.
# Ruby 2.0 introduced a lazy enumeration feature. Lazy evaluation increases performance by avoiding needless calcualtions, 
# and it has the ability to create potentially infinite data strcutre

power_arry = -> (power, array_size) do 
  1.upto(Float:INFINITY).lazy.map { |x| x**power }.first(array_size)
end

put power_array.(2,4) #[1, 4, 9, 16]


1.upto(Float:INFINITY).map { |x| x**power }.first(array_size) # times out without lazy



# Example print an array of the first  palindromic prime numbers. 

# Input
# A single line of input containing the integer .

# Output Format

# Print an array of the first  palindromic primes.

# Sample input 
# 50

# Sample output
# [2, 3, 5, 7, 11, 101, 131, 151, 181, 191, 313, 353, 373, 383, 727, 757, 787, 797, 919, 929, 10301, 10501, 10601, 11311, 11411, 12421, 12721, 12821, 13331, 13831, 13931, 14341, 14741, 15451, 15551, 16061, 16361, 16561, 16661, 17471, 17971, 18181, 18481, 19391, 19891, 19991, 30103, 30203, 30403, 30703]

p Prime.each.lazy.select{|x| x.to_s == x.to_s.reverse}.first(gets.to_i)

