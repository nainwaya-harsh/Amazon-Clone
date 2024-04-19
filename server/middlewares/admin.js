const express=require('express');
const authRouter=express.Router();
const jwt=require('jsonwebtoken');
const User=require('../models/user');

const admin=async (req,res,next)=>{
    try {
        const token =req.header('x-auth-token')
        if(!token){
            return res.status(401).json({msg:'no auth token access denied'})
        }
        const verified= jwt.verify(token,"passwordKey")
        if(!verified) return res.status(401).json({msg:'Token verfication failed ,authoruzation denies'})

        const user=await User.findById(verified.id);
        if(user.type=='user' || user.type=='seller'){
            return res.status(401).json({msg:'You are not a authorized seller'});
        }
        req.user=verified.id;
        req.token=token;
        next();
    } catch (error) {
        
    }
}

module.exports=admin;