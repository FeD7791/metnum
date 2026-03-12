import numpy as np

a = np.linspace(0,100, 100)

def f(x):
    return np.sin(x) + np.cos(x)

def f2(x):
    return np.log10(x)

b = f(a)
c = f2(a)

arr = np.column_stack((a,b,c))

np.savetxt("data.txt", arr)