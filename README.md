basic.ex -r ARG1=0 ARG2=0 ARG3=7 ARG4="0,0,1,1,1,2,3,5" ARG5="1,2,3,2,4,4,5,6" ARG6="red, green, blue, purple, orange"
basic.ex -r ARG1=1 ARG2=1 ARG3=5 ARG4="0,0,1,1,2,3" ARG5="1,2,2,3,3,4" ARG6="blue, purple, orange"
basic.ex -r ARG1=1 ARG2=0 ARG3=5 ARG4="0,1,1,3,2" ARG5="1,3,2,4,4" ARG6="red, green, blue" /error
basic.ex -r ARG1=1 ARG2=0 ARG3=5 ARG4="0,1,1,3,2,0" ARG5="1,3,2,4,4,2" ARG6="red, green, blue"

