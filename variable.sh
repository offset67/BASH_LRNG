variable="some string"
# But not like this:
variable = "Some string" # => returns error "variable: command not found"
# Bash will decide that `variable` is a command it must execute and give an error
# because it can't be found.

# Nor like this:
variable= "Some string" # => returns error: "Some string: command not found"
# Bash will decide that "Some string" is a command it must execute and give an
# error because it can't be found. In this case the "variable=" part is seen
# as a variable assignment valid only for the scope of the "Some string"
# command.

# Using the variable:
echo "$variable" # => Some string
echo '$variable' # => $variable
# When you use a variable itself — assign it, export it, or else — you write
# its name without $. If you want to use the variable's value, you should use $.
# Note that ' (single quote) won't expand variables!
# You can write variables without surrounding double quotes but it's not
# recommended due to how Bash handles variables with spaces in them.

# Parameter expansion ${...}:
echo "${variable}" # => Some string
# This is a simple usage of parameter expansion such as two examples above.
# Parameter expansion gets a value from a variable.
# It "expands" or prints the value.
# During the expansion time the value or parameter can be modified.
# Below are other modifications that add onto this expansion.

# String substitution in variables:
echo "${variable/Some/A}" # => A string
# This will substitute the first occurrence of "Some" with "A".

# Substring from a variable:
length=7
echo "${variable:0:length}" # => Some st
# This will return only the first 7 characters of the value
echo "${variable: -5}" # => tring
# This will return the last 5 characters (note the space before -5).
# The space before minus is mandatory here.

# String length:
echo "${#variable}" # => 11

# Indirect expansion:
other_variable="variable"
echo ${!other_variable} # => Some string
# This will expand the value of `other_variable`.

# The default value for variable:
echo "${foo:-"DefaultValueIfFooIsMissingOrEmpty"}"
# => DefaultValueIfFooIsMissingOrEmpty
# This works for null (foo=) and empty string (foo=""); zero (foo=0) returns 0.
# Note that it only returns default value and doesn't change variable value.

# Declare an array with 6 elements:
array=(one two three four five six)
# Print the first element:
echo "${array[0]}" # => "one"
# Print all elements:
echo "${array[@]}" # => "one two three four five six"
# Print the number of elements:
echo "${#array[@]}" # => "6"
# Print the number of characters in third element
echo "${#array[2]}" # => "5"
# Print 2 elements starting from fourth:
echo "${array[@]:3:2}" # => "four five"
# Print all elements each of them on new line.
for item in "${array[@]}"; do
    echo "$item"
done

# Built-in variables:
# There are some useful built-in variables, like:
echo "Last program's return value: $?"
echo "Script's PID: $$"
echo "Number of arguments passed to script: $#"
echo "All arguments passed to script: $@"
echo "Script's arguments separated into different variables: $1 $2..."


