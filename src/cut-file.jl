"""
    filename(path_name_suffix::String)
get the name part of path_name_suffix, which is like
    path   : /path/to/this/
    name   : TONY
    suffix : .txt

# Example
julia> filename("/path/to/this/TONY.txt")
"TONY"
"""
function filename(path_name_suffix::String)
    name_suffix = last( splitdir(path_name_suffix) )
    name = first( splitext(name_suffix) )
    return name
end


"""
    filesuffix(file::AbstractString)
返回文件最后一个后缀，比如 wav,txt,png，没有合规后缀就返回空 ""
# 例子
julia> filesuffix("name.wav.mp3")
"mp3"
julia> filesuffix("name.wav.")
""
julia> filesuffix("name.wav")
"wav"
julia> filesuffix("name.")
""
julia> filesuffix("name")
""
"""
@inline function filesuffix(file::AbstractString)
    name_suffix = split(file, ".")
    if length(name_suffix) > 1
        suffix = last(name_suffix)
        return suffix
    end
    return ""
end
