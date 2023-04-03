const mongoose=require('mongoose');
const db_link='mongodb+srv://Riya:flyingbeast@cluster0.cgv0v.mongodb.net/?retryWrites=true&w=majority';

mongoose.connect(db_link)
.then(function(db){
    console.log('user db connected');
})
.catch(function(err){
    console.log(err);
});

const userSchema=mongoose.Schema({

    patient_id:{
        type:Number
    },

    BloodGroup:{
        type:String
    }
    
})