module fibonaci

export fib_iterative
export fib_recursive
export fib_memoization

"""
    fib_iterative()
This function compute the 𝑛𝑡ℎ  term,  𝑎_𝑛 , in the Fibonacci sequence iteratively
"""
function fib_iterative(n)
    if n==1 || n ==2
        return n-1
    else
        a= zeros(Int64,n)
        a[1]= 0; a[2]=1;
        for i=3:n
            a[i]= a[i-1] + a[i-2]
        end
        return a[n] 
    end  
end

"""
    fib_recursive()
This function compute the 𝑛𝑡ℎ  term,  𝑎_𝑛 , in the Fibonacci sequence recursively
"""
function fib_recursive(n)
    if n==1 || n==2
        return n-1
    else
        return fib_recursive(n-1) + fib_recursive(n-2)
    end
end

"""
    fib_memoization()
This function compute the 𝑛𝑡ℎ  term,  𝑎_𝑛 , in the Fibonacci sequence memoization
"""
memo= Dict()
memo[1]= 0
memo[2]= 1

function fib_memoization(n)
    if !(n in keys(memo))
        memo[n]= fib_memoization(n-1) + fib_memoization(n-2)
    end
    return memo[n]
end



#End of module
end