const userModel = require('../models/userModel.js')
const bcrypt = require('bcryptjs')
const loginUser = async(req, res)=>{
  try{
    const {email , password} = req.body
    if(!email || !password){
      return res.status(401).json({
        success: false,
        data : "Email and password entered are incorrect. Please try again"
      })
    
    }
     const user = await userModel.findOne({email})
     if(!user){
      return res.status(400).json({
        success: false, 
        data : "Unable to find the user"
      })

      
     }
     const isMatch = await bcrypt.compare(password, user.password)
     if(!isMatch){
      return res.status(401).json({
        success: false,
        data: "Password don't match"
      })
     }
      const payload ={
      userId: user._id,
      email: user.email,
    }

    const accessToken = jwt.sign(payload, process.env.JWT_SECRET_KEY, {expiresIn:'15m'})
    const refreshToken = jwt.sign(payload, process.env.JWT_SECRET_KEY, {expiresIn:'7d'})

    // Save refresh token to database
    await user.findByIdAndUpdate(user._id, { refreshToken: refreshToken }) // fixed variable name conflict

        const userResponse = {
      _id: user._id,
      username: user.username,
      email: user.email,
    }
    
    res.status(200).json({ 
      success: true, 
      data: {
        user: userResponse,
        token: accessToken,
        refreshToken: refreshToken
      }
    })}
  catch(err){
    res.status(401).json({
      succes: false,
      data : err.message
    })
  }
}
//ADD USER FUNCTION
const addUser = async(req, res)=>{
  try{
  
    const hashedpassword = await bcrypt.hash(req.body.password, 10)
    const user ={
      username: req.body.username,
      email: req.body.email,
      password : hashedpassword,
      phone_number : req.body.phone_number
    }
      const addUser = await userModel.create(user)
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