const express = require('express')
const mysql = require('mysql')
const bodyParser = require('body-parser');
const jwt = require('jsonwebtoken');
const cors = require('cors')
const app = express()
app.use(cors());
app.use(express.json());
app.use(bodyParser.json());

const secretKey = 'ABC@afafat';

const db = mysql.createConnection({
    host: 'localhost',
    user: "root",
    password: '',
    database: 'signup'
})

db.connect((err) => {
    if (err) {
        console.error('Error connecting to MySQL:', err);
    } else {
        console.log('Connected to MySQL');
    }
});

app.post('/signup', (req, res) => {
    const { name, email, password } = req.body;
    db.query('SELECT * FROM signup WHERE name = ? and email = ?', [name, email], (err, results) => {
        if (err) {
            console.error('MySQL error:', err);
            return res.status(500).json({ error: 'Internal Server Error' });
        }

        if (results.length > 0) {
            return res.status(400).json({ error: 'Username already exists' });
        }

        // Save the user to the database (you would hash the password in a real scenario)
        db.query('INSERT INTO signup (`name`, `email`, `password`) Values (?, ?, ?)', [name, email, password], (err) => {
            if (err) {
                console.error('MySQL error:', err);
                return res.status(500).json({ error: 'Internal Server Error' });
            }
        res.json({ message: 'Signup successful' });
        });
    });

})

app.post('/login', (req, res) => {
    const { name, email, password } = req.body;

    db.query('SELECT * FROM signup WHERE `email` = ? AND `password` = ?', [email, password], (err, results) => {
        if (err) {
            console.error('MySQL error:', err);
            return res.status(500).json({ error: 'Internal Server Error' });
        }

        if (results.length === 0) {
            return res.status(401).json({ error: 'Invalid credentials' });
        }

        if (results.length > 0) {
            return res.json("Success");
        }

        // Generate JWT token
        const token = jwt.sign({ email }, secretKey, { expiresIn: '1h' });
        
        res.json({ token });
    });


})

app.get('/protected', verifyToken, (req, res) => {
    res.json({ message: 'Access granted to protected route' });
});

function verifyToken(req, res, next) {
    const token = req.headers.authorization;

    if (!token) {
        return res.status(403).json({ error: 'Token not provided' });
    }

    jwt.verify(token, secretKey, (err, decoded) => {
        if (err) {
            return res.status(401).json({ error: 'Failed to authenticate token' });
        }

        req.user = decoded;
        next();
    });
}
app.listen(3001, () => {
    console.log('Server is running on port 3001');
})


