class AuthLogic {

  isAuthenticated() {
    return this.getAuthToken();
  }

  saveAuthToken(token) {
    localStorage.setItem('authToken', token);
  }

  getAuthToken() {
    return localStorage.getItem('authToken');
  }

};

export default new AuthLogic();
