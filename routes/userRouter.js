const express=require('express');
const connection=require('../db');

const userRouter=express.Router();

userRouter.get('/:sp',async (req,res)=>{
let speciality=req.params.sp;
// console.log(spc);
connection.query("select * from Doctor where specialization=?",[speciality],async (err,result)=>{
    if(err){
        res.json({
            error:err.message,
            success:0
        })
    }
    else if(result){
        res.json({
            success:1,
            message:"Doctors fetched successfully",
            data:result
        })
    }

})
})

module.exports=userRouter;
