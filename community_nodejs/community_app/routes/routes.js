var express = require('express');
var router = express.Router();
const multer = require('multer');

const PdfController = require('../controller/PdfController');

const memberDirectoryController = require('../controller/MemberDirectoryController');

const eventCommitteeController = require('../controller/EventCommitteeController');

const financeCommiteeController = require('../controller/FinanceCommitteeController');

const managementCommitteeController = require('../controller/ManagementCommitteeController');

const matrimonyPersonalController = require('../controller/MatrimonyPersonalController');

const matrimonyBusinessController = require('../controller/MatrimonyBusinessController');

const matrimonyFamilyController = require('../controller/MatrimonyFamilyController');

const matrimonyOtherController = require('../controller/MatrimonyOtherController');

const recentJobsController = require("../controller/recentJobsController");

const bidonWorkController = require("../controller/bidonWorkController");

const companyWorkController = require("../controller/companyWorkController");

const companyServiceController = require("../controller/companyServiceController");

const faqController = require("../controller/faqController");

const leadController = require("../controller/LeadController");

const RatingController = require("../controller/RatingController");

const PersonalProfileController = require("../controller/PersonalProfileController");

const PersonalAddressController = require("../controller/PersonalAddressController");

const notification = require('../controller/notification');

const businessProfileController = require("../controller/businessProfileController");

const jobProfileController = require("../controller/jobProfileController");

const myAskController = require("../controller/myAsksController");

const eventController = require("../controller/eventController");

const upload = multer({
    storage: multer.diskStorage({
        destination: function (req, file, cb) {
            cb(null, "./upload/pdf/");
        },
        filename: function (req, file, cb) {
            cb(null, file.originalname);
        },
    }),
}).single("user_file");

router.post('/notification', notification);

router.use('/upload', express.static('upload'));

router.post("/uploadPdf", upload, PdfController.uploadPdf);

router.get("/listPdf", PdfController.listPdf);

router.post("/createMemberDirectory", memberDirectoryController.createMemberDirectory);

router.get("/listMemberDirectory", memberDirectoryController.listMemberDirectory);

router.post("/createEventCommittee", eventCommitteeController.createEventCommittee);

router.get("/listEventCommittee", eventCommitteeController.listEventCommittee);

router.post('/createFinanceCommittee', financeCommiteeController.createFinanceCommittee);

router.get('/listFinanceCommittee', financeCommiteeController.listFinanceCommittee);

router.post("/createManagementCommittee", managementCommitteeController.createManagementCommittee);

router.get("/listManagementCommittee", managementCommitteeController.listManagementCommittee);

router.post("/createMatrimonyPersonalDetails", matrimonyPersonalController.createMatrimonyPersonalDetails);

router.get("/listMatrimonyPersonalDetails", matrimonyPersonalController.listMatrimonyPersonalDetails);

router.post("/createMatrimonyBusinessDetails", matrimonyBusinessController.createMatrimonyBusinessDetails);

router.get("/listMatrimonyBusinessDetails", matrimonyBusinessController.listMatrimonyBusinessDetails);

router.post("/createMatrimonyFamilyDetails", matrimonyFamilyController.createMatrimonyFamilyDetails);

router.get("/listMatrimonyFamilyDetails", matrimonyFamilyController.listMatrimonyFamilyDetails);

router.post("/createMatrimonyOtherDetails", matrimonyOtherController.createMatrimonyOtherDetails);

router.get("/listMatrimonyOtherDetails", matrimonyOtherController.listMatrimonyOtherDetails);

router.post("/addJobs", recentJobsController.addJobs);

router.get("/listJobs", recentJobsController.listJobs);

router.post("/addBidWork", bidonWorkController.addBidWork);

router.get("/listBidWork", bidonWorkController.listBidWork);

router.post("/addCompanyWork", companyWorkController.addCompanyWork);

router.get("/listCompanyWork", companyWorkController.listCompanyWork);

router.post("/addCompanyService", companyServiceController.addCompanyService);

router.get("/listCompanyService", companyServiceController.listCompanyService);

router.post("/addFaq", faqController.addFaq);

router.get("/listFaq", faqController.listFaq);

router.post("/addMyLead", leadController.addMyLead);

router.get("/listMyLead", leadController.listMyLead);

router.post("/addMyFeedback", RatingController.addMyFeedback);

router.get("/listMyFeedback", RatingController.listMyFeedback);

router.post("/createPersonalProfile", PersonalProfileController.createPersonalProfile);

router.get("/listPersonalProfile", PersonalProfileController.listPersonalProfile);

router.post("/createPersonalAddress", PersonalAddressController.createPersonalAddress);

router.get("/listPersonalAddress", PersonalAddressController.listPersonalAddress);

router.post("/createBusinessProfile", businessProfileController.createBusinessProfile);

router.get("/listBusinessProfile", businessProfileController.listBusinessProfile);

router.post("/createJobProfile", jobProfileController.createJobProfile);

router.get("/listJobProfile", jobProfileController.listJobProfile);

router.post("/createMyAsk", myAskController.createMyAsk);

router.get("/listMyAsk", myAskController.listMyAsk);

router.post("/createEvent", eventController.createEvent);

router.get("/listEvent", eventController.listEvent);

router.get("/filter",jobProfileController.filter);

router.post("/companytype",jobProfileController.AddCompanyType);

router.get("/listCompanyType", jobProfileController.listCompanyType);

router.post("/companylist", jobProfileController.CompanyList);

module.exports = router;