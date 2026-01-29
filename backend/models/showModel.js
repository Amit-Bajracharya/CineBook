const mongoose = require("mongoose");

const showSchema = new mongoose.Schema(
  {
    movieId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Movie",
      required: true,
    },
    showDate: {
      type: Date,
      required: true,
    },
    showTime: {
      type: String,
      required: true,
    },
    price: {
      type: Number,
      required: true,
    },
    totalSeats: {
      type: Number,
      required: true,
      default: 100,
    },
    availableSeats: {
      type: Number,
      required: true,
    },
  },
  {
    timestamps: true,
  },
);

const showModel = mongoose.model("Show", showSchema);
module.exports = showModel;
