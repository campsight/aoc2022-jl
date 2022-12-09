include("aoc_helper.jl")

day = 9
input = readInput(day)
#input = readTest()
sinput = split(input, '\n')

function infdist(a, b)
    maximum(abs, a .- b)
end

function touching(knob1, knob2)
    return (abs(knob1[1]-knob2[1]) <= 1) && (abs(knob1[2]-knob2[2]) <= 1)
end

function run(sinput)
    headpos = (0, 0)
    tailpos = (0, 0)

    visited = Set([tailpos])

    dirs = Dict([
        "U" => (0, 1),
        "D" => (0, -1),
        "R" => (1, 0),
        "L" => (-1, 0),
    ])

    # part 1

    for line in sinput
        dir, nb = split(line)
        nb = parse(Int, nb)
        dir_move = dirs[dir]

        for _ in 1:nb
            headpos = headpos .+ dir_move
            if !touching(headpos, tailpos)
                if headpos[1] == tailpos[1]  # on the same line horizontally
                    if headpos[2] > tailpos[2]
                        tailpos = (tailpos[1], tailpos[2]+1)
                    else
                        tailpos = (tailpos[1], tailpos[2]-1)
                    end
                elseif headpos[2] == tailpos[2]  # on the same line vertically
                    if headpos[1] > tailpos[1]
                        tailpos = (tailpos[1]+1, tailpos[2])
                    else
                        tailpos = (tailpos[1]-1, tailpos[2])
                    end
                else
                    tailpos = (tailpos[1] + (sign(headpos[1] - tailpos[1]) * 1), tailpos[2] + (sign(headpos[2] - tailpos[2]) * 1))
                end
                push!(visited, tailpos)
            end
        end
    end

    sol1 = length(visited)
    println("Solution for part 1: $sol1")

    # part 2

    knobs = [(0, 0) for _ in 1:10]
    visited = Set([(0, 0)])

    for line in sinput
        dir, nb = split(line)
        nb = parse(Int, nb)
        dir_move = dirs[dir]

        for _ in 1:nb
            knobs[1] = knobs[1] .+ dir_move
            for i in 2:10
                headpos = knobs[i-1]
                tailpos = knobs[i]
                if !touching(headpos, tailpos)
                    if headpos[1] == tailpos[1]  # on the same line horizontally
                        if headpos[2] > tailpos[2]
                            tailpos = (tailpos[1], tailpos[2]+1)
                        else
                            tailpos = (tailpos[1], tailpos[2]-1)
                        end
                    elseif headpos[2] == tailpos[2]  # on the same line vertically
                        if headpos[1] > tailpos[1]
                            tailpos = (tailpos[1]+1, tailpos[2])
                        else
                            tailpos = (tailpos[1]-1, tailpos[2])
                        end
                    else
                        tailpos = (tailpos[1] + (sign(headpos[1] - tailpos[1]) * 1), tailpos[2] + (sign(headpos[2] - tailpos[2]) * 1))
                    end
                    knobs[i] = tailpos
                    if i == 10
                        push!(visited, tailpos)
                    end
                end
            end
        end
    end

    sol2 = length(visited)
    println("Solution for part 2: $sol2")
end

run(sinput)