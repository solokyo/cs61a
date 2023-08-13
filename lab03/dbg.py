import inspect
import dis
def div_by_primes_under_no_lambda(n): # -> func(i: int) -> bool:
    def checker(x):
        return False
    i = 2
    while i <= n:
        if not checker(i):
            def outer(f, i):
                def inner(x):
                    return x % i == 0 or f(x)
                return inner
            # checker = lambda x: x % largest_prime_less_than_n == 0 or ... or x % 3 == 0 or x % 2 == 0 or false
            checker = outer(checker, i) 
            print(inspect.getsource(checker))
        i = i + 1
    return checker

def div_by_primes_under(n):
    checker = lambda x: False
    i = 2
    while i <= n:
        if not checker(i):
            checker = (lambda f, i: lambda x: x % i == 0 or f(x))(checker, i)
            dis.dis(checker)
        i = i + 1
    print(inspect.getsource(checker))
    return checker

if __name__ == '__main__':
    f = div_by_primes_under(10)(14)

# def div_by_primes_under_no_lambda(n):
#     def func(x: int) -> bool:
#         for i in range(2, n+1):
#             if x % i == 0: return True
#         return False
#     return func


def add_n(n: int):
    return lambda x : x + n



n = 5
f = add_n(n)
f


