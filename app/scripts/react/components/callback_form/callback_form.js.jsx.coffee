###* @jsx React.DOM ###

CallbackForm_Form = require './base'
CallbackForm_Success = require './success'
CallbackForm_OpenButton = require './buttons/open_button'

SHOW_STATE = 'show'
INPUT_STATE = 'input'
SENT_STATE = 'sent'

window.CallbackForm = React.createClass

  getInitialState: -> currentState: SHOW_STATE

  render: ->
    formContent = switch @state.currentState
      when SHOW_STATE      then `<CallbackForm_OpenButton onClick={ this.activateOpenState } />`
      when INPUT_STATE      then `<CallbackForm_Form onCloseForm={ this.activateShowState } />`
      when SENT_STATE then `<CallbackForm_Success />`
      else console.warn 'Unknown currentState of CallbackForm component', @state.currentState

    return `<div className="kiosklanding-callback-form">
              { formContent }
            </div>`

  activateShowState: -> @setState(currentState: SHOW_STATE)

  activateOpenState: -> @setState(currentState: INPUT_STATE)

  handleOpen: ->
    #@setState currentState: INPUT_STATE

  handleClose: ->
    #@setState currentState: SHOW_STATE