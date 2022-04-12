const { product } = require("../models/products.model");
const { category } = require("../models/category.model");
const dbConfig = require("../config/db.config");

async function createProduct(params, callback) {
  if (!params.productName) {
    return callback({ message: "Product Name is required" }, "");
  }
  if (!params.category) {
    return callback({ message: "Category is required" }, "");
  }
  const productModel = new product(params);
  productModel
    .save()
    .then((response) => {
      return callback(null, response);
    })
    .catch((error) => {
      return callback(error);
    });
}

async function getProducts(params, callback) {
  const productName = params.productName;
  const categoryId = params.categoryId;
  var condition = {};
  if (productName) {
    condition["productName"] = {
      $regex: new RegExp(productName),
      $option: "i",
    };
  }
  if (categoryId) {
    condition["categoryId"] = categoryId;
  }

  let perPage = Math.abs(params.pageSize) || dbConfig.PAGE_SIZE;
  let page = (Math.abs(params.page) || 1) - 1;

  product
    .find(
      condition,
      "productId productName productShortDescription productPrice productSalePrice productImage productSKU productType productStatus createdAt updatedAt"
    )
    .sort(params.sort)
    .populate("category", "categoryName categoryImage")
    .limit(perPage)
    .skip(perPage * page)
    .then((response) => {
      return callback(null, response);
    })
    .catch((error) => {
      return callback(error);
    });
}

async function getProductById(params, callback) {
  const productId = params.productId;
  product
    .findById(productId)
    .populate("category", "categoryNme categoryImage")
    .then((response) => {
      if (!response) callback("Product Id Invalid");
      else return callback(null, response);
    })
    .catch((error) => {
      return callback(error);
    });
}

async function updateProduct(params, callback) {
  const productId = params.productId;
  product
    .findByIdAndUpdate(productId, params, { useFindAndModify: false })
    .then((response) => {
      if (!response) callback("Product Id Invalid");
      else return callback(null, response);
    })
    .catch((error) => {
      return callback(error);
    });
}

async function deleteProduct(params, callback) {
  const productId = params.productId;
  product
    .findByIdAndRemove(productId)
    .then((response) => {
      if (!response) callback("Product Id Invalid");
      else return callback(null, response);
    })
    .catch((error) => {
      return callback(error);
    });
}

module.exports = {
  createProduct,
  getProductById,
  getProducts,
  updateProduct,
  deleteProduct,
};
