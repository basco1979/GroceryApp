const pushNotificationController = require("../controllers/push-notifications.controller");
const productsController = require("../controllers/products.controller");
const categoryController = require("../controllers/categories.controller");
const userController = require("../controllers/users.controllers");
const sliderController = require("../controllers/slider.controller");

const express = require("express");
const router = express.Router();

router.get("/sendNotification", pushNotificationController.sendNotification);
router.post(
  "/SendNotificationToDevice",
  pushNotificationController.sendNotificationToDevice
);
router.post("/products", productsController.create);
router.get("/products", productsController.findAll);
router.get("/products/:id", productsController.findOne);
router.put("/products/:id", productsController.update);
router.delete("/products/:id", productsController.delete);

router.post("/category", categoryController.create);
router.get("/category", categoryController.findAll);
router.get("/category/:id", categoryController.findOne);
router.put("/category/:id", categoryController.update);
router.delete("/category/:id", categoryController.delete);

router.post("/slider", sliderController.create);
router.get("/slider", sliderController.findAll);
router.get("/slider/:id", sliderController.findOne);
router.put("/slider/:id", sliderController.update);
router.delete("/slider/:id", sliderController.delete);

router.post("/register", userController.register);
router.post("/login", userController.login);
router.get("/user-profile", userController.userProfile);
module.exports = router;
