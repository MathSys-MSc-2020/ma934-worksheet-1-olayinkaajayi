using Plots
using YAML

using Starter

# Use the pyplot backend
pyplot()

# Read the config file to get the parameters
args = YAML.load(open("config.yaml"))

# Print out the arguments and their types
for key1 in keys(args)
    for key2 in keys(args[key1])
        value = args[key1][key2] #This is an array of arrays
        type = typeof(value)
        println("args[", key1, "][", key2, "] = ", value, "  Type = ", type)
    end
end

# Call a function defined in our custom module Starter.jl
n = args["group1"]["parameter1"] #To use the element one would have to write as a string the label name

# Set default fonts for all plots
fnt = Plots.font("DejaVu Sans", 10.0)
default(titlefont=fnt, guidefont=fnt, tickfont=fnt, legendfont=fnt)
p = example_plot(n) #This is the function in our self-tailored package Starter

gr()
n= args["group3"]["parameter5"]
alpha= args["group3"]["parameter6"]
p1= plot_of_f(alpha,n)

# Save the plot as a pdf file
savefig(p, "testplot.pdf") #This saves the plot as a pdf
