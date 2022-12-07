include("aoc_helper.jl")

day = 7
input = readInput(day)
#input = readTest()
sinput = split(input, '\n')

function run(lines)
    dirsizes = Dict{String,Int}()
    dirstack = String[]

    for line in lines
        cmd = split(line)
        if cmd[2] == "cd"
            if cmd[3] == ".."
                old_path = joinpath(dirstack)
                pop!(dirstack)
                new_path = joinpath(dirstack)
                dirsizes[new_path] += dirsizes[old_path]
            else
                push!(dirstack, cmd[3])
                new_path = joinpath(dirstack)
                if !haskey(dirsizes, new_path)
                    dirsizes[new_path] = 0
                end
            end
        elseif isnumeric(cmd[1][1])
            dirsizes[joinpath(dirstack)] += parse(Int, cmd[1])
        end
    end
    
    while length(dirstack) > 1
        old_path = joinpath(dirstack)
        pop!(dirstack)
        new_path = joinpath(dirstack)
        dirsizes[new_path] += dirsizes[old_path]
    end

    sol1 =  sum(v for v in values(dirsizes) if v <= 100000)
    println("Solution for part 1: $sol1")

    # part 2
    total_size = 70000000
    size_taken = dirsizes["/"]
    free_space = total_size - size_taken
    required_free_space = 30000000
    lacking_free_space = required_free_space - free_space
    sol2 = minimum(v for v in values(dirsizes) if v >= lacking_free_space)
    println("Solution for part 2: $sol2")
end

run(sinput)
