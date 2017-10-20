import axios from 'axios'

let client = axios.create({});
client.defaults.headers.common['Authorization'] = localStorage.getItem('authToken');

export let httpClient = client;
