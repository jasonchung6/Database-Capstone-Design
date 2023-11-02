import express from 'express';
import { selectSql, deleteSql } from '../database/sql';

const router = express.Router();

router.get('/class', async (req, res) => {
    if (req.session.student != undefined) {
        const data = {
            S_Id: req.session.student.id,
        };
        const ClassStu = await selectSql.getClassStu(data);
        res.render('deleteClass', {
            title: "Delete Class",
            ClassStu,
        });
    } else {
        res.redirect('/');
    }
});

router.post('/class', async (req, res) => {
    console.log("delete :", req.body.delBtn);
    const data = {
        D_Id: req.body.delBtn,
    };

    await deleteSql.deleteDepartment(data);

    res.redirect('/delete');
});

module.exports = router;

