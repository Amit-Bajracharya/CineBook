const express = require("express");
const app = express();
require("dotenv").config();
const mongoose = require("mongoose");
const port = process.env.PORT;
const userRoutes = require('./routes/user-routes.js')
//EXPORT MODELS


app.use('/user/api', userRoutes)
app.get("/", (req, res) => {
  res.send("This is the home page");
});




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
