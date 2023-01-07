# Define function that take all parameters:
def my_fun(string, position, character):
    # Converting String to The List:
    new_list = list(string)
    # Determine The Specific Position in The list and Assign it to Specific Character:
    new_list[position] = character
    # Update the String with new change
    string = ''.join(new_list)
    # Print string and get output
    print(string)
