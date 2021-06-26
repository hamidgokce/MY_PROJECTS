def converter(miliseconds):
    if miliseconds < 1000:
        return miliseconds
    else:
        seconds, miliseconds = divmod(miliseconds, 1000)
        minutes, seconds = divmod(seconds, 60)
        hours, minutes = divmod(minutes, 60)
        return [hours, minutes, seconds]
    

def calculated_time():
    print("""
    ###  This program converts milliseconds into hours, minutes, and seconds ###
                     (To exit the program, please type "exit")
             Please enter the milliseconds (should be greater than zero) : 
    """)
    while True:
        entry = input()
        if entry.lower() == "exit":
            return "Exiting the program... Good Bye"
        else:
            try:
                miliseconds = int(entry)
            except :
                print("Not Valid Input !!! Try again: ")
                continue
            if miliseconds < 1 :
                print("Not Valid Input !!! Try again: ")
                continue
            time = ["hour/s", "minute/s", "second/s"]
            calculated = converter(miliseconds)
            if type(calculated) == int:
                return f"just {calculated} millisecond/s"
            else:
                return(" ".join([f"{calculated[i]} {time[i]}" for i in range(3) if calculated[i] != 0]))
            
