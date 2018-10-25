var express = require('express');
var app = express();
var bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({extended:true}));
app.set('view engine','ejs');

//mongoose Connection
var mongoose=require('mongoose');
mongoose.connect('mongodb://localhost:27017/cloudfinalmean',{ useNewUrlParser: true } );
var db = mongoose.connection;
db.on('error', console.error.bind(console, 'connection error:'));

var userSchema=new mongoose.Schema({
    firstName: String,
    lastName: String,
    enrollmentDate: Date
});
var user=mongoose.model('user',userSchema);

//Start port
var port = 3000;
app.listen(port, () => {
  console.log('successfully started on port :' +port);
});


app.get("/", function (req, res) {
    res.render('index.ejs',{toUpdate:false});
});


//INSERT
app.post("/insert", function (req, res) {
    var newUser=new user({
      firstName:req.body.firstName,
      lastName:req.body.lastName,
      enrollmentDate:req.body.enrollmentDate
    });
    newUser.save(function(err,newUser){
        if(err) return console.error(err);
    });
    res.redirect('/display');
});

//DISPLAY
app.get("/display", function (req, res) {
    user.find({},function(err,totalData){
        res.render('display.ejs',{
          displayData:totalData
        });
    });
});


//UPDATE
app.post("/update", function (req, res) {
    var toUpdate=req.body.updateByfirstName;
    user.find({firstName:toUpdate},function(err,updateData){
        res.render("index.ejs",{
          toUpdate:true,
          firstNameVal:updateData[0].firstName,
          lastNameVal:updateData[0].lastName,
          enrollmentDateVal:updateData[0].enrollmentDate
        });
        user.deleteOne({firstName:toUpdate},function(err){});
    });
});

app.post("/search", function (req, res) {
  var searchQuery=req.body.searchq;
  console.log(searchQuery);
    user.find({firstName:searchQuery},function(err,totalData){
        res.render('search.ejs',{
          displayData:totalData
        });
    });
});

app.get("/contact", function(req,res){
    res.render('contact.ejs');
});

//DELETE
app.post("/delete",function(req,res){
    user.deleteOne({firstName:req.body.deleteByfirstName},function(err){
      console.log('Deleting' +req.body.deleteByfirstName);
    });
    res.redirect("/display");
});
