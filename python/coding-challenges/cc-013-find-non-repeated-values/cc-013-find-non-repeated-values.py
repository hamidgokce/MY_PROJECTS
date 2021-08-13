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