import * as Oni from "oni-api"
import * as os from "os"
import * as process from "process"

export const activate = (oni: Oni.Plugin.Api) => {
    console.log("config activated");

    if (os.platform() === "darwin") {
        oni.input.unbind("<m-,>");

        oni.input.unbind("<m-t>");
        oni.input.bind("<m-s-n>", "oni.process.openWindow")
        oni.input.bind("<m-s-o>", "workspace.openFolder")
    } else {
        oni.input.unbind("<c-t>");
        oni.input.bind("<c-s-n>", "oni.process.openWindow")
        oni.input.bind("<c-s-o>", "workspace.openFolder")
    }

    // tab switching
    oni.input.unbind("<c-pageup>");
    oni.input.unbind("<c-pagedown>");

    // jump to previous/next error
    oni.input.unbind("<c-,>");
    oni.input.bind("<c-,>", "oni.editor.previousError")
    oni.input.bind("<c-.>", "oni.editor.nextError")

    // find references
    oni.input.unbind("<c-f12>");
    oni.input.unbind("<s-f12>");
    oni.input.bind("<s-f12>", "language.findAllReferences")

}

export const deactivate = (oni: Oni.Plugin.Api) => {
    console.log("config deactivated");
}

export const configuration = {
    "oni.hideMenu": true,
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
}

Object.keys(configuration).forEach((key) => {
    let homeDir = process.env.HOME;
    let val = configuration[key];
    if (typeof val === "string") {
        let valStr:String = val;
        configuration[key] = valStr.replace(/^\$HOME/, homeDir);
    }
})

Oni.DefaultFileOpenOptions.openMode = Oni.FileOpenMode.NewTab;
