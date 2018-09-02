"use strict";
exports.__esModule = true;
var Oni = require("oni-api");
var os = require("os");
var process = require("process");
exports.activate = function (oni) {
    console.log("config activated");
    if (os.platform() === "darwin") {
        oni.input.unbind("<m-,>");
        oni.input.unbind("<m-t>");
        oni.input.bind("<m-s-n>", "oni.process.openWindow");
        oni.input.bind("<m-s-o>", "workspace.openFolder");
    }
    else {
        oni.input.unbind("<c-t>");
        //oni.input.unbind("<c-s-n>");
        //oni.input.unbind("<c-s-o>");
        oni.input.bind("<s-c-n>", "oni.process.openWindow");
        oni.input.bind("<s-c-o>", "workspace.openFolder");
    }
    // tab switching
    oni.input.unbind("<c-pageup>");
    oni.input.unbind("<c-pagedown>");
    // jump to previous/next error
    oni.input.unbind("<c-,>");
    oni.input.bind("<c-,>", "oni.editor.previousError");
    oni.input.bind("<c-.>", "oni.editor.nextError");
    // find references
    oni.input.unbind("<c-f12>");
    oni.input.unbind("<s-f12>");
    oni.input.bind("<s-f12>", "language.findAllReferences");
};
exports.deactivate = function (oni) {
    console.log("config deactivated");
};
exports.configuration = {
    //"oni.hideMenu": true,
    "experimental.markdownPreview.enabled": true,
    "experimental.indentLines.enabled": true,
    "sidebar.plugins.enabled": true,
    // this doesn't appear to work
    // "language.html.textMateGrammar": "$HOME/.config/oni/html.tmLanguage.json",
    "language.yaml.textMateGrammar": "$HOME/.config/oni/yaml.tmLanguage.json",
    "language.dockerfile.languageServer.command": "docker-langserver",
    "language.dockerfile.languageServer.arguments": ["--stdio"],
    "workspace.defaultWorkspace": "$HOME/src",
    "ui.colorscheme": "nord",
    "editor.clipboard.synchronizeYank": false,
    "oni.loadInitVim": true,
    "oni.splits.mode": "oni",
    "editor.split.mode": "oni",
    "ui.animations.enabled": true,
    "ui.fontSmoothing": "auto"
};
Object.keys(exports.configuration).forEach(function (key) {
    var homeDir = process.env.HOME;
    var val = exports.configuration[key];
    if (typeof val === "string") {
        var valStr = val;
        exports.configuration[key] = valStr.replace(/^\$HOME/, homeDir);
    }
});
Oni.DefaultFileOpenOptions.openMode = Oni.FileOpenMode.NewTab;
