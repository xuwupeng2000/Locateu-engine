import AuthLogic from './auth_logic.jsx'
import React from 'react';
import { Route, Redirect } from 'react-router-dom'; 

const PrivateRoute = ({ component: Component }) => {
  return (
    <Route render = {(props) => (
      AuthLogic.isAuthenticated ? (
        <div> {props.childern} </div>
      ) : (
        <Redirect to={{ pathname: '/login' }}/>
      )
    )}/>
)};

export default PrivateRoute;