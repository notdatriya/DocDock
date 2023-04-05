const mysql=require('mysql');

let connection=mysql.createConnection({
    host:'sql12.freemysqlhosting.net',
    user:'sql12611409',
    password:'cSbZ6gmQuL',
    database:'sql12611409'
});

connection.connect((err)=>{
    if(err){
        console.log(err);
    }
    else{
        console.log('db connected');
    }
});

module.exports=connection;

