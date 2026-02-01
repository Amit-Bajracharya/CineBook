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
app.get('/user/api/:id', )



//GET ALL USER
app.get('/user/api')

//UPDATE USER BY ID
app.put('/user/api/:id', )

//DELETE USER
app.delete('/user/api/:id', 
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
