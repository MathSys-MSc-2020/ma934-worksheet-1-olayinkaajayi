module Starter
# List of dependencies
using Plots

# List of functions to be exported
export example_plot
export plot_of_f

# Definitions of any new types provided

# Function definitions
"""
    example_plot(n)

This function evaluates Sin(x) at n points in the interval [0, 2π], creates a
    plot and then returns the plot.
"""
function example_plot(n)
    title = "This is an example plot."
    x1 = collect(range(0.0, 2*π, length=n)) #This takes the range and make it into an array
    y1 = sin.(x1)

    # Plot the points
    p = plot(x1, y1, seriestype=:scatter,label="Some sample points",
    title=title, xlabel="x", ylabel="sin(x)", markersize=10, markercolor="red")

    # Now plot the true function
    x2 = collect(range(0.0, 2*π, length=1000)) #This takes the range and make it into an array
    y2 = sin.(x2)
    plot!(x2, y2, label="Underlying function.", color="green", linewidth=2)
    return p
end

#new function definition
"""
    plot_of_f(alpha,n)

This function evaluates (x^alpha)log(x) at n points from 1 to 2^n, creates a plot and returns the plot
"""
function plot_of_f(alpha,n)
    x= [2^i for i=0:n]
    y= (x.^alpha).*log.(x)
    p1= plot(x , y,yscale=:log10, seriestype=:scatter, label="Some sample points", xlabel="log(x)",
        ylabel="(x.^alpha).*log(x)", markersize=10, markercolor="red")
    x1= collect(range(1,2^21, length= n))
    y1= log.((x1.^alpha).*log.(x1))
    plot!(x1, y1, yscale=:log10, label="Underlying function.", color="green", linewidth=2)
    
    return p1    
end

# End the module definition
end
