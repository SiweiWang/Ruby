# Passing blocks is one way to pass functions as arguments to other functions
# Blocks are one of the very few exceptions to the "everything is an object" rule in Ruby.
# Blocks are not objects, and they can't be saved to variables

# Proc Object are blocks of code that can be bound to a set of local variables. You can think of a proc object as a "saved" block
# Proc are a great way of keeping your code DRY

def foo(a, b, my_p)
  my_p.call(a,b)
end

times = proc {|x, y| x * y}

puts foo(3, 2, times) # Should be 6


# Square_of_sum method computes the sum of the elements in a input array and return the square of the summed elements
def square_of_sum (my_array, proc_square, proc_sum)
    sum = proc_sum.call(my_array)
    proc_square.call(sum)
end

proc_square_number = proc {|x| x*x }
proc_sum_array     = proc {|x| x.reduce(:+)}
my_array = gets.split().map(&:to_i)

puts square_of_sum(my_array, proc_square_number, proc_sum_array)
