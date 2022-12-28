const express= require('express');
const cors= require('cors');
const app= express();
const {db}= require('./model/dbConnection');
const serverPort= 8080;
app.use(cors());
app.use(express.urlencoded({ extended: true}));

app.use(express.json());
const path=require('path');
const multer= require('multer');
const storage= multer.diskStorage({
    destination:'./src/image/',
    filename:(req,file,cb)=>{
        return cb(null,`${file.fieldname}_${Date.now()}${path.extname(file.originalname)}`)
    }
});
const upload = multer({
    storage:storage,
    fileFilter:function(req,file,cb){
        if(!file.originalname.match()){
            req.fileValidationError='image file only';
            return cb(new Error('only image'),false);
        }
        cb(null,true);
    }
}).array('picture');

//post images
app.post('/uploadImage',upload,(req,res)=>{
    const sqlQuery= "INSERT INTO image (image) VALUE (?)";
console.log(req.files[0].path);
console.log(req.files);
//res.statusCode(201).json({result:req.files});
//res.send(req.files.originalname);
var paths=req.files[0].path;

res.send(paths);

});
//read parcel
app.get('/api/readParcel',(req,res)=>{
    const sqlQuery="SELECT * FROM parcel";
 
    db.query(sqlQuery,(err,result)=>{
        if(err){
            console.log(err);
        }else{
            //res.status(200).json({success:true, results:result});
            res.send(result);
            //res.jsonp(result);
          //res.status(200).json({result});
       
            console.log(result);
        }   
    });
});

//read parcel by id
app.get('/api/readParcelById/:idParcel',(req,res)=>{
    const idParcel=req.params.idParcel;
    
    const sqlQuery="SELECT * FROM parcel WHERE idParcel = ?";
    db.query(sqlQuery, idParcel, (err,result)=>{
        if(err){
            console.log(err);
        }else{
            res.send(result);
            console.log(result);
        }   
    });
});

//create parcel
app.post('/api/createParcel', async (req,res)=>{
    
    const parcelName= req.body.parcelName;
    const parcelDestination= req.body.parcelDestination;
    const latDes=req.body.latDes;
    const lngDes=req.body.lngDes;
    const parcelLocation=req.body.parcelLocation;
    const latLoc=req.body.latLoc;
    const lngLoc=req.body.lngLoc;

    const sqlQuery= "INSERT INTO parcel ( parcelName,parcelDestination, latDes, lngDes,parcelLocation,latLoc,lngLoc) VALUE ( ?, ?, ? , ?, ?, ?,?)";

    db.query(sqlQuery, [parcelName,parcelDestination, latDes,lngDes, parcelLocation,latLoc,lngLoc], (err,result)=>{
        if(err){
            console.log(err);
     
         }else{
            if(res.statusCode==200){
                res.send(true);
            }
            else{
                res.send(false);
            }
         }
    });
    
});
//update parcel
app.put('/api/updateParcelById/:idParcel',async(req,res)=>{
    const idParcel= req.body.idParcel;
    const parcelName= req.body.parcelName;
    const parcelDestination= req.body.parcelDestination;
    const latDes=req.body.latDes;
    const lngDes=req.body.lngDes;
    const parcelLocation=req.body.parcelLocation;
    const latLoc=req.body.latLoc;
    const lngLoc=req.body.lngLoc;
    const sqlQuery= "UPDATE parcel SET parcelName = ? ,parcelDestination=?,latDes=?,lngDes=?, parcelLocation = ? , latLoc=?,lngLoc=?  WHERE idParcel = ?";

    db.query(sqlQuery, [parcelName, parcelDestination,latDes,lngDes,parcelLocation,latLoc,lngLoc,idParcel], (err,result)=>{
        if(err){
            console.log(err);
     
         }else{
            
           res.send(result);
          
         }
    });
   });
//delete
app.delete('/api/deleteParcel/:idParcel',(req,res)=>{
    const idParcel = req.params.idParcel;

    const sqlQuery= "DELETE FROM parcel WHERE idParcel = ? ";

    db.query(sqlQuery, idParcel, (err,result)=>{
        if(err){
            console.log(err);
     
         }else{
            res.send(result);
             console.log(result);
         }
    });
     
 });

//read all user
app.get('/api/readUser',(req,res)=>{
    const sqlQuery="SELECT * FROM user";
    db.query(sqlQuery,(err,result)=>{
        if(err){
            console.log(err);
        }else{
            res.send(result);
            console.log(result);
        }
    });
});

app.get('/api/readUserById/:idUser',(req,res)=>{
    const iduser= req.params.iduser;
    const sqlQuery= "SELECT * FROM user WHERE iduser = ?";
    db.query(sqlQuery, iduser, (err,result)=>{
        if(err){
            console.log(err);
     
         }else{
             res.send(result);
             console.log(result);
         }
    });
    
});
app.get('/api/readUserByUsername',(req,res)=>{
    const username= req.body.username;
    const sqlQuery= "SELECT * FROM user WHERE username = ?";
    db.query(sqlQuery, username, (err,result)=>{
        if(err){
            console.log(err);
     
         }else{
             res.send(result);
             console.log(result);
         }
    });
    
});

app.get('/api/login/:email/:password',(req,res)=>{
    const email= req.params.email;
    const password= req.params.password;
    const sqlQuery= "SELECT * FROM user WHERE email = ? AND password = ?";
    if(email && password){
    db.query(sqlQuery, [email,password], (err,result)=>{
        if(err){
            throw error;
         }else{
            if(result.length>0){
             res.send(result); 
             console.log(result);
             }else{
             res.send(result);
            
             }
          
         }
    });
}
    else{
        res.send(false);
    }
    
});

//create
app.post('/api/createUser',(req,res)=>{
   
    const username= req.body.username;
    const password= req.body.password;
    const email= req.body.email;
    const address= req.body.address;
 
  
    const sqlQuery= "INSERT INTO user (email, password, username, address) VALUE (?, ?, ?, ? )";
if(username!=null&&password!=null&&email!=null&&address!=null){
    db.query(sqlQuery, [email, password,username, address], (err,result)=>{
        if(err){
            console.log(err);
     
         }else{
            res.status(201).send(result);
            console.log(result);
         }
    });
}else{
        res.status(404);
    }
    
});

//update
app.put('/api/updateUserById/',(req,res)=>{
     const id = req.body.iduser;
     const username= req.body.username;
     const password= req.body.password;
     const sqlQuery= "UPDATE user SET username = ? , password = ?  WHERE iduser = ? ";
 
     db.query(sqlQuery, [ username, password,id,], (err,result)=>{
         if(err){
             console.log(err);
      
          }else{
              res.send(result);
              console.log(result);
          }
     });
    });
app.put('/api/topUpUserById/:id',(req,res)=>{
    const id = req.params.iduser;
    const userMoney=req.body.userMoney;
    const sqlQuery= "UPDATE user SET userMoney = ? WHERE iduser = ? ";
        db.query(sqlQuery, [ userMoney,id,], (err,result)=>{
            if(err){
                console.log(err);
         
             }else{
                 res.send(result);
                 console.log(result);
             }
        });
       });
//delete
app.delete('/api/deleteUserById/:iduser',(req,res)=>{
    const id = req.params.iduser;

    const sqlQuery= "DELETE FROM user  WHERE iduser = ? ";

    db.query(sqlQuery, id, (err,result)=>{
        if(err){
            console.log(err);
         }else{
            
             res.send(result);
             console.log(result);
         }
    });
     
 });
 //money
//update
app.put('/api/topUp/',(req,res)=>{
    const id = req.params.idMoney;
    const amount= req.body.amount;
   
    const sqlQuery= "UPDATE user SET amount = ? WHERE idMoney = ? ";

    db.query(sqlQuery, [ amount,id,], (err,result)=>{
        if(err){
            console.log(err);
     
         }else{
             res.send(result);
             console.log(result);
         }
    });
   });
app.listen(serverPort,()=>{
console.log(`localhost:${serverPort}/api/`);
});