const express = require("express");
const app = express();
require("dotenv").config();
const mongoose = require('mongoose')

app.get("/", (req, res) => {
  res.send("This is the home page");
});

mongoose.connect(process.env.DATABASE_URL ).then(()=>{
    console.log("Connected to database")

    app.listen(process.env.PORT, ()=>{console.log("Listening to Port number 5000")});
}
).catch((err)=>{
    console.log(err.message)
})

