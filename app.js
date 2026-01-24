const express = require('express')
const app = express()


app.get('/', (req, res)=>{
    res.send("This is the home page")
})

app.listen(5000, 
    console.log("Listening to Port number 5000")
)