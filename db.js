
require('dotenv').config()
const mysql= require('mysql');

let dbconnection=mysql.createPool({
    host:'sql6.freemysqlhosting.net',
    user:process.env.user,
    password:process.env.password,
    database:'sql6640151'
});



module.exports=dbconnection;

