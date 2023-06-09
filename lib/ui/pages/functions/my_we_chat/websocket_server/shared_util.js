function strIsNotEmpty(str) {
    if(str) {
        let s = str.split(" ").join("")
        if(s.length != 0) {
            return true
        } else {
            return false
        }
    } else {
        return false
    }
    
}

module.exports = {
    strIsNotEmpty
}