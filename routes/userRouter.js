const express=require('express');
const dbconnection=require('../db');

const userRouter=express.Router();

userRouter.get('/:sp',async (req,res)=>{
    dbconnection.getConnection((err,connection)=>{
        if(err){
            res.json({
                error:err.message
            })
        }
        else{
            console.log("db connected");
            let speciality=req.params.sp;
            // console.log(spc);
            connection.query("select * from doctor where specialization=?",[speciality],async (err,result)=>{
                if(err){
                    res.json({
                        error:err.message
                    })
                }
                else if(result){
                    res.json(result)
                }
                //test
            
            })

        }
        connection.release();
    })

})


module.exports=userRouter;
