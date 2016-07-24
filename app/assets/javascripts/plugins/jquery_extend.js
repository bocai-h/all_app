$.deserialize = function(str){
    // 把成对的值切出来
    var pairs = str.split(/&amp;|&/i);
    var h = {};
    for(var i=0;i< pairs.length;i++){
        var kv = pairs[i].split('=');
        h[kv[0]] = kv[1];
    }
    return h;
}