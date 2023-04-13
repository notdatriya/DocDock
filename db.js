
require('dotenv').config()
const mysql= require('mysql');

let dbconnection=mysql.createPool({
    host:'sql12.freemysqlhosting.net',
    user:process.env.user,
    password:process.env.password,
    database:'sql12611473'
});



module.exports=dbconnection;

