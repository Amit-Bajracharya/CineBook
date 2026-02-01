const userModel = require('../models/userModel.js')

//ADD USER FUNCTION
const addUser = async(req, res)=>{
  try{
    const addUser = await userModel.create(req.body)
    if(!addUser){
      return res.status(401).json({
        success: false, 
        data : "Unable to add the user"
      })
    }
      return res.statis(200).json({
        success: true,
        data : addUser
      })
    
  }catch(err){
    res.status(401).json({
      success : false,
      data: err.message
    })
  }
}

//UPDATE THE USER
const updateUser = async (req, res)=>{
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
}

//DELETE USER
const deleteUser = async (req, res)=>{
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

// GET USER BY ID
const getUserById = async(req, res)=>{
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
}

//GET ALL USERS
const getAllUsers =  async(req, res)=>{
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
}
module.exports = {addUser, deleteUser, getAllUsers, getUserById, updateUser}