toTitleCase = require('to-title-case')

module.exports =
  activate: ->
    atom.commands.add 'atom-workspace', 'title-case:convert': => @convert()

  convert: ->
    editor = atom.workspace.getActiveTextEditor()
    buffer = editor.getBuffer()
    selections = editor.getSelections()

    # Group these actions so they can be undone together
    buffer.transact ->
      for selection in selections
        cased = toTitleCase selection.getText()
        selection.insertText("#{cased}")
