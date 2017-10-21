import React, { Component } from 'react'
import { withScriptjs, withGoogleMap, GoogleMap, Marker } from "react-google-maps"
import { httpClient } from './http_client.js'
import _ from 'lodash'

class PoiLitItem extends Component {

  onViewClick(track) {
    this.props.map.panTo({lat: track.lat, lng: track.lng});
  }

  render() {
    let track = this.props.track;
    return (
      <tr>
        <td>{track.id} 💰 🤤</td>
        <td>{track.created_at}</td>
        <td>{track.user.username}</td>
        <td>{track.sensor.serial_code}</td>
        <td> <button onClick={this.onViewClick.bind(this, track)} className="button button-small button-outline">View</button> </td>
      </tr>
    );
  }

}

class Gmap extends Component {
  constructor() {
    super();

    this.state = {
      currentSelectedDevice: '',
      sensor_list: [],
      geo_tracks: []
    };
  }

  fetchGeoTracks() {
    httpClient.get('/api/v1/user_geo_tracks')
      .then((resp) => {
        let tracks = resp.data.geo_tracks;
        let sensors = resp.data.sensors;
        let mostRecent = _.last(tracks);

        this.setState({ geo_tracks: tracks, sensor_list: sensors, currentSelectedDevice: _.first(sensors).serial_code });
        this.map.panTo({lat: mostRecent.lat, lng: mostRecent.lng});
      })
      .catch((err) => {
        alert(err);
      });
  }

  componentDidMount() {
    this.fetchGeoTracks();
  }

  onSelectChange(e) {
    let currentSelected = e.currentTarget.value
    this.setState({currentSelectedDevice: currentSelected});
  }

  render() {
    let selectedTracks = _.filter(
      this.state.geo_tracks,
      (e) =>{
        return e.sensor.serial_code === this.state.currentSelectedDevice;
      });

    let showTracks = selectedTracks.map((track, index) => {
        return (
          <Marker key={track.id} label={index.toString()} position={{lat: track.lat, lng: track.lng}} />
        );
      });

    let list = selectedTracks.map((track) => {
      return (
        <PoiLitItem key={track.id} track={track} map={this.map}></PoiLitItem>
      );
    });

    let devicesOpts = this.state.sensor_list.map((e) => {
      return <option key={e.serial_code} value={e.serial_code}> {e.serial_code} </option>;
    });

    return (
      <div>
        <GoogleMap
          ref={(map) => { this.map = map; }}
          defaultZoom={8}
          defaultCenter={{ lat: -34.397, lng: 150.644 }} >
          {showTracks}
        </GoogleMap>

        <div>
          <select selected={this.state.currentSelectedDevice} onChange={this.onSelectChange.bind(this)}>
            {devicesOpts}
          </select>
        </div>

        <table>
          <tbody>
            {list}
          </tbody>
        </table>
      </div>
    )
  }
}

export default withScriptjs(withGoogleMap(Gmap));
