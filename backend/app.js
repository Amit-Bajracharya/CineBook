const express = require("express");
const app = express();
require("dotenv").config();
const mongoose = require("mongoose");
const port = process.env.PORT;

//EXPORT MODELS
const userModel = require('./models/userModel.js')

app.get("/", (req, res) => {
  res.send("This is the home page");
});

//ADD THE USER TO DATABASE
app.post('/user/api', )
//GET BY ID
app.get('/user/api/:id', async(req, res)=>{
  try{
    const {id} = req.body.id;
    if(!id){
      return res.status(401).json({
        success: false,
        data : "Unable to fetch id"
      })
      
    }
    const getUser = await userModel.findById(id)
    if(!getUser){
       return res.status(401).json({
        success: false,
        data : "Unable to get user"
      })
    }
    return res.status(200).json({
      success: false,
      data : getUser
    })
  }catch(err){
    res.status(200).json({
      success: true, 
      data : err.message
    })
  }
})



//GET ALL USER
app.get('/user/api', async(req, res)=>{
  try{
    const fetchUser = await userModel.find({})
    if(fetchUser.length === 0 ){
      return res.status(200).json({
        success: true,
        data: "No User found "
      })
    }
      if(!fetchUser){
      return res.status(200).json({
        success: true,
        data: "No User found "
      })
    }
    
  }catch(err){
    res.status(401).json({
      success : false,
      data: err.message
    })
  }
})

//UPDATE USER BY ID
app.put('/user/api/:id', async (req, res)=>{
   try {
     const  {id} = req.body.id
     if(!id){
       return res.status(401).json({
         success: false,
         data :"Id not found"
       })
     }
       const updateUser = await userModel.findByIdAndUpdate(id)
       if(!updateUser){
         return res.status(401).json({
           success: false, 
           data: "Unable to add user"
         })
       }
       const updatedUser = await userModel.findById(id)
       return res.status(401).json({
         success: true,
         data :updatedUser
       })
   } catch (error) {
     res.status(400).json({
        success: false, 
        data: error.message
     })
   }
})

//DELETE USER
app.delete('/user/api/:id', async (req, res)=>{
    try{
      const {id} = req.body.id
      if(!id){
       return res.status(401).json({
         success: false,
         data :"Id not found"
       })
    }
    const deleteUser = await userModel.findByIdAndDelete(id)
    if(!deleteUser){
      return res.status(401).json({
        success: false,
        data : "Unable to delete user"
      })
    }
    return res.status(200).josn({
      success: true,
      data : "Successfully deleted the User"
    })
}
catch(err){
       res.status(400).json({
        success: false, 
        data: error.message
     })
    }
  }
  )


mongoose
  .connect(process.env.DATABASE_URL)
  .then(() => {
    console.log("Connected to database");

    app.listen(process.env.PORT, () => {
      console.log(`Listening to Port number ${port}`);
    });
  })
  .catch((err) => {
    console.log(err.message);
  });
