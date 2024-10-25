import express from 'express';
import path from 'path'
import https from 'https';
import fs from 'fs';


const app = express();

app.use('/',(req,res) => {
    res.send('Hello World');
})


const server = https.createServer({
    key: fs.readFileSync(path.join(__dirname,'../assets/certs/private.key')),
    cert: fs.readFileSync(path.join(__dirname,'../assets/certs/certificate.crt'))   
}, app);


server.listen(3000, () => {
    console.log('Server is running on https://localhost:3000');
});