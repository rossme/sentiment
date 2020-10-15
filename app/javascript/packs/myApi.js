const form = document.querySelector('form');
const input = document.querySelector('#my-value')
const apiContainer = document.querySelector('#api-form-output');
// key env security to be defined and fixed. Temp fix.
const key1 = `6bdd`
const key2 = `ad0aeb${key1}35fp112`
// adding ev listener for submissions

form.addEventListener('submit', (ev) => {
  // prevent event from propagating
  ev.preventDefault();

	// cleaning previous results
  apiContainer.innerHTML = '';

  // lets get the form values (%20)
  const value = encodeURI(input.value);

  // call api and get result and do what I want
  myApi(value)
    .then((parsedJson) => {
      if (parsedJson.type == 'positive') {
        apiContainer.innerHTML = `You are feeling great!`;
      } else if (parsedJson.type == 'negative') {
        apiContainer.innerHTML = `You feel negative!`;
      } else {
        apiContainer.innerHTML = `You feel kind of neutral!`;
      }
    })
})

const myApi = (message) => {
  let url = `https://twinword-sentiment-analysis.p.rapidapi.com/analyze/?text=${message}`

  return fetch(url, {
      "method": "GET",
      "headers": {
        "x-rapidapi-host": "twinword-sentiment-analysis.p.rapidapi.com",
        "x-rapidapi-key": `a5d18ad3eemshcd${key2}bbdjsn47ff90eb1494`
      }
    })
    .then(response => {
      return response.json();
    })
    .catch(err => {
      console.log(err);
    });
}
console.log('2> myApi.js loaded')
