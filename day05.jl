include("aoc_helper.jl")

day = 5
input = readInput(day)
#input = readTest()
sinput = split(input, '\n')

# Part 1
prev_line = ""
nb_containerlines = 0
nb_instructionlines = 0
nb_stacks = 0
i = 0

# collect data format
for line in sinput
    if length(line) < 2
        global nb_stacks = parse(Int, (strip(prev_line)[end]))
        global nb_containerlines = i-1
        global nb_instructionlines = length(sinput) - i - 1
        break
    end
    global prev_line = line
    global i += 1
end

# create stacks
stacks = Vector{Char}[]
append!(stacks, Char[] for _ in 1:nb_stacks)

for i in nb_containerlines:-1:1
    println()
    cont_line = sinput[i]
    stackpos = 1
    for j in 2:4:(nb_stacks*4)
        cont = cont_line[j]
        if cont != ' '
            push!(stacks[stackpos], cont)
        end
        stackpos += 1
    end
end

println(stacks)

# execute instructions
for i in (nb_containerlines+3):length(sinput)
    _, nb_cont, _, from_stack, _, to_stack = split(sinput[i])
    nb_cont = parse(Int, nb_cont)
    from_stack = parse(Int, from_stack)
    to_stack = parse(Int, to_stack)
    global stacks
    for _ in 1:nb_cont
        push!(stacks[to_stack], pop!(stacks[from_stack]))
    end
end

sol1 = String([last(c) for c in stacks])

println("Solution for part 1: $sol1")

# Part 2

# create stacks
stacks = Vector{Char}[]
append!(stacks, Char[] for _ in 1:nb_stacks)

for i in nb_containerlines:-1:1
    println()
    cont_line = sinput[i]
    stackpos = 1
    for j in 2:4:(nb_stacks*4)
        cont = cont_line[j]
        if cont != ' '
            push!(stacks[stackpos], cont)
        end
        stackpos += 1
    end
end

println(stacks)

# execute instructions
for i in (nb_containerlines+3):length(sinput)
    _, nb_cont, _, from_stack, _, to_stack = split(sinput[i])
    nb_cont = parse(Int, nb_cont)
    from_stack = parse(Int, from_stack)
    to_stack = parse(Int, to_stack)
    global stacks
    append!(stacks[to_stack], @view stacks[from_stack][(end-nb_cont+1):end])
    resize!(stacks[from_stack], length(stacks[from_stack]) - nb_cont)
end

sol2 = String([last(c) for c in stacks])

println("Solution for part 2: $sol2")