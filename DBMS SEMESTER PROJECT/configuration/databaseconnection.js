var mysql = require('mysql2');
var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'sharjeel',
    database: 'nadra_data',
    port: 3306
});
connection.connect(function(err) {
    if (!err) {
        console.log("Database is connected");
    } else {
        console.log("Error while connecting with database" + err.message);
    }
});

module.exports = connection;