###* @jsx React.DOM ###

INPUT_PLACEHOLDER = 'Введите номер телефона'

KEYCODE_ENTER = 13

window.CallbackForm_Input = React.createClass

  propTypes:
    onCloseForm: React.PropTypes.func.isRequired
    onSendData:  React.PropTypes.func.isRequired

  getInitialState: ->
    isEmpty: true

  render: ->
    return `<input type="tel"
                   placeholder={ INPUT_PLACEHOLDER }
                   autoFocus="true"
                   className="kiosklanding-callback-form-input"
                   onBlur={ this.onBlur }
                   onKeyDown={ this.onChange }
                   onPaste={ this.onChange } />`

  onBlur: (e) ->
    if @getValue(e.target) is ""
      @props.onCloseForm()

  onChange: (e) ->
    if e.which == KEYCODE_ENTER
      console.log @props
      @props.onSendData(@getValue(e.target))
      return false

  getValue: (target) ->
    target.value.trim()

