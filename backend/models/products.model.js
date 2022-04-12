const mongoose = require("mongoose");
const product = mongoose.model(
  "products",
  mongoose.Schema(
    {
      productName: { type: String, required: true, unique: true },
      category: { type: mongoose.Schema.Types.ObjectId, ref: "Category" },
      productShortDescription: { type: String, required: false },
      productPrice: { type: Number, required: true },
      productSalePrice: { type: Number, required: true, default: 0 },
      productImage: { type: String },
      productSKU: { type: String, required: false },
      productType: { type: String, required: true, default: "simple" },
      productStatus: { type: String, default: "IN" },
    },
    {
      toJSON: {
        transform: function (doc, ret) {
          ret.productId = ret._id.toString();
          delete ret._id;
          delete ret._v;
        },
      },
    }
  )
);

module.exports = {
  product,
};
