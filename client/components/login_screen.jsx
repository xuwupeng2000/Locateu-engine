import React, { Component } from 'react'
import http from 'axios'

export default class LoginScreen extends Component {

  constructor() {
    super();

    this.state = {
      email: '',
      password: ''
    };
  }

  authenticate(data) {
    http.post('/api/v1/user_tokens', data)
      .then((data) => {
        debugger
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
            <label>Email</label>
            <input name='email' onChange={this.onChange.bind(this)} type="text"/>
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
