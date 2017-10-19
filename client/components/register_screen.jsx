import React, {Component} from 'react';

export default class RegisterScreen extends Component {
  render() {
    return (
      <div>
        <form action="">
          <div>
            <label htmlFor="">Email</label>
            <input type="text"/>
          </div>
          <div>
            <label htmlFor="">Password</label>
            <input type="password"/>
          </div>
          <div>
            <label htmlFor="">Password confirmation</label>
            <input type="password"/>
          </div>
          <div>
            <button>Confirm</button>
          </div>
        </form>
      </div>
    );
  }
}
