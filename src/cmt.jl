"""
julia> textbox("hello world")
#╭───────────────╮
#├─ hello world ─┤
#╰───────────────╯
"""
function textbox(str::String)
    L = length(str)
    B = "─"^L
    I = "#╭──"*  B  *"──╮"
    M = "#├─ "* str *" ─┤"
    F = "#╰──"*  B  *"──╯"
    println(I)
    println(M)
    println(F)
end

