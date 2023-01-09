def leap_year():

 year = int(input("Enter a year: "))

# divided by 100 means century year (ending with 00)
# century year divided by 400 is leap year
 if (year % 400 == 0) and (year % 100 == 0):
    print("{0} is a leap year".format(year))

# not divided by 100 means not a century year
# year divided by 4 is a leap year
 elif (year % 4 ==0) and (year % 100 != 0):
    print("{0} is a leap year".format(year))

# if not divided by both 400 (century year) and 4 (not century year)
# year is not leap year
 else:
    print("{0} is not a leap year".format(year))
leap_year()

\---------------------------------------------------------------------------------------------------------/


# another way to cheack years above 2000 only .

def leap_year():

 while True :

    year = int(input("Please Enter The year:  "))
    if year < 2000:
        print("Please Enter The year again: year should be above 2000 \n")
    elif year > 2000:
        print("{0} is a leap year".format(year)) if year%4==0 else print("{0} is not a leap year".format(year))
        break

leap_year()
