# Solution - 1 
num = [67, 85, 19, 39]
print(max(num))

# Solution - 2 
num = [67, 85, 19, 39]
num.sort()
print(num)
num.sort(reverse=True)
print(num[0])

# Solution - 3
num = [67, 85, 19, 39]
sorted(num)[-1]

# Solution - 4
max = 0
for i in num:
    if i > max:
        max = i
print (max)
