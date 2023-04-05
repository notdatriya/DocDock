const express=require('express');
const connection=require('../db');

const userRouter=express.Router();

userRouter.get('/:sp',async (req,res)=>{
let speciality=req.params.sp;
// console.log(spc);
connection.query("select * from Doctor where specialization=?",[speciality],async (err,result)=>{
    if(err){
        res.json({
            error:err.message
        })
    }
    else if(result){
        res.json(result)
    }

})
})

module.exports=userRouter;
