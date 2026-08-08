using Test
using Kitty

@testset "name and suffix" begin
    @test filename("/path/to/this/TONY.txt") == "TONY"
    @test filesuffix("name.wav.mp3") == "mp3"
    @test filesuffix("name.wav.") == ""
    @test filesuffix("name") == ""
end


