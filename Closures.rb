# Closure is a function that 
# 1. Can be passed around like an object
# It can be treated like a variables, which can be assigned to another variable, passed as an argument to a method.

# 2. Remembers the value fo variables no longer in scope.
# It remembers the value of all the variables that were in scope where the function was defined. 
# It is then able to access those variables whenr it si called even if they are in a different scope

def plus_one(y)
  x = 100
  y.call
end

x = 1 
y = ->{ x + 1 }
puts plus_one(y) #2

# variable x which is closed within the lambda y, remebers its values. Here , x remebers its value as 1
# Blocks, Procs and Lambdas are closures in Ruby

def block_message_printer
    message = "Welcome to Block Message Printer"
    if block_given?
        yield
    end
  puts "But in this function/method message is :: #{message}"
end

message = gets
block_message_printer { puts "This message remembers message :: #{message}" }

#####################################################################################

def proc_message_printer(my_proc)
    message = "Welcome to Proc Message Printer"
    my_proc.call()              #Call my_proc
    puts "But in this function/method message is :: #{message}"
end


my_proc = proc { puts "This message remembers message :: #{message}" }
proc_message_printer(my_proc)
    
######################################################################################    
    
def lambda_message_printer(my_lambda)
    message = "Welcome to Lambda Message Printer"
    my_lambda.call()       #Call my_lambda
    puts "But in this function/method message is :: #{message}"
end

my_lambda = -> { puts "This message remembers message :: #{message}" }
lambda_message_printer(my_lambda)    
    
######################################################################################    
