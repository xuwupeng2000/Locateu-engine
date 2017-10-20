import authLogic from './auth_logic.js'
import React from 'react';
import { Route, Redirect } from 'react-router-dom'; 

const PrivateRoute = ({ component: Component, path: path }) => {
  return (
    <Route path={ path } render = {() => (
      authLogic.isAuthenticated() ? (
        <Component />
      ) : (
        <Redirect to='/login' />
      )
    )}/>
)};

export default PrivateRoute;