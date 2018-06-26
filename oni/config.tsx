import * as React from "react"
import * as Oni from "oni-api"

export const activate = (oni: Oni.Plugin.Api) => {
    console.log("config activated")

    oni.input.unbind("<c-pageup>")
    oni.input.unbind("<c-pagedown>")

    oni.input.bind("<c-PageUp>", "tabnext")
    oni.input.bind("<c-PageDown>", "tabprev")

    if (process.platform == "darwin") {
        oni.input.unbind("<m-t>")
        oni.input.bind("<c-t>", "language.symbols.workspace", () => !oni.menu.isMenuOpen())
    }
}

export const deactivate = (oni: Oni.Plugin.Api) => {
    console.log("config deactivated")
}

export const configuration = {
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
}
