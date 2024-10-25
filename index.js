const express = require('express');
const https = require('https');
const fs = require('fs');
const path = require('path');

const app = express();

// SSL Certificate options
const sslOptions = {
    key: fs.readFileSync(path.join(__dirname,'certs', 'private.key')),
    cert: fs.readFileSync(path.join(__dirname,'certs', 'certificate.cert'))
};

// Define routes
app.get('/', (req, res) => {
    res.send('Hello, HTTPS!');
});

// Start HTTPS server
https.createServer(sslOptions, app).listen(443, () => {
    console.log('HTTPS server is running on https://localhost');
});

