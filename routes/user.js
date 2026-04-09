import { Router } from "express";
import BaseRepository from '../repository/BaseRepository.js';

const router = Router();

router
    .route('/')
    .get(async (req, res) => {
        const result = await new BaseRepository().getAll('users');
        res.status(200).send(result);
    });

router
    .route('/:id')
    .get(async (req, res) => {
        const { id } = req.params;
        const result = await new BaseRepository().getById('users', id);
        res.status(200).send(result);
    });

export default router;