const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const spaceRoutes = require('./routes/spaceRoutes');

const app = express();

// Middleware
app.use(cors());
app.use(bodyParser.json());

// Routes
app.use('/api', spaceRoutes);

// Start Server
const PORT = 5000;
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});


app.get('/', (req, res) => {
    res.send('Backend API untuk Flutter berjalan dengan baik!');
  });
  