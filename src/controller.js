import db from "./db.config.js";

class Transaction {
  getAllTransaction(req, res) {
    let selectAll = "Select * FROM transaction_table ORDER BY created_at DESC";
    db.query(selectAll, (err, result) => {
      if (err) throw err;
      res.status(200).json({
        msg: "Get all transaction.",
        data: result,
      });
    });
  }

  newTransaction(req, res) {
    let { transactionId, customerId, menu, price, qty, payment } = req.body;
    let total = price * qty;

    let insert = `INSERT INTO transaction_table (transaction_id, customer_id, menu, price, qty, payment, total) 
                  VALUES ( '${transactionId}', '${customerId}', '${menu}', ${price}, ${qty}, '${payment}', ${total})`;

    db.query(insert, (err, result) => {
      if (err) throw err;
      res.status(201).json({
        msg: "The data has been successfully added.",
        data: result,
      });
    });
  }

  findMenu(req, res) {
    let { menu } = req.query;
    menu = menu.replace(/_/g, " ");

    let find = `SELECT * FROM transaction_table WHERE menu='${menu}'`;
    db.query(find, (err, result) => {
      if (err || !result) {
        res.status(204).json({
          msg: "Data not found.",
          data: "",
        });
      } else {
        res.status(200).json({
          msg: "Data found.",
          data: {
            menu: result[0].menu,
            price: result[0].price,
          },
        });
      }
    });
  }
}

export default Transaction;
