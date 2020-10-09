
const form = document.querySelector('form');
const input = document.querySelector('#my-value')
const apiContainer = document.querySelector('#api-form-output');

// adding ev listener for submissions

form.addEventListener('submit', (ev) => {
  // prevent event from propagating
  ev.preventDefault();

	// cleaning previous results
  apiContainer.innerHTML = '';

  // lets get the form values
  const value = encodeURI(input.value);

  // call api and get result and do what I want
  myApi(value)
    .then((parsedJson) => {
      apiContainer.innerHTML = `You are feeling ${parsedJson.type}`;
    })
})
console.log('Hello from myApi.js');

const myApi = (message) => {
  let url = `https://twinword-sentiment-analysis.p.rapidapi.com/analyze/?text=${message}`

  return fetch(url, {
      "method": "GET",
      "headers": {
        "x-rapidapi-host": "twinword-sentiment-analysis.p.rapidapi.com",
        "x-rapidapi-key": "a5d18ad3eemshcdad0aeb6bdd35fp112bbdjsn47ff90eb1494"
      }
    })
    .then(response => {
      return response.json();
    })
    .catch(err => {
      console.log(err);
    });
}