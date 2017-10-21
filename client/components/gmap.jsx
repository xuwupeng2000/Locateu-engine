import React, { Component } from 'react'
import { withScriptjs, withGoogleMap, GoogleMap, Marker } from "react-google-maps"
import { httpClient } from './http_client.js'

class PoiLitItem extends Component {

  render() {
    let track = this.props.track;
    return (
      <tr>
        <td>{track.id} 💰 🤤</td>
        <td>{track.created_at}</td>
        <td>{track.user.username}</td>
        <td>{track.sensor.serial_code}</td>
        <td> <button className="button button-small button-outline">View</button> </td>
      </tr>
    );
  }

}

class Gmap extends Component {
  constructor() {
    super();

    this.state = {
      geo_tracks: []
    };
  }

  fetchGeoTracks() {
    httpClient.get('/api/v1/user_geo_tracks')
      .then((resp) => {
        let tracks = resp.data.geo_tracks;
        this.setState({ geo_tracks: tracks });
      })
      .catch((err) => {
        alert(err);
      });
  }

  componentDidMount() {
    this.fetchGeoTracks();
  }

  render() {
    let showTracks = this.state.geo_tracks.map((track) => {
      return (
        <Marker key={track.id} position={{lat: track.lat, lng: track.lng}} />
      );
    });

    let list = this.state.geo_tracks.map((track) => {
      return (
        <PoiLitItem key={track.id} track={track}></PoiLitItem>
      );
    });

    return (
      <div>
        <GoogleMap defaultZoom={8} defaultCenter={{ lat: -34.397, lng: 150.644 }} >
          <Marker position={{ lat: -34.397, lng: 150.644 }} />
          {showTracks}
        </GoogleMap>

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
