include("aoc_helper.jl")

day = 8
input = readInput(day)
#input = readTest()
sinput = split(input, '\n')

function run(sinput)
    trees = Int[]

    width = 0

    for l in sinput
        width = length(l)
        append!(trees, c - '0' for c in l)
    end

    height = length(trees) ÷ width

    trees = reshape(trees, width, height)

    sum = 0

    for i in 1:height, j in 1:width
        north = all(trees[k, j] < trees[i, j] for k in 1:(i - 1))
        south = all(trees[k, j] < trees[i, j] for k in (i + 1):height)
        west = all(trees[i, k] < trees[i, j] for k in 1:(j - 1))
        east = all(trees[i, k] < trees[i, j] for k in (j + 1):width)

        if any((north, south, west, east))
            sum += 1
        end
    end

    sol1 = sum
    println("Solution for part 1: $sol1")

    # part 2

    scenic_score = 0

    for i in 1:height, j in 1:width
        north = 0
        for k in reverse(1:(i - 1))
            north += 1
            if trees[k, j] >= trees[i, j]
                break
            end
        end
        south = 0
        for k in (i + 1):height
            south += 1
            if trees[k, j] >= trees[i, j]
                break
            end
        end
        west = 0
        for k in reverse(1:(j - 1))
            west += 1
            if trees[i, k] >= trees[i, j]
                break
            end
        end
        east = 0
        for k in (j + 1):width
            east += 1
            if trees[i, k] >= trees[i, j]
                break
            end
        end

        new_scenic_score = prod((north, south, west, east))

        if new_scenic_score > scenic_score
            scenic_score = new_scenic_score
        end
    end

    sol2 = scenic_score
    println("Solution for part 2: $sol2")
end

run(sinput)