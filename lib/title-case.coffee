module.exports =
  activate: ->
    atom.workspaceView.command "title-case:convert", => @convert()

  convert: ->
    editor = atom.workspace.activePaneItem
    selection = editor.getSelection()

    toTitleCase = require('to-title-case')
    cased = toTitleCase selection.getText()

    selection.insertText("#{cased}")
