import express from "express";
import { selectSql } from "../database/sql";

const router = express.Router();

router.get('/', (req, res) => {
    res.render('login');
});

router.post('/', async (req, res) => {
    const vars = req.body;
    const Students = await selectSql.getStudent();

    Students.map((student) => {
        console.log('ID :', student.S_Id);
        if (vars.id == student.S_Id && vars.password === student.S_PhoneNumber) {
            console.log('login success!');
            req.session.student = { id: student.S_Id, checkLogin: true };
        }
    });

    if (req.session.student == undefined) {
        console.log('login failed!');
        res.send(`<script>
                    alert('login failed!');
                    location.href='/';
                </script>`)
    } else if (req.session.student.checkLogin) {
        res.redirect('/delect/class');
    }
});

module.exports = router;
