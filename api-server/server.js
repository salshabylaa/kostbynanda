const express = require('express');
const app = express();
const PORT = 3000;

// Import data
const spaces = require('./data/spaces.json');

// Middleware untuk mengizinkan akses CORS
app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
  res.header('Access-Control-Allow-Headers', 'Content-Type');
  next();
});

// Endpoint untuk mendapatkan semua spaces
app.get('/spaces', (req, res) => {
  res.status(200).json(spaces);
});

// Jalankan server
app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});
