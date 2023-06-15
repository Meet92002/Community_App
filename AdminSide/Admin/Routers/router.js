const express = require('express');

const router = express.Router();

const passport = require('passport'); 

const AuthController = require('../Controller/AuthController');

router.get('/',passport.checkloginin,AuthController.get);

router.get('/login',passport.checkloginin,AuthController.get);

router.post('/loginData',passport.authenticate('local',{failureRedirect : '/login',successRedirect : '/dashboard/index', session : true}),AuthController.loginData);

router.use('/dashboard',passport.checkuserlogin,require('./Dashboard'));

module.exports = router