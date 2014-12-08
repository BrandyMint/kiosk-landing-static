###* @jsx React.DOM ###

FULL_TEXT =  'Оставьте свой телефон и мы вам перезвоним'
SHORT_TEXT = 'Перезвоните мне'

window.CallbackForm_OpenButton = React.createClass

  propTypes:
    onClick: React.PropTypes.func.isRequired

  render: ->
    return `<button className="btn kiosklanding-callback-form-open-button"
                    onClick={ this.props.onClick }>
              <span className="hidden-xs hidden-sm">{ FULL_TEXT }</span>
              <span className="hidden-md hidden-lg">{ SHORT_TEXT }</span>
            </button>`