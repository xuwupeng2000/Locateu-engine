import React, { Component } from 'react'
import { httpClient } from './http_client.js'
import { alertMessage } from './alert_message.js'
import { withRouter } from 'react-router-dom'

class LinkDeviceScreen extends Component {

  constructor() {
    super();

    this.state = {
      serial_code: '',
      serial_code_confirmation: ''
    };
  }

  onSubmit(e) {
    e.preventDefault();

    this.addSensorToAccount({sensor: this.state });
  }

  addSensorToAccount(data) {
    httpClient.post('/api/v1/user_sensors', data)
      .then((resp) => {
        this.props.history.push('/devices');
      })
      .catch((err) => {
        alertMessage(err);
      });
  }

  onChange(e){
    const state = this.state
    state[e.target.name] = e.target.value;
    this.setState(state);
  }

  render() {
    return (
      <div>
        <h1>Link device to your account 🙋🏻‍♂️</h1>

        <form onSubmit={this.onSubmit.bind(this)}>
          <div>
            <label>Device serial number</label>
            <input name='serial_code' onChange={this.onChange.bind(this)} type="text"/>
          </div>
          <div>
            <label>Device serial number confirmation</label>
            <input name='serial_code_confirmation' onChange={this.onChange.bind(this)} type="text"/>
          </div>
          <div>
            <button>Confirm</button>
          </div>
        </form>
      </div>
    )
  }
};
export default  withRouter(LinkDeviceScreen);