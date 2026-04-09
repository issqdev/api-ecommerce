import { Router } from "express";
import UserRepository from '../repository/UserRepository.js';

const router = Router();

router
    .route('/')
    .get(async (req, res) => {
        const result = await new UserRepository().getAll();
        res.status(200).send(result);
    });

router
    .route('/:id')
    .get(async (req, res) => {
        const { id } = req.params;
        const result = await new UserRepository().getById(id);
        res.status(200).send(result);
    });

export default router;