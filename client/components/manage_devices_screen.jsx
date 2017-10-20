import React, { Component } from 'react'
import { httpClient } from './http_client.js'

export default class ManageDevicesScreen extends Component {

  constructor() {
    super();

    this.state = {
      devices: [],
    };

    this.onButtonClick = this.onButtonClick.bind(this);
    this.listSensors();
  }

  unlinkSensorToAccount(id) {
    httpClient.delete('/api/v1/user_sensors/' + id)
      .then((resp) => {
        let sensors = resp.data.sensors;
        this.setState({ devices: sensors });
      })
      .catch((err) => {
        alert(err);
      });
  }

  listSensors() {
    httpClient.get('/api/v1/user_sensors')
      .then((resp) => {
        let sensors = resp.data.sensors;
        this.setState({ devices: sensors });
      })
      .catch((err) => {
        alert(err);
      });
  }

  onButtonClick(id, e) {
    e.preventDefault();

    if (confirm('Are you sure?')) {
      this.unlinkSensorToAccount(id);
    } else {

    }
  }

  render() {
    let devices = this.state.devices.map((d) => {
      return(
        <tr key={d.id}>
          <td>{d.serial_code} 📲</td>
          <td> <button onClick={this.onButtonClick.bind(this, d.serial_code)} className="button button-small button-outline">Unlink</button> </td>
        </tr>
      );
    });

    return (
      <div>
        <h1>Manage your devices here</h1>

        <table>
          <tbody>
            {devices}
          </tbody>
        </table>
      </div>
    )
  }
};
