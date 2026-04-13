// middleware/auth.js — session-based auth guards

function requireLogin(role) {
  return (req, res, next) => {
    if (!req.session.user) {
      req.session.flash = 'Please log in first.';
      return res.redirect('/login');
    }
    if (role && req.session.user.role !== role) {
      req.session.flash = 'Access denied.';
      return res.redirect('/');
    }
    next();
  };
}

module.exports = { requireLogin };
