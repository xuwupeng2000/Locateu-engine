export const alertMessage = (err) => {
  let msg = err.response.data.errors;
  alert(msg);
};
