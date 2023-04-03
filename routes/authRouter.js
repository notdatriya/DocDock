const express=require('express');
const connection=require('../db');
const bcrypt=require('bcrypt');

const authRouter=express.Router();

authRouter.post('/signup',async (req,res)=>{
    let {FirstName,LastName,email,passwordd,phone_no,dob,age,gender,city}=req.body;
    passwordd=await bcrypt.hash(passwordd,10);
    connection.query("insert into Patient(FirstName,LastName,email,passwordd,phone_no,dob, age,gender,city)values(?,?,?,?,?,?,?,?,?)",
    [FirstName,LastName,email,passwordd,phone_no,dob, age,gender,city],(err,result)=>{
        if(err){
            res.json({
                error:err.message,
                success:0
            })
        }
        else if(result){
            res.json({
                success:1,
                message:"User registered successfully",
                data:result
            })
        }
    });
});

authRouter.post('/login',async(req,res)=>{
    let {phone_no,passwordd}=req.body;
    connection.query("select * from Patient where phone_no=?",[phone_no],async(err,result)=>{
        if(err){
            res.json({
                message:err.message,
                success:0
            })
        }
        else if(result.length>0){
            const validpassword=await bcrypt.compare(passwordd,result[0].passwordd);
            if(validpassword){
                res.json({
                    success:1,
                    message:"user logged in"
                })
            }

            else{
                res.json({
                    message:"Incorrect password",
                    success:0
                })
            }
        }

        else{
            res.json({
                message:"user not found",
                success:0
            })
        }
    })

})
module.exports=authRouter;







