import React, { Component } from 'react'
import { withScriptjs, withGoogleMap, GoogleMap, Marker } from "react-google-maps"
import { httpClient } from './http_client.js'

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

    return (
      <div>
        <GoogleMap defaultZoom={8} defaultCenter={{ lat: -34.397, lng: 150.644 }} >
          <Marker position={{ lat: -34.397, lng: 150.644 }} />
          {showTracks}
        </GoogleMap>
      </div>
    )
  }
}

export default withScriptjs(withGoogleMap(Gmap));
