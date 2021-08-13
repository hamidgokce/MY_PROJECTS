products = ["Pride and Prejudice", "To Kill a Mockingbird", "The Great Gatsby",
            "One Hundred Years of Solitude", "Pride and Prejudice", "In Cold Blood", "Wide Sargasso Sea",
            "One Hundred Years of Solitude", "Brave New World",  "The Great Gatsby", "Brave New World",
            "I Capture The Castle", "Brave New World", "The Great Gatsby", "The Great Gatsby",
            "One Hundred Years of Solitude", "Pride and Prejudice"]
def get_unique_values(products):
    result = []
    for i in products:
        x = products.count(i)
        if x == 1:
            result.append(i)
    return result
print(get_unique_values(products))

# Baris STYLE
products = ["Pride and Prejudice", "To Kill a Mockingbird", "The Great Gatsby", "One Hundred Years of Solitude", \
            "Pride and Prejudice", "In Cold Blood", "Wide Sargasso Sea", \
            "One Hundred Years of Solitude", "Brave New World",  "The Great Gatsby", "Brave New World", \
            "I Capture The Castle", "Brave New World", "The Great Gatsby", "The Great Gatsby", \
            "One Hundred Years of Solitude", "Pride and Prejudice"]
for product_1 in products:
  count = 0
  for product_2 in products:
    if product_1 == product_2:
      count += 1
      if count > 1:
        break
  if count == 1:
    print(product_1)
    
    def unique(list1):
    unique_list = []
    for x in list1:
        if x not in unique_list:
            unique_list.append(x)
    list_dict={}
    for i in unique_list:
        count=0
        for j in list1:
            if i == j:
                count=count+1
        list_dict[i]=count
    non_repeated=[]
    for key, value in list_dict.items():
        if value == 1:
            non_repeated.append(key)   
    print(non_repeated)
a = [int(item) for item in input("Enter the list items : ").split()]
list=a
#list=["Pride and Prejudice", "To Kill a Mockingbird", "The Great Gatsby",
#"One Hundred Years of Solitude", "Pride and Prejudice", "In Cold Blood", "Wide Sargasso Sea",
#"One Hundred Years of Solitude", "Brave New World",  "The Great Gatsby", "Brave New World",
#"I Capture The Castle", "Brave New World", "The Great Gatsby", "The Great Gatsby",
#"One Hundred Years of Solitude", "Pride and Prejudice"]
unique(list)





