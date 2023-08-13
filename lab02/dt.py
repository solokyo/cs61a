def cycle(f1, f2, f3):
    """Returns a function that is itself a higher-order function.

    >>> def add1(x):
    ...     return x + 1
    >>> def times2(x):
    ...     return x * 2
    >>> def add3(x):
    ...     return x + 3
    >>> my_cycle = cycle(add1, times2, add3)
    >>> identity = my_cycle(0)
    >>> identity(5)
    5
    >>> add_one_then_double = my_cycle(2)
    >>> add_one_then_double(1)
    4
    >>> do_all_functions = my_cycle(3)
    >>> do_all_functions(2)
    9
    >>> do_more_than_a_cycle = my_cycle(4)
    >>> do_more_than_a_cycle(2)
    10
    >>> do_two_cycles = my_cycle(6)
    >>> do_two_cycles(1)
    19
    """
    "*** YOUR CODE HERE ***"

    def foo(n):
        def bar(x):
            for i in range(0,n):
                if i % 3 == 0: x = f1(x)
                if i % 3 == 1: x = f2(x)
                if i % 3 == 2: x = f3(x)
            return x
        return bar
    return foo

    # def foo(n):
    #     def bar(x)
    #         if n == 0: return x
    #         if n % 3 == 0: return f1(x)
    #         if n % 3 == 1: return f2(x)
    #         if n % 3 == 2: return f3(x)
    #     return bar
    # return foo


def match_k_alt(k):
    """ Return a function that checks if digits k apart match

    >>> match_k_alt(2)(1010)
    True
    >>> match_k_alt(2)(2010)
    False
    >>> match_k_alt(1)(1010)
    False
    >>> match_k_alt(1)(1)
    True
    >>> match_k_alt(1)(2111111111111111)
    False
    >>> match_k_alt(3)(123123)
    True
    >>> match_k_alt(2)(123123)
    False
    >>> match_k_alt(2)(213141)
    False
    >>> match_k_alt(2)(121314)
    False
    """
    # def check(x):
    #     while x // (10 ** k):
    #         if (x % 10) != (x // (10 ** k)) % 10:
    #             return False
    #         x //= 10
    #     return True
    # return check
    def check(x):
        n = pow(10, k)
        base = x % n
        while x > 0:
            if x % n == base:
                x = x // n
            else:
                return False
        return True
    return check