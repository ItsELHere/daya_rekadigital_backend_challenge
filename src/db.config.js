import mysql from "mysql";
import * as dotenv from "dotenv";
dotenv.config();

const db = mysql.createConnection({
  host: process.env.HOSTNAME,
  user: process.env.USERNAME,
  password: process.env.PASSWORD,
  database: process.env.DATABASE,
});

db.connect((err) => {
  if (err) throw err;

  console.log("DB Connect...");
});

export default db;
