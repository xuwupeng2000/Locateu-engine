import React, {Component} from 'react';
import { httpClient } from './http_client.js'
import { alertMessage } from './alert_message.js'

export default class RegisterScreen extends Component {

  constructor() {
    super();

    this.state = {
      username: '',
      email: '',
      password: '',
      password_confirmation: ''
    };
  }

  onSubmit(e) {
    e.preventDefault();

    this.createAccount({user: this.state });
  }

  createAccount(data) {
    httpClient.post('/api/v1/users', data)
      .then((resp) => {
        this.props.history.push('/map');
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
        <h1>Become a new user</h1>
        <form onSubmit={this.onSubmit.bind(this)}>
          <div>
            <label>Username</label>
            <input onChange={this.onChange.bind(this)} name='username' type="text"/>
          </div>
          <div>
            <label>Email <small> (optional, only be used for password recovery) </small> </label>
            <input onChange={this.onChange.bind(this)} name='email' type="email"/>
          </div>
          <div>
            <label>Password</label>
            <input onChange={this.onChange.bind(this)} name='password' type="password"/>
          </div>
          <div>
            <label>Password confirmation</label>
            <input onChange={this.onChange.bind(this)} name='password_confirmation' type="password"/>
          </div>
          <div>
            <button>Confirm</button>
          </div>
        </form>
      </div>
    );
  }
}
