//importing files
const express = require("express");
const mongoose = require("mongoose");
const authRouter=require("./routers/auth");
const productRouter=require("./routers/products")
const admin=require("./routers/admin");
const userRouter = require("./routers/user");
const app = express();
const port =process.env.port|| 3000;
// const port = 27017;
const DB='Your mongodb url'
// middleware
app.use(express.json());
app.use(express.urlencoded({extended:true}));
app.use(authRouter);
app.use(admin)
app.use(productRouter);
app.use(userRouter)
mongoose.connect(DB).then(()=>{console.log("connection successful");}).catch((e)=>{console.log(e);});

app.listen(port, "0.0.0.0", () => {
  console.log(`Connected at port ${port}`);
});
// API request
app.get("/admin/add-product1",(req,res)=>{
    res.send("Hello how are you")
}) 
   