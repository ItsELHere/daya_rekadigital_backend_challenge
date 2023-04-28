import { Router } from "express";
import Transaction from "./controller.js";

const router = new Router();
const transaction = new Transaction();

router.get("/", transaction.getAllTransaction);
router.post("/new", transaction.newTransaction);
router.post("/", transaction.findMenu);

export default router;
