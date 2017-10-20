import AuthLogic from './auth_logic.jsx'
import React from 'react';
import { Route, Redirect } from 'react-router-dom'; 

const PrivateRoute = ({ component: Component, path: path }) => {
  return (
    <Route path={ path } render = {() => (
      AuthLogic.isAuthenticated() ? (
        <Component />
      ) : (
        <Redirect to='/login' />
      )
    )}/>
)};

export default PrivateRoute;