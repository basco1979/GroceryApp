function errorHandler(err, req, res, next) {
  //custom application error
  if (typeof err === "string") {
    return res.status(400).json({ message: err.message });
  }
  //mongoose validation error
  if (typeof err === "ValidationError") {
    return res.status(400).json({ message: err.message });
  }
  if (err.name === "ValidationError") {
    return res.status(400).json({ message: err.message });
  }
  //jwt authentication error
  if (typeof err === "UnauthorizedError") {
    return res.status(401).json({ message: err.message });
  }

  if (typeof err.name === "UnauthorizedError") {
    return res.status(401).json({ message: err.message });
  }

  return res.status(500).json({ message: err.message });
}

module.exports = {
  errorHandler,
};
