import React from 'react';
import {render} from 'react-dom';
import { BrowserRouter as Router, Route, NavLink } from 'react-router-dom';
import LinkDeviceScreen from './components/link_device_screen.jsx'
import LoginScreen from './components/login_screen.jsx'
import RegisterScreen from './components/register_screen.jsx'
import MapScreen from './components/map_screen.jsx'
import PrivateRoute from './components/private_route.jsx'
import ManageDevicesScreen from './components/manage_devices_screen.jsx'
import CxtMenu from './components/menu.jsx'

render(
  <Router>
    <div>
      <div className="rc-container">
        <Route exact path="/" component={LoginScreen}/> # Login
        <Route path="/register" component={RegisterScreen}/> # Create an account here
        <Route path="/login" component={LoginScreen}/> # Create an account here
        <PrivateRoute path="/map" component={MapScreen}> </PrivateRoute>
        <PrivateRoute path="/link_device" component={LinkDeviceScreen}> </PrivateRoute>
        <PrivateRoute path="/devices" component={ManageDevicesScreen}> </PrivateRoute>
      </div>
    </div>
  </Router>,
  document.getElementById('root')
);
