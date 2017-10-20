import React from 'react';
import {render} from 'react-dom';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom'; 
import LinkDeviceScreen from './components/link_device_screen.jsx'
import LoginScreen from './components/login_screen.jsx'
import RegisterScreen from './components/register_screen.jsx'
import MapScreen from './components/map_screen.jsx'
import PrivateRoute from './components/private_route.jsx'

render(
  <Router>
    <div>
      <Route exact path="/" component={LoginScreen}/> # Login
      <Route path="/register" component={RegisterScreen}/> # Create an account here
      <PrivateRoute path="/map">
        # Map of geo tracks, you can select device and see the track of it
        <MapScreen></MapScreen>
      </PrivateRoute>
      <PrivateRoute path="/link_device">
        # Link device to your account
        <LinkDeviceScreen></LinkDeviceScreen>
      </PrivateRoute>
    </div>
  </Router>,
  document.getElementById('root')
);
