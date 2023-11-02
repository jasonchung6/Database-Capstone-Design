import mysql from 'mysql2';

require("dotenv").config();

const pool = mysql.createPool({
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '1234',
    database: 'week5_1',
});

const promisePool = pool.promise();

export const ApplyQuery = {
    applyquery: async (Query) => {
        const sql = Query;
        const [result] = await promisePool.query(sql);
        return result;
    },
};