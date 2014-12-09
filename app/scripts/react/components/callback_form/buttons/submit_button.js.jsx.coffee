###* @jsx React.DOM ###

TEXT =  'Отпр.'

window.CallbackForm_SubmitButton = React.createClass

  propTypes:
    onClick: React.PropTypes.func.isRequired

  render: ->
    return `<button className="btn kiosklanding-callback-form-submit-button"
                    onClick={ this.props.onClick }>
              { TEXT }
            </button>`