include("aoc_helper.jl")

day = 6
input = readInput(day)
# input = readTest()
sinput = split(input, '\n')
datastream = split(first(sinput),"")

# Part 1
for i in 1:(length(datastream)-3)
    if (length(Set(datastream[i:(i+3)])) == 4)
        sol1 = i+3
        println("Solution for part 1: $sol1")
        break
    end
end

# Part 2
for i in 1:(length(datastream)-3)
    if (length(Set(datastream[i:(i+13)])) == 14)
        sol2 = i+13
        println("Solution for part 2: $sol2")
        break
    end
end
