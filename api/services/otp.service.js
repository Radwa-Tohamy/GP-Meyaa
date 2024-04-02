const otpGenerator = require("otp-generator");
const crypto = require("crypto");
const key = "test123";
const emailServices = require("../services/emailer.service");
const { error } = require("console");

async function sendOTP(params, callback){
    const otp =otpGenerator.generate(
        4,{
            digits: true,
            upperCaseAlphabets: false,
            specialChars: false,
            lowerCaseAlphabets: false,
        }
    );
    const ttl = 2 * 60 * 1000; //2 min expiry
    const expires = Date.now() + ttl;
    const data = `${params.email}.${otp}.${expires}`;
    const hash = crypto.createHmac("sha256",key).update(data).digest("hex");
    const fullHash = `${hash}.${expires}`;

    var otpMessage = `Hello my friend, ${otp} is the one time password for your login\nThank You!`;
    var model = {
        email: params.email,
        subject: "Your OTP for Verification",
        body: otpMessage
    };

    emailServices.sendEmail(model, (error,result)=>{
        if(error){
            return callback(error); 
        }
        return callback(null, fullHash);
    });  
}

async function verifyOTP(params, callback){
    let [hashvalue,expires] = params.hash.split('.');

    let now = Date.now();

    if (now > parseInt(expires)) return callback("OTP Expired");
    
    let data = `${params.email}.${params.otp}.${expires}`;
    let newCalculatedHash = crypto.createHmac("sha256", key).update(data).digest("hex");
    if(newCalculatedHash === hashvalue) {
        return callback(null,"success");
    }
    return callback("Invalid oTP");
}

module.exports = {
    sendOTP,
    verifyOTP
}