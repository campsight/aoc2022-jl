include("aoc_helper.jl")

day = 3
input = readInput(day)

# Part 1

sinput = split(input, '\n')
score = 0

function get_score(itm)
    value = Int(itm) - Int('A') + 1
    value = (value > 26) ? (value - 32) : (value + 26)
end

for rucksack in sinput
    contents = collect(rucksack)
    rs_size = size(contents)[1]
    comp1 = contents[1:(rs_size÷2)]
    comp2 = contents[(rs_size÷2+1):end]
    for itm in comp1
        if itm in comp2
            global score += get_score(itm)
            break
        end
    end
end

sol1 = score

println("Solution for part 1: $sol1")

# Part 2

group = String[]
n = size(sinput)[1]
score = 0

for i in 1:n
    push!(group, sinput[i])
    pos = (i-1) % 3
    if pos == 2
        for itm in group[1]
            if (itm in group[2]) && (itm in group[3])
                global score += get_score(itm)
                empty!(group)
                break
            end
        end
    end
end
    
sol2 = score

println("Solution for part 2: $sol2")