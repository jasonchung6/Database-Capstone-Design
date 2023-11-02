import express from 'express';
import { insertSql } from '../database/sql';

const router = express.Router();

router.get('/', (_req, res) => {
    res.render('home', { data: [] });
})

router.post('/', async (req, res) => {
    const vars = req.body;

    const data = {
        Id: vars.id,
        Name: vars.name,
        Email: vars.email,
        PhoneNumber: vars.phoneNumber,
        Major: vars.major,
    };

    insertSql.setStudent(data);
})

module.exports = router;