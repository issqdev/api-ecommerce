import 'dotenv/config';
import express from 'express';
import pool from './db.js';

const app = express();

app.get('/', async (req, res) => {
    const result =  (await pool.query('SELECT * FROM users')).rows;
    res.status(200).send(result);
});

app.listen(3000, () => {
    console.log('Servidor rodando em: http://localhost:3000...');
});