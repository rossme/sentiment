function twinwordApi() {
	// ONCLICK FUNCTION WHERE SHOULD IT GO?? //
	let formInput = document.getElementById("api-form-input");
	let query = formInput.innerText.split(" ");
	// encodeURI()
	let searchQuery = query.join('%20').toLowerCase();
	console.log(searchQuery);
	let url = `https://twinword-sentiment-analysis.p.rapidapi.com/analyze/?text=${searchQuery}`
	
	fetch(url, {
		"method": "GET",
		"headers": {
			"x-rapidapi-host": "twinword-sentiment-analysis.p.rapidapi.com",
			"x-rapidapi-key": "a5d18ad3eemshcdad0aeb6bdd35fp112bbdjsn47ff90eb1494"
		}
		})
		.then(response => {
			return response.json();
		}).then(function(parsedJson) {
			console.log(`You are ${parsedJson.type}`);

			const apiContainer = document.querySelector('#api-form-output');
			apiContainer.classList.remove('d-none');
			document.getElementById("api-form-output").innerHTML = `You are feeling ${parsedJson.type}`;

		})
		.catch(err => {
			console.log(err);
		});

}

export { twinwordApi };