import express from 'express';
import { ApplyQuery } from '../database/sql';

const router = express.Router(); //라우터 객체 생성

router.get('/', (_req, res) => {
    res.render('home', { data: [] });//home view 렌더링, 데이터 전달
})//GET Handler

router.post('/', async (req, res) => {
    const vars = req.body;//query 추출
    const data = {
        Query: vars.Query
    };//query 저장
    console.log('data\n', data.Query);
    let all_data = [];

    try {
        const result = await ApplyQuery.applyquery(data.Query);//쿼리 실행, 결과 저장
        console.log('result\n', result);

        all_data.push('Query:')
        all_data.push('data.Query')
        all_data.push('Result:')
        for (let i = 0; i < result.length; i++) {
            all_data.push(JSON.stringify(result[i]));//결과 처리
        }
        console.log('all_data\n', all_data);
    }
    catch (error) {//에러 처리
        console.error('Error:', error.message);
        all_data.push(`${data.Query} is not a query, or there is an error.`);
        all_data.push('Please check.');
    }

    res.render('home', { data: all_data });//home 뷰 렌더링, 데이터 전달
})//POST Handler

module.exports = router;