///scr_str_copy_words(string,index,count);

// isolate words from a portion of passed text 

var str = argument0;
var idx = argument1;
var cnt = ceil(argument2);

var char = string_char_at(str,cnt);

while(char != " " && char !=""){
    cnt++;
    char = string_char_at(str,cnt);
}

var return_str = string_copy(str,idx,cnt);
return return_str;



