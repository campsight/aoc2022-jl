include("aoc_helper.jl")

day = 4
input = readInput(day)

# Part 1

sinput = split(input, '\n')
filter!(!isempty, sinput)

sum = 0

for assignment in sinput
    elf1, elf2 = split(assignment, ",")

    elf1_start, elf1_end = split(elf1, "-")
    elf2_start, elf2_end = split(elf2, "-")

    elf1_section = parse(Int, elf1_start):parse(Int, elf1_end)
    elf2_section = parse(Int, elf2_start):parse(Int, elf2_end)

    if isempty(setdiff(elf1_section, elf2_section)) || isempty(setdiff(elf2_section, elf1_section))
        global sum += 1
    end
end

sol1 = sum

println("Solution for part 1: $sol1")

# Part 2

sum = 0

for assignment in sinput
    elf1, elf2 = split(assignment, ",")

    elf1_start, elf1_end = split(elf1, "-")
    elf2_start, elf2_end = split(elf2, "-")

    elf1_section = parse(Int, elf1_start):parse(Int, elf1_end)
    elf2_section = parse(Int, elf2_start):parse(Int, elf2_end)

    if !isempty(intersect(elf1_section, elf2_section))
        global sum += 1
    end
end

sol2 = sum

println("Solution for part 2: $sol2")

