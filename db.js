const mysql=require('mysql');

let connection=mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'F@keaccount1',
    database:'docdock'
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

