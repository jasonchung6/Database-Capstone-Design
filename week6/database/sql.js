import mysql from 'mysql2';

require("dotenv").config();

const pool = mysql.createPool({
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '1234',
    database: 'week6',
});

const promisePool = pool.promise();

// select query
export const selectSql = {
    getBuilding: async () => {
        const sql = `select * from building`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getDepartment: async () => {
        const sql = `select * from department`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getRoom: async () => {
        const sql = `select * from room`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getStudent: async () => {
        const sql = `select * from Student`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getClass: async () => {
        const sql = `select * from Class`;
        const [result] = await promisePool.query(sql);
        return result;
    },

}

// insert query , "${data.Major}"
export const insertSql = {
    setStudent: async (data) => {
        const sql = `INSERT INTO Student values (
            ${data.Id}, "${data.Name}", "${data.Email}", 
            "${data.PhoneNumber}", "${data.Major}"
        );`
        console.log(data);
        await promisePool.query(sql);
    },
};

// update query Major = "${data.Major}"
export const updateSql = {
    updateStudent: async (data) => {
        console.log(data);
        const sql = `
            UPDATE Student 
            SET S_Id = ${data.Id}, S_Name = "${data.Name}", 
                S_Email = "${data.Email}",
                S_PhoneNumber = "${data.PhoneNumber}",
                Major = "${data.Major}"
            WHERE S_Id = ${data.Id}`;
        console.log(sql);
        await promisePool.query(sql);
    },
    updateDepartment: async (data) => {
        console.log(data);
        const sql = `
            UPDATE Department 
            SET D_Id = "${data.Id}", D_Name = "${data.Name}", 
                D_Email = "${data.Email}",
                D_PhoneNumber = "${data.PhoneNumber}"
            WHERE D_Id = "${data.Id}"`;
        console.log(sql);
        await promisePool.query(sql);
    },
};