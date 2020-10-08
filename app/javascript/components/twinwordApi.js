const twinwordApi = () => {
	let formInput = document.getElementById("api-form-input");
	let query = formInput.innerText.split(" ");
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
		})
		.catch(err => {
			console.log(err);
		});
}

export { twinwordApi };