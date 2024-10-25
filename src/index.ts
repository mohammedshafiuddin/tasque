import express from 'express';
import path from 'path'
import https from 'https';


const app = express();

app.use('/',(req,res) => {
    res.send('Hello World');
})

const server = https.createServer({
    key: path.join(__dirname, 'certs', 'private.key'),
    cert: path.join(__dirname, 'certs', 'certificate.cert')   
}, app);

server.listen(3000, () => {
    console.log('Server is running on https://localhost:3000');
});