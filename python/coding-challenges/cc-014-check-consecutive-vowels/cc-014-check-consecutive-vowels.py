def doubleVowel_finder():
    kelime = input("Bir kelime girin:")
    vowels=["a", "e", "i", "o", "u"]
    isaret="negative"
    i=0
    m=1
    while m < len(kelime):
        if kelime[i] in vowels and kelime[m] in vowels:
            isaret="Positive"
        i=i+1
        m=m+1
    print(isaret)

doubleVowel_finder()