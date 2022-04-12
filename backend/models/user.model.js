const mongoose = require("mongoose");

const user = mongoose.model(
  "User",
  mongoose.Schema(
    {
      fullname: {
        type: String,
        required: true,
      },
      email: {
        type: String,
        required: true,
        unique: true,
      },
      password: {
        type: String,
        required: true,
      },
    },
    {
      toJSON: {
        transform: function (doc, ret) {
          ret.id = ret._id.toString();
          delete ret._id;
          delete ret.__v;
          //do not reveal passwordHash
          delete ret.password;
        },
      },
      timestamps: true,
    }
  )
);

module.exports = { user };
