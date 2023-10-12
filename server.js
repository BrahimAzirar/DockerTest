const ex = require('express');
require('dotenv').config();

const app = ex();

app.get('/', (req, res) => {
    const Env = process.env.MESSAGE;
    return res.send(`<h1>${ Env }, from brahim azirar</h1>`);
});

app.listen(3500, console.log("http://localhost:3500"));