const mysql=require('mysql');

let dbconnection=mysql.createPool({
    host:'sql12.freemysqlhosting.net',
    user:'sql12611409',
    password:'cSbZ6gmQuL',
    database:'sql12611409'
});

// connection.connect((err)=>{
//     if(err){
//         console.log(err);
//     }
//     else{
//         console.log('db connected');
//     }
// });

module.exports=dbconnection;

