const mysql = require('mysql2');

const db = mysql.createConnection({
  host: 'localhost', // Alamat server MySQL
  user: 'root',      // User MySQL
  password: '',      // Password MySQL 
  database: 'spaceDB', // Nama database
});

db.connect(err => {
  if (err) {
    console.error('Database connection failed:', err.stack);
    return;
  }
  console.log('Connected to MySQL Database');
});

module.exports = db;
