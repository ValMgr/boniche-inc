const User = require("../models/user.model");

exports.getAll = (req, res) => {
  User.findAll((err, result) => {
    if (err) return res.status(500).send(err);
    res.status(200).send(result);
  });
};

exports.getBy = (req, res) => {
  User.findBy(req.params.value, (err, result) => {
    if (err) return res.status(500).send(err);
    res.status(200).send(result);
  });
};

exports.create = (req, res) => {
  User.create(req.body, (err, result) => {
    if (err) return res.status(500).send(err);
    res.status(200).send(result);
  });
};

exports.update = (req, res) => {
  User.update(req.body, (err, result) => {
    if (err) return res.status(500).send(err);
    res.status(200).send(result);
  });
};

exports.delete = (req, res) => {
  User.delete(req.params.id, (err, result) => {
    if (err) return res.status(500).send(err);
    res.status(200).send(result);
  });
};
