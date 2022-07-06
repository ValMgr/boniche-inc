const mysql = require("mysql");
const connection = mysql.createConnection({
  host: "db",
  user: "root",
  password: "pipiboulent",
  database: "boniche_grange",
  port: "3306",
});

connection.connect((err) =>
  err ? console.log(err) : console.log("Connected to database")
);

module.exports = connection;
