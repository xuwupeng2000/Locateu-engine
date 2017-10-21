import React, { Component } from 'react'
import authLogic from './auth_logic.js'
import { httpClient } from './http_client.js'

export default class LoginScreen extends Component {

  constructor() {
    super();

    this.state = {
      username: '',
      password: ''
    };
  }

  authenticate(data) {
    httpClient.post('/api/v1/user_tokens', data)
      .then((resp) => {
        let { token, payload } = resp.data.auth_token;
        authLogic.saveAuthToken(token);
        httpClient.defaults.headers.common['Authorization'] = token;
        this.props.history.push('/map');
      })
      .catch((err) => {
        alert(err);
      });
  }

  onSubmit(e) {
    e.preventDefault();

    this.authenticate({auth: this.state});
  }

  onChange(e){
    const state = this.state
    state[e.target.name] = e.target.value;
    this.setState(state);
  }

  render() {
    return (
      <div>
        <h1>Login here 🤠</h1>
        <form onSubmit={this.onSubmit.bind(this)}>
          <div>
            <label>Password</label>
            <input name='username' onChange={this.onChange.bind(this)} type="text"/>
          </div>
          <div>
            <label>Password</label>
            <input name='password' onChange={this.onChange.bind(this)} type="password"/>
          </div>
          <div>
            <button>Confirm</button>
          </div>
        </form>

      </div>
    )
  }
};
