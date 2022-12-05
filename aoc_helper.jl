using Downloads: download
using Printf

# Fetch the input from the site
function fetchInput(day::Int, data_file::String)
    session_cookie = "53616c7465645f5feebda6b4715e7c0a1a08113494c79a06a52b0ef75001c89532a58c231db30135cd15ca202eb4fbccf067ce34e888e31def7141401d965802"
    url = "https://adventofcode.com/2022/day/$(day)/input"
    println("Fetching day $day: $data_file")
    download(url, data_file, headers = Dict("cookie" => "session=$(session_cookie)"))        
end

# Read the input from a file:
function readInput(path::String)
    s = open(path, "r") do file
        read(file, String)
    end
    return s
end

function readInput(day::Integer)
    path = joinpath(@__DIR__, "data", @sprintf("day%02d.txt", day))
    if ! isfile(path)
        fetchInput(day, path)
    end
    return readInput(path)
end
export readInput

function readTest()
    path = joinpath(@__DIR__, "data", "test.txt")
    s = open(path, "r") do file
        read(file, String)
    end
    return s
end
export readTest
