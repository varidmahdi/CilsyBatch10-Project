require('dotenv').config();

var mysql = require('mysql');

var con = mysql.createConnection({
  // host: "localhost",
  // user: "root",
  // password: "",
  // database: "nodejs_api"
  host: "process.env.DB_HOST",
  user: "process.env.DB_USER",
  password: "process.env.DB_PASS",
  database: "process.env.DB_NAME"
});

con.connect(function (err) {
  mysql
  if (err) throw err;
});

module.exports = con;