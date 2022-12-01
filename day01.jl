include("aoc_helper.jl")

day = 1
input = readInput(day)

# Part 1
sinput = split(input, '\n')

elves = Int[]
elf = Int[]

for s in sinput
    if length(s) == 0
        push!(elves, sum(elf))
        empty!(elf)
    else
        push!(elf, parse(BigInt, s))
    end
end

sol1 = maximum(elves)

println("Solution for part 1: $sol1")

sorted_elves = sort(elves)
sol2 = sum(sorted_elves[(end-2):end])

println("Solution for part 2: $sol2")
