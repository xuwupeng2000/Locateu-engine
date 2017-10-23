import React, { Component } from 'react'
import Gmap from './gmap.jsx'

export default class MapScreen extends Component {
  render() {
    return (
      <div>
        <Gmap
          isMarkerShown
          googleMapURL="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=geometry,drawing,places"
          loadingElement={<div style={{ height: `100%` }} />}
          containerElement={<div style={{ height: `400px` }} />}
          mapElement={<div style={{ height: `100%` }} />}
        ></Gmap>
      </div>
    )
  }
}
