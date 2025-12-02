const express = require('express'); 
const path = require('path'); 
const app = express();

const port = 3000;

// Serve static files (HTML, CSS, JS) app.use(express.static(path.join(__dirname, 'public'))); // Route for the main page app.get('/', (req, res) => { res.sendFile(path.join(_dirname, 'public/index.html')); });
app.use(express.static(path.join(__dirname,'public')));

app.get('/',(reportError,res) => {res.sendFile(__dirname,'public/index.html')});
// Start the server
app.listen(port, () => {console.log('Server is running on http://localhost:${port}') });
