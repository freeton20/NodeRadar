const fs = require('fs')

const ips = [
   
];


function onlyUnique(value, index, self) {
    return self.indexOf(value) === index;
  }
  
  // usage example:
    var unique = ips.filter(onlyUnique);
    try {        
        fs.writeFileSync('./ips1.json', JSON.stringify(unique.slice(0,100)));
        fs.writeFileSync('./ips2.json', JSON.stringify(unique.slice(100,200)));
        fs.writeFileSync('./ips3.json', JSON.stringify(unique.slice(200,300)));
        fs.writeFileSync('./ips4.json', JSON.stringify(unique.slice(300,400)));
        fs.writeFileSync('./ips5.json', JSON.stringify(unique.slice(400,500)));
        fs.writeFileSync('./ips6.json', JSON.stringify(unique.slice(500,600)));
        fs.writeFileSync('./ips7.json', JSON.stringify(unique.slice(600,700)));
        fs.writeFileSync('./ips8.json', JSON.stringify(unique.slice(700,800)));
        //file written successfully
      } catch (err) {
        console.error(err)
      }
  //console.log(unique); // ['a', 1, 2, '1']