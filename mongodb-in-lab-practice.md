show dbs


use adina


show dbs


db.createCollection("students")


show collections


db.students.insertOne({name: "ali", age: 20, city:"Karachi"})


db.students.insertMany([{name:"adina", age:20, city:"Karachi"},{name:"Hafsa", age:25, city:"Karachi"}, {name:"sara", age:20, city:"Karachi"}])


db.students.find()


db.students.find({name:"ali", city:"Lahore"})



db.students.find({name:"ali", city:"Karachi"})



db.students.find({_id: ObjectId('691e933ef2bc37f680846e1b')})


db.students.insertMany([{name:"farhan", age:20, city:"Lahore"},{name:"Rizwan", age:25, city:"Multan"}, {name:"ali", age:20, city:"Karachi", country:"Pakistan"}])



db.students.find({})



db.students.find({$or:[{city:"Karachi"},{city:"Lahore"}]})




db.students.find({city:{$in ["Karachi", "Lahore"]}})




db.students.find({age:{$gt:22}});



db.students.find({city:{$ne:"Karachi"}});



db.students.find().sort({name:1});



db.students.find().sort({name:-1});



db.students.find.limit(3)



db.students.find().limit(2);



db.students.countDocuments();



db.students.updateOne({name:"adina"}, {$set:{city:"Hyderabad"}});



db.students.findOne({name:"adina"});



db.students.deleteOne({name:"ali", age:20});



# class activity

db.students.aggregate([{$group:{_id:"$city", total:{$sum:1}}}]);



db.students.aggregate([{$group:{_id:"$city", avgAge:{$avg:"$age"}}}]);
