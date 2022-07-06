const db = require("../db/db");
const bcrypt = require("bcrypt");
const salt = 10;

const User = (user) => {
  this.id = user.id;
  this.name = user.name;
  this.email = user.email;
  this.role = user.role;
  this.password = user.password;
};

User.findAll = (result) => {
    db.query("SELECT * FROM users", (err, res) => {
        if (err) return result(err, null);
        result(null, res);
    });
};

User.findBy = (value, result) => {
    db.query(`SELECT * FROM users WHERE email = '${value}' OR name = '${value}'`, (err, res) => {
        if (err) return result(err, null);
        result(null, res);
    });
}

User.create = (user, result) => {
  bcrypt.hash(user.password, salt, (err, hash) => {
    if (err) return err;
    user.password = hash;
    db.query("INSERT INTO users SET ?", user, (err, res) => {
      if (err) return result(err, null);
      result(null, res);
    });
  });
};

User.update = (user, result) => {
    db.query(
        "UPDATE users SET name = ?, email = ?, role = ?, password = ? WHERE id = ?",
        [user.name, user.email, user.role, user.password, user.id],
        (err, res) => {
            if (err) return result(err, null);
            result(null, res);
        }
    );
}

User.delete = (id, result) => {
    db.query("DELETE FROM users WHERE id = ?", id, (err, res) => {
        if (err) return result(err, null);
        result(null, res);
    });
}

module.exports = User;
