"use strict";
exports.__esModule = true;
exports.activate = function (oni) {
    console.log("config activated");
    oni.input.unbind("<c-pageup>");
    oni.input.unbind("<c-pagedown>");
    oni.input.bind("<c-PageUp>", "tabnext");
    oni.input.bind("<c-PageDown>", "tabprev");
    if (process.platform == "darwin") {
        oni.input.unbind("<m-t>");
        oni.input.bind("<c-t>", "language.symbols.workspace", function () { return !oni.menu.isMenuOpen(); });
    }
};
exports.deactivate = function (oni) {
    console.log("config deactivated");
};
exports.configuration = {
    "experimental.markdownPreview.enabled": false,
    // this doesn't appear to work
    // "language.html.textMateGrammar": "/Users/proberts/.config/oni/html.tmLanguage.json",
    "language.yaml.textMateGrammar": "/Users/proberts/.config/oni/yaml.tmLanguage.json",
    "ui.colorscheme": "nord",
    "oni.bookmarks": ["~/src"],
    "oni.loadInitVim": true,
    "oni.splits.mode": "oni",
    "editor.split.mode": "oni",
    "ui.animations.enabled": true,
    "ui.fontSmoothing": "auto"
};
