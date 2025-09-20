const express = require('express');
const db = require('../config/database');
const router = express.Router();

// CREATE
router.post('/spaces', (req, res) => {
  const { name, imageUrl, price, city, country, rating } = req.body;
  const sql = `INSERT INTO spaces (name, imageUrl, price, city, country, rating) VALUES (?, ?, ?, ?, ?, ?)`;
  db.query(sql, [name, imageUrl, price, city, country, rating], (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    res.status(201).json({ id: result.insertId, ...req.body });
  });
});

// READ ALL
router.get('/spaces', (req, res) => {
  const sql = `SELECT * FROM spaces`;
  db.query(sql, (err, results) => {
    if (err) return res.status(500).json({ error: err.message });
    res.status(200).json(results);
  });
});

// READ ONE
router.get('/spaces/:id', (req, res) => {
  const sql = `SELECT * FROM spaces WHERE id = ?`;
  db.query(sql, [req.params.id], (err, results) => {
    if (err) return res.status(500).json({ error: err.message });
    if (results.length === 0) return res.status(404).json({ message: 'Space not found' });
    res.status(200).json(results[0]);
  });
});

// UPDATE
router.put('/spaces/:id', (req, res) => {
  const { name, imageUrl, price, city, country, rating } = req.body;
  const sql = `UPDATE spaces SET name = ?, imageUrl = ?, price = ?, city = ?, country = ?, rating = ? WHERE id = ?`;
  db.query(sql, [name, imageUrl, price, city, country, rating, req.params.id], (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    if (result.affectedRows === 0) return res.status(404).json({ message: 'Space not found' });
    res.status(200).json({ id: req.params.id, ...req.body });
  });
});

// DELETE
router.delete('/spaces/:id', (req, res) => {
  const sql = `DELETE FROM spaces WHERE id = ?`;
  db.query(sql, [req.params.id], (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    if (result.affectedRows === 0) return res.status(404).json({ message: 'Space not found' });
    res.status(200).json({ message: 'Space deleted successfully' });
  });
});

module.exports = router;
