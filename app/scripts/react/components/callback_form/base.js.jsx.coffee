###* @jsx React.DOM ###

CallbackForm_Input = require './input'
CallbackForm_SubmitButton = require './buttons/submit_button'

window.CallbackForm_Form = React.createClass

  propTypes:
    onCloseForm: React.PropTypes.func.isRequired

  render: ->
    return `<form className="kiosklanding-callback-form-form" onSubmit={ this.onSubmit }>
              <CallbackForm_SubmitButton onSendData={ this.props.onSendData } />
              <CallbackForm_Input onCloseForm={ this.props.onCloseForm }
                                  onSendData={ this.onSendData } />
            </form>`

  onSendData: (phoneNumber) ->
    console.log 'send'
    $.ajax
      method: 'get' # дефолтный метод
      data:
        phoneNumber: phoneNumber
      url: Routes.getCallbackPath()
      error: (xhr, status, error) ->
        console.warn error
      success: (response) ->
        console.log 'okey'

  onSubmit: ->
    return false