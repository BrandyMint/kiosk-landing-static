###* @jsx React.DOM ###

MESSAGE = 'Спасибо! Мы скоро свяжемся с Вами'

window.CallbackForm_Success = React.createClass

  render: ->
    return `<div className="kiosklanding-callback-form-success">{MESSAGE}</div>`