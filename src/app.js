import Express from "express";
import cors from "cors";
import bodyParser from "body-parser";
import rateLimit from "express-rate-limit";

//  Route
import TransactionRouter from "./router.js";

const app = new Express();
const limiter = rateLimit({
  max: 5,
  windowMs: 10000,
});
const port = 8080;

app.use(bodyParser.urlencoded({ extended: true }));
app.use(limiter);
app.use(cors());

app.use("/transaction", TransactionRouter);

app.get("/", (req, res) => {
  res.send("API OK");
});

try {
  app.listen(port, () => {
    console.log(`Server was running on ${port}`);
  });
} catch (err) {
  console.log(err);
}
