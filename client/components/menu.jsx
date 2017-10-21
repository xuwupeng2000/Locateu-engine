import React, { Component } from 'react'
import { NavLink } from 'react-router-dom';
import { stack as Menu } from 'react-burger-menu'

export default class CxtMenu extends Component {
  render() {
    return (
      <div>
        <Menu noOverlay>
          <NavLink to="/map" activeClassName="selected" >Map</NavLink>
          <NavLink to="/link_device" activeClassName="selected" >Link device</NavLink>
          <NavLink to="/devices" activeClassName="selected" >Manage devices</NavLink>
        </Menu>
      </div>
    )
  }
}
