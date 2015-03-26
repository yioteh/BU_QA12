def looper(start, stop):
    for i in range(start, stop, -1):
        for j in range(start, stop, -1):
            if i*j > 100000 and str(i*j)[0] == str(i*j)[5] and str(i*j)[1] == str(i*j)[4] and str(i*j)[2] == str(i*j)[3]:
                lst.append(i*j)
                return looper(max(i,j), min(i, j))


def solution():
    global lst
    lst = []
    looper(999, 99)
    return max(lst)


print (solution())
