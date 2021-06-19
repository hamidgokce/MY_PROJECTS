# METHOD_1
def int_to_rome(x):
    numbers = [1,4,5,9,10,40,50,90,100,400,500,900,1000]
    roman = ['I','IV','V','IX', 'X','XL', 'L','XC', 'C','CD', 'D','CM','M']
    i = 12
    roman_numeral = ''
    while x != 0:
        if numbers[i] <= x:
            roman_numeral += roman[i]
            x = x - numbers[i]
        else: 
            i -= 1 # i = i-1
    return roman_numeral

print(int_to_rome(49))
print(int_to_rome(4))
print(int_to_rome(1249))
print(int_to_rome(67))

# METHOD_2

num_map = [(1000, 'M'), (900, 'CM'), (500, 'D'), (400, 'CD'), (100, 'C'), (90, 'XC'),
           (50, 'L'), (40, 'XL'), (10, 'X'), (9, 'IX'), (5, 'V'), (4, 'IV'), (1, 'I')]
def num2roman(num):
    if num == "Exit":
        print("Exiting the program... Good Bye")
    elif type(num) == str or num < 0 or num >= 4000:
        print("Not Valid Input !!!")
    else:
        roman = ''
        while num > 0 :
            for i, r in num_map:
                while num >= i:
                    roman += r
                    num -= i
        return roman
print(num2roman(49))
print(num2roman(4))
print(num2roman(1249))
print(num2roman(67))

# METHOD_3

def Convert_Roman( num):
        symbol = [ "M", "CM", "D", "CD","C", "XC", "L", "XL","X", "IX", "V", "IV","I"]
        value = [ 1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1 ]
        roman_num = ''
        i = 0
        while  num > 0:
            for x in range(num // value[i]):
                roman_num += symbol[i]
            num %= value[i]
            i += 1
        return roman_num
print(Convert_Roman(49))
print(Convert_Roman(4))
print(Convert_Roman(1249))
print(Convert_Roman(67))