# 剪切或者复制 srcdir 文件夹里的文件到 dstdir 文件夹下， 文件按照 type 参数过滤
function mv_or_cp_with_random_name(op::Function, srcdir::String, dstdir::String; type::String, force::Bool=false)
    @assert isequal(op, mv) || isequal(op, cp) "cp or mv, not $op"
    @assert isdir(srcdir) "$srcdir is not a directory"
    @assert isdir(dstdir) "$srcdir is not a directory"
    @assert length(type)>0 "the file type shall be legal like txt/mp3/ppt etc..."
    
    dlm = "-"
    Random.seed!(floor(Int, time()))  # 单调时间作为随机种子
    for (path, dirs, files) in walkdir(srcdir)
        println("────── 🚚 Files in $path")
        for oldfile in files
            suffix = filesuffix(oldfile)
            !isequal(type, suffix) && continue
            # 生成几乎独一无二的新文件名,
            epochtime = floor(Int, time())
            timestamp = string(epochtime) * dlm
            randuint64 = string(rand(UInt64)) * dlm
            hashvalue = string(hash(oldfile))
            newfile = timestamp * randuint64 * hashvalue * "." * suffix
            # 移动或者拷贝文件
            oldpath = joinpath(path, oldfile)
            newpath = joinpath(dstdir, newfile)
            println(newpath, " ← ", oldpath)
            op(oldpath, newpath; force)
        end
    end
end



# 剪切 srcdir 文件夹里的文件到 dstdir 文件夹下， 文件按照 type 参数过滤
function mvrand(srcdir::String, dstdir::String; type::String, force::Bool=false)
    return mv_or_cp_with_random_name(mv, srcdir, dstdir; type, force)
end

# 复制 srcdir 文件夹里的文件到 dstdir 文件夹下， 文件按照 type 参数过滤
function cprand(srcdir::String, dstdir::String; type::String, force::Bool=false)
    return mv_or_cp_with_random_name(cp, srcdir, dstdir; type, force)
end

