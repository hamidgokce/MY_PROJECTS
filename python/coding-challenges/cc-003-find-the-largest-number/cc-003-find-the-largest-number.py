# Solution - 1 
num = [67, 85, 19, 39]
print(max(num))

# Solution - 2 
counter = 0
number = [] 
while counter < 5 :
  x =(int(input('Please Write a number : ')))
  number.append(x)
  counter += 1

number.sort()
print(number)
print(number[-1])

# Solution - 3
max = 0
for i in number:
  if i > max:
    max = i
print(max)

# Solution - 4
mnumbers = [67, 85, 19, 39]
numbers.sort() # sort metodu ile numbers degisiklige ugramistir 
print(numbers)
numbers.sort(reverse=False)
print(numbers)
print(numbers[-1])
numbers.sort(reverse=True)
print(numbers)
print(numbers[0])


# Solution - 5
numbers = [67, 85, 19, 39]
print(sorted(numbers)) # fonksiyon ile listemizi buyukten kucuge siralanmis bir sekilde aliriz
print(numbers)