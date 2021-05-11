// requires SQL
const mysql = require('mysql2');
// requires express
const express = require('express');

// PORT designation and app expression
const PORT = process.env.PORT || 3001;
const app = express();

// Express middleware
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

// Connect to database
const db = mysql.createConnection(
    {
        host: 'localhost',
        // Your MySQL username,
        user: 'root',
        // Your MySQL password
        password: 'C0ldD@ze',
        database: 'election'
    },
    console.log('Connected to the election database.')
);

// GET test to ensure the connection is working
// app.get('/', (req, res) => {
//     res.json({
//         message: 'Hello World'
//     });
// });

// Return all the data in the candidates table
db.query('SELECT * FROM candidates', (err, rows) => {
    console.log(rows);
});

// Default response for any other request (Not Found)
app.use((req, res) => {
    res.status(404).end();
})

// function that starts the Express.js server on port 3001
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});