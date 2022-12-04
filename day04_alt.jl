include("aoc_helper.jl")

day = 4
input = readInput(day)

# Part 1

sinput = split(input, '\n')
filter!(!isempty, sinput)

nums = map(x->parse.(Int,split(x,ispunct)), sinput)
sections = map(x->(x[1]:x[2],x[3]:x[4]), nums)
fully_contained = map(s->isempty(setdiff(s[1], s[2])) || isempty(setdiff(s[2], s[1])), sections)
sol1 = sum(fully_contained)

println("Solution for part 1: $sol1")

# Part 2
overlapping = map(s->!isempty(intersect(s[1], s[2])), sections)
sol2 = sum(overlapping)

println("Solution for part 2: $sol2")