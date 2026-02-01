const express = require('express')
const {addUser, deleteUser, getAllUsers, getUserById, updateUser} = require('../controller/user_controller.js')
const userRoute = express.Router()

//ADD THE USER TO DATABASE
userRoute.post('/', addUser) 

//GET BY ID
userRoute.get('/:id', getUserById)

//GET ALL USER
userRoute.get('/', getAllUsers)

//UPDATE USER BY ID
userRoute.put('/:id', updateUser)

//DELETE USER
userRoute.delete('/:id', deleteUser)