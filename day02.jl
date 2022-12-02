include("aoc_helper.jl")

day = 2
input = readInput(day)

# Part 1

sinput = split(input, '\n')

score = 0

for instr in sinput
    if length(instr) < 1  # empty line at end of file
        break
    end

    opp, you = split(instr)
    
    global score += you[1] - 'W'  # X = 1 => W = 0

    if (opp[1] - 'A') == (you[1] - 'X')
        score += 3
    end

    if opp == "A" && you == "Y" || opp == "B" && you == "Z" || opp == "C" && you == "X"
        score += 6
    end
end

sol1 = score

println("Solution for part 1: $sol1")

# Part 2

score = 0

for instr in sinput
    if length(instr) < 1  # empty line at end of file
        break
    end

    opp, you = split(instr)
    global score += (you[1] - 'X') * 3  
    pos = opp[1] - 'A'
    if you == "X"  # need to lose, so index one lower than that of your opponent
        if pos == 0
            pos = 3
        end
    elseif you == "Y" # need to draw, so same index (starting from 1)
        pos += 1
    else           # need to win, so index one higher than that of your opponent
        pos += 2
        if pos == 4
            pos = 1
        end
    end

    score += pos
end

sol2 = score
println("Solution for part 2: $sol2")