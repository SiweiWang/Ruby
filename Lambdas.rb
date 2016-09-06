# Lambdas are anonymous functions, Lambdas in Ruby are objects of the class Proc.
# They are useful in most of the situations where you would use a proc

# The simplest lambda takes no argument and returns nothing as shown below

# Lambda that takes no arguments 
def area(l, b)
  ->{ l * b }
end

x = 10.0; y = 20.0

area_rectangle = area(x, y).()
area_triangle = 0.5 * area(x, y).call

puts area_rectangle 
puts area_triangle

# Lambda that takes one or more agruments
area = -> (a, b) { a * b }

x = 10.0; y = 20.0

area_rectangle = area.(x,y)
area_triangle = 0.5 * area.call(x, y)

puts area_rectangle
puts area_triangle

# lambdas can be called using both .call() and .()

# one of differences between lambdas and proc are the way they handle arguments. 
# Lambda equivalent to Proc.new expect the resulting Proc objects check the number of the parameters passed when called

p = Proc.new {|a, b| puts a**2+b**2 } # => #<Proc:0x3c7d28@(irb):1>
p.call 1, 2 # => 5
p.call 1 # => NoMethodError: undefined method `**' for nil:NilClass
p.call 1, 2, 3 # => 5
l = lambda {|a, b| puts a**2+b**2 } # => #<Proc:0x15016c@(irb):5 (lambda)>
l.call 1, 2 # => 5
l.call 1 # => ArgumentError: wrong number of arguments (1 for 2)
l.call 1, 2, 3 # => ArgumentError: wrong number of arguments (3 for 2)

# Using return inside a lambda returns the value of that lambda, 
# But using return in a proc returns from the enclosing block.

lambda { return :foo }.call # => :foo
Proc.new { return :foo }.call # => LocalJumpError: unexpected return

# Write a lambda which takes an integer and square it
square      = ->(a) { a * a }

# Write a lambda which takes an integer and increment it by 1
plus_one    = ->(a) { a + 1 }

# Write a lambda which takes an integer and multiply it by 2
into_2      = ->(a) { a * 2 }

# Write a lambda which takes two integers and adds them
adder       = ->(a, b) { a + b }

# Write a lambda which takes a hash and returns an array of hash values
values_only = ->(hash){ hash.values }


input_number_1 = gets.to_i
input_number_2 = gets.to_i
input_hash = eval(gets)

a = square.(input_number_1); b = plus_one.(input_number_2);c = into_2.(input_number_1); 
d = adder.(input_number_1, input_number_2);e = values_only.(input_hash)

p a; p b; p c; p d; p e