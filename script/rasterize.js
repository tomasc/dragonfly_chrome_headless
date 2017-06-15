// extracted from https://github.com/westy92/html-pdf-chrome

const fs = require("fs");
const htmlPdf = require('html-pdf-chrome');

const args = process.argv.slice(2);

const path = args[0];
const filename = args[1];
const html = fs.readFileSync(path, 'utf8');

var options = {};
if (args[2]) { options = JSON.parse(args[2]); }

htmlPdf.create(html, options).then((pdf) => pdf.toFile(filename));
