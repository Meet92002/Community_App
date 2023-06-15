const express = require('express');

const router = express.Router();

const DashboardController = require('../Controller/DashboardController');
const MatrimonyController = require('../Controller/MatrimonyController');
const FaqController = require("../Controller/FaqController");
const LeadController = require("../Controller/leadController");
const jobProfileController = require("../Controller/jobProfileController");

router.get('/user',DashboardController.user);
router.get('/AddUser',DashboardController.AddUser);
router.get('/EditUser',DashboardController.EditUser);
router.get('/index',DashboardController.index);
router.get('/dashboard',DashboardController.index);
router.post('/insertData',DashboardController.insertData);
router.get('/delete/:id',DashboardController.delete);
router.get('/edit/:id',DashboardController.edit);
router.post('/UpdateData',DashboardController.UpdateData);
router.get('/Personal',MatrimonyController.Personal);
router.post('/AddPersonal',MatrimonyController.InsertPersonal);
router.get('/deletePersonal/:id',MatrimonyController.deletePersonal);
router.get('/editPersonal/:id',MatrimonyController.editPersonal);
router.get('/EditPersonal',MatrimonyController.EditPersonal);
router.post('/editpersonal',MatrimonyController.editpersonal);
router.get('/Bussiness',MatrimonyController.Bussiness);
router.post('/AddBusiness',MatrimonyController.InsertBussiness);
router.get('/deleteBussiness/:id',MatrimonyController.deleteBussiness);
router.get('/editBussiness/:id',MatrimonyController.editBussiness);
router.get('/EditBussiness',MatrimonyController.EditBussiness);
router.post('/editbusiness',MatrimonyController.editbussiness);
router.get('/Family',MatrimonyController.Family);
router.post('/AddFamily',MatrimonyController.InsertFamily);
router.get('/deleteFamily/:id',MatrimonyController.deleteFamily);
router.get('/editFamily/:id',MatrimonyController.editFamily);
router.get('/EditFamily',MatrimonyController.EditFamily);
router.post('/editfamily',MatrimonyController.editfamily);
router.get('/Other',MatrimonyController.Other);
router.post('/AddOther',MatrimonyController.InsertOther);
router.get('/deleteOther/:id',MatrimonyController.deleteOther);
router.get('/editOther/:id',MatrimonyController.editOther);
router.get('/EditOther',MatrimonyController.EditOther);
router.post('/editother',MatrimonyController.editother);
router.get('/users-profile',DashboardController.account);
router.post('/profileData',DashboardController.profile);
router.get('/logout',DashboardController.logout);
router.get('/faq',FaqController.Faq);
router.get('/lead',LeadController.listLeads);
router.post('/lead',LeadController.insertData);
router.get('/addJobProfile',jobProfileController.jobProfilePage);
router.post('/addjobProfileData',jobProfileController.addjobProfileData);
router.get('/deleteJobProfile/:id',jobProfileController.deleteJobProfile);
router.get('/editJobProfile/:id',jobProfileController.editJobProfile);
router.get('/EditJobProfile',jobProfileController.EditJobProfile);
router.post('/editJobProfileData',jobProfileController.editJobProfileData);
router.post('/listinType',jobProfileController.listinType);



module.exports = router