import 'dotenv/config';
import express from 'express';
import BaseRepository from './Repository/BaseRepository';

const app = express();

app.get('/users', async (req, res) => {
    const result = await (new BaseRepository()).getAll('users');
    res.status(200).send(result);
});

app.listen(3000, () => {
    console.log('Servidor rodando em: http://localhost:3000...');
});