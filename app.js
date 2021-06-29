const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => {
    res.send('Olá, Pagar-me!')
})

app.listen(port, () => {
    console.log(`Server is alive at http://localhost:${port}`)
})