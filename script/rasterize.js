// extracted from https://github.com/westy92/html-pdf-chrome

const fs = require("fs");
const CDP = require('chrome-remote-interface');
// const htmlPdf = require('/usr/local/lib/node_modules/html-pdf-chrome');

const args = process.argv.slice(2);

const html = args[0];
const filename = args[1];
var options = {};

if (args[2]) {
  options = JSON.parse(args[2]);
}

options.port = 9222;

if (options.timeout === undefined) {
  options.timeout = 1;
}

// htmlPdf.create(html, options).then((pdf) => pdf.toFile(filename));

var __awaiter = (this && this.__awaiter) || function(thisArg, _arguments, P, generator) {
  return new(P || (P = Promise))(function(resolve, reject) {
    function fulfilled(value) {
      try {
        step(generator.next(value));
      } catch (e) {
        reject(e);
      }
    }
    function rejected(value) {
      try {
        step(generator["throw"](value));
      } catch (e) {
        reject(e);
      }
    }
    function step(result) {
      result.done
        ? resolve(result.value)
        : new P(function(resolve) {
          resolve(result.value);
        }).then(fulfilled, rejected);
    }
    step((generator = generator.apply(thisArg, _arguments || [])).next());
  });
};

function generate(html, options) {
  return __awaiter(this, void 0, void 0, function * () {
    return new Promise((resolve, reject) => {
      CDP(options, (client) => __awaiter(this, void 0, void 0, function * () {
        try {
          var {Page} = client;
          yield Page.enable(); // Enable Page events
          var url = html.toLowerCase().startsWith('http')
            ? html
            : `data:text/html,${fs.readFileSync(html)}`;
          yield Page.navigate({url});
          yield Page.loadEventFired();
          yield new Promise(resolve => {
            setTimeout(() => { resolve() }, options.timeout);
          })

          // https://chromedevtools.github.io/debugger-protocol-viewer/tot/Page/#method-printToPDF
          const pdf = yield Page.printToPDF(options.printOptions);
          return resolve(pdf.data);

        } catch (err) {
          reject(err);
        } finally {
          client.close();
        }
      })).on('error', (err) => {
        reject(err);
      });
    });
  });
}

function writeFile(filename, data) {
  return __awaiter(this, void 0, void 0, function * () {
    return new Promise((resolve, reject) => {
      fs.writeFile(filename, Buffer.from(data, 'base64'), (err) => {
        err
          ? reject(err)
          : resolve();
      });
    });
  });
}

generate(html, options).then((data) => {
  writeFile(filename, data)
})
