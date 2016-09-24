var serverFactory = require("spa-server");
var open = require("open");

var port = 7000;
var server = serverFactory.create({
  path: "./build",
  port: port,
  fallback: "index.html"
});

server.start(function() {
  open("http://localhost:" + port);
});
