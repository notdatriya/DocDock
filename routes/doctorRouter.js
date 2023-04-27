const express=require('express');
const dbconnection=require('../db');

const doctorRouter=express.Router();

doctorRouter.post('/app',async(req,res)=>{
  

    dbconnection.getConnection((err,connection)=>{
        if(err){
            res.json({
                error:err.message
            })
        }

        else{
            let {doctor_id,_date}=req.body;
            connection.query("select appointment.slot, patient.FirstName,patient.LastName,patient.age,patient.gender from appointment join patient on appointment.patient_id=patient.patient_id where appointment.doctor_id=? and appointment._date=?",[doctor_id,_date],(err,result)=>{
                if(err){
                    res.json({
                        error:err.message
                    }
                    )
                }
                else if(result.length==0){
                    res.json([{
                        slot:"No Data",
                        FirstName:"No appointments for today!",
                        LastName:"",
                        age:0,
                        gender:""
                    }])
                }
                else{
                    res.json(result)
                }
            })
        }
        connection.release();
    })
})

module.exports=doctorRouter;