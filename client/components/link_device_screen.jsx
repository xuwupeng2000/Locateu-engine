import React, { Component } from 'react'

export default class LinkDeviceScreen extends Component {
  render() {
    return (
      <div>
        <h1>Link device to your account 🙋🏻‍♂️</h1>
        <form action="">
          <div>
            <label htmlFor="">Device serial number</label>
            <input type="text"/>
          </div>
          <div>
            <button>Confirm</button>
          </div>
        </form>
      </div>
    )
  }
};
