
//smtp.gmail.com
var nodemailer = require('nodemailer');

async function sendEmail(params, callback){
    const transporter = nodemailer.createTransport({
        host: 'smtp.gmail.com',
        port: 587,
        auth: {
            user: 'meyaa.personalassistant@gmail.com',
            pass: 'axwg ipyl ifoa iyvx'   
        }
    });
    var mailOptions = {
        from: 'meyaa.personalassistant@gmail.com', //meyaa.personalassistant@gmail.com
        to: params.email,
        subject: params.subject,
        text: params.body,
    };
    transporter.sendMail(mailOptions, function (error ,info){
        if (error){
            return callback(error);
        }
        else{
            return callback(null, info.response);
        }
    })
}
module.exports ={
    sendEmail
}
