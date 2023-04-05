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
                data:req.body
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


authRouter.post('/doctor',async (req,res)=>{
    let {FirstName,LastName,Age,gender,email,phone_no,Degree,Specialization,Years_of_experience}=req.body;
    connection.query("insert into doctor (FirstName,LastName,Age,gender,email,phone_no,Degree,Specialization,Years_of_experience) values (?,?,?,?,?,?,?,?,?)",[FirstName,LastName,Age,gender,email,phone_no,Degree,Specialization,Years_of_experience],(err,result)=>{
        if(err){
            res.json({
                error:err.message,
                success:0
            })
        }
        else if(result){
            res.json({
                success:1,
                message:"Doctor registered successfully",
                data:req.body
            })
        }
    })
})

authRouter.post('/avail',async (req,res)=>{
    let {doctor_id,_date,slot,_status}=req.body;
    connection.query("insert into availability (doctor_id,_date,slot,_status) values (?,?,?,?)",[doctor_id,_date,slot,_status],(err,result)=>{
        if(err){
            res.json({
                error:err.message,
                success:0
            })
        }
        else if(result){
            res.json({
                success:1,
                message:"slots registered successfully",
                data:req.body
            })
        }
    })
})


module.exports=authRouter;






