module Kitty

using Random

include("cut-file.jl")
export fullfilename, filename, filesuffix

include("cp-mv-rename.jl")
export mvrand, cprand
export copy_file_to_dir

include("cmt.jl")
export textbox

end # module Kitty
