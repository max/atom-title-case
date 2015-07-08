toTitleCase = require('to-title-case')

module.exports =
  activate: ->
    atom.commands.add 'atom-workspace', 'title-case:convert': => @convert()

  convert: ->
    editor = atom.workspace.getActiveTextEditor()
    selections = editor.getSelections()

    for selection in selections
      cased = toTitleCase selection.getText()
      selection.insertText("#{cased}")
