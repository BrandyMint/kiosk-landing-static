###* @jsx React.DOM ###

SHOW_STATE             = 'show'
INPUT_STATE            = 'input'
SENT_STATE             = 'sent'

OPEN_BUTTON_FULL_TEXT_ =  'Оставьте свой телефон и мы вам перезвоним'
OPEN_BUTTON_SHORT_TEXT = 'Перезвоните мне'

SUBMIT_BUTTON_TEXT     =  'Отпр.'

INPUT_PLACEHOLDER      = 'Введите номер телефона'

KEYCODE_ENTER          = 13

window.CallbackForm_Mixin =
  _sendData: (phoneNumber) ->
    $.ajax url: Routes.getCallbackPath()
      data:
        phoneNumber: phoneNumber
      success: (response) ->
        console.log 'okey'
      error: (xhr, status, error) ->
        console.warn error

window.CallbackForm_OpenButton = React.createClass

  propTypes:
    onClick: React.PropTypes.func.isRequired

  render: ->
    return `<button className="btn kiosklanding-callback-form-open-button"
                    onClick={ this.props.onClick }>
              <span className="hidden-xs hidden-sm">{ OPEN_BUTTON_FULL_TEXT_ }</span>
              <span className="hidden-md hidden-lg">{ OPEN_BUTTON_SHORT_TEXT }</span>
            </button>`

window.CallbackForm_SubmitButton = React.createClass

  propTypes:
    onClick: React.PropTypes.func.isRequired

  render: ->
    return `<button className="btn kiosklanding-callback-form-submit-button"
                    onClick={ this.props.onClick }>
              { SUBMIT_BUTTON_TEXT }
            </button>`



window.CallbackForm_Input = React.createClass
  propTypes:
    onEnter: React.PropTypes.func.isRequired
    onBlur: React.PropTypes.func.isRequired

  getInitialState: ->
    isEmpty: true

  render: ->
    return `<input ref="input"
                   type="tel"
                   placeholder={ INPUT_PLACEHOLDER }
                   autoFocus="true"
                   className="kiosklanding-callback-form-input"
                   onBlur={ this.onBlur }
                   onKeyDown={ this.onChange }
                   onPaste={ this.onChange } />`

  onBlur: ->
    if @getValue() is ""
      @props.onBlur()

  onChange: (e) ->
    if e.which == KEYCODE_ENTER
      @props.onEnter @getValue()
      return false

  getValue: ->
    @refs.input.getDOMNode().value.trim()


window.CallbackForm_Form = React.createClass
  mixins: [CallbackForm_Mixin]

  propTypes:
    onClose: React.PropTypes.func.isRequired

  render: ->
    return `<form className="kiosklanding-callback-form-form" onSubmit={ this.onSubmit }>
              <CallbackForm_SubmitButton onSendData={ this.props.onSendData } />
              <CallbackForm_Input onClose={ this.props.onClose }
                                  onSendData={ this.onSendData } />
            </form>`

  onSubmit: ->
    return false

window.CallbackForm = React.createClass

  getInitialState: -> currentState: SHOW_STATE

  render: ->
    formContent = switch @state.currentState
      when SHOW_STATE  then `<CallbackForm_OpenButton onClick={ this.activateOpenState } />`
      when INPUT_STATE then `<CallbackForm_Form onClose={ this.activateShowState } />`
      when SENT_STATE  then `<CallbackForm_Success />`
      else console.warn 'Unknown currentState of CallbackForm component', @state.currentState

    return `<div className="kiosklanding-callback-form">
              { formContent }
            </div>`

  activateShowState: -> @setState(currentState: SHOW_STATE)

  activateOpenState: -> @setState(currentState: INPUT_STATE)
