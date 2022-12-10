include("aoc_helper.jl")

day = 10
input = readInput(day)
#input = readTest()
sinput = split(input, '\n')

function run(sinput)
    cycle = 0
    x = 1
    sum = 0
    results = [0]
    for instr in sinput
        if instr == "noop"
            cycle += 1
            push!(results, cycle*x)
        else
            cycle += 1
            push!(results, cycle * x)
            cycle += 1
            push!(results, cycle * x)
            x += parse(Int, split(instr, " ")[2])
        end
    end
    sum = 0
    for i in 0:5
        sum += results[21+(40*i)]
    end
    sol1 = sum
    println("Solution part 1: $sol1")

    # part 2

    pos = 0
    x = 1
    results2 = Char[]

    for instr in sinput
        if instr == "noop"
            abs((pos % 40) - x) <= 1 ? push!(results2, '#') : push!(results2, '.')
            pos += 1
        else
            abs((pos % 40) - x) <= 1 ? push!(results2, '#') : push!(results2, '.')
            pos += 1
            abs((pos % 40) - x) <= 1 ? push!(results2, '#') : push!(results2, '.')
            pos += 1
            x += parse(Int, split(instr, " ")[2])
        end
    end

    for i in 0:5
        println(String(results2[(1+i*40):(40+i*40)]))
    end
end

run(sinput)