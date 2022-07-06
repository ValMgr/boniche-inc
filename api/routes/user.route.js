module.exports = (app) => {
  const controller = require("../controllers/user.controller");
  const router = require("express").Router();

  router.get("/", controller.getAll);

  router.get("/:value", controller.getBy);

  router.post("/", controller.create);

  router.put('/:id', controller.update);

  router.delete('/:id', controller.delete);

  app.use("/api/users", router);
};
