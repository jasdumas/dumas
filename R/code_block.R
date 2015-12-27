# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
#  a series of one-liner functions / R Code 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


code_block = function(text) { 
l = nchar(text) 
cat(replicate(l, "#"), "\n", "# ", text, "\n", replicate(l, "#"))
}
