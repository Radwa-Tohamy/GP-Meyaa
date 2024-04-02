const express = require("express");
const cors = require("cors"); // Import cors middleware
const app = express();
// ///for test retrieving data 
// // Define your data (replace with your actual data source)
// const data = [
//     { id: 1, name: 'Item 3' },
//     { id: 2, name: 'Item 2' },
//     { id: 1, name: 'Item 4' },
//     { id: 2, name: 'Item 5' }
//   ];
  
//   // Define your GET route
//   app.get('/data', (req, res) => {
//     res.json(data); // Send the data as JSON
//   });
//   //////
 
app.use(express.json());
// Use cors middleware
app.use(cors());
app.use("/api", require("./routes/app.routes"));

app.listen(4500, function(){
    console.log("server started successfully!")
})