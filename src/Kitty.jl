module Kitty

using Random

include("cut-file.jl")
export filename, filesuffix

include("cp-mv-rename.jl")
export mvrand, cprand

end # module Kitty
