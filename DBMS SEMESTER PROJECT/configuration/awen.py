import random
array = []
i=0
while i<1000:
    number = random.randint(4000000000000,5000000000000);
    if number not in array:
        array.append("("+str(number)+")")
        i = i+1
    else:
        continue
print(array)