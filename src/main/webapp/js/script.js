window.addEventListener('load', function () {
	const table = document.getElementById('listTable');
	let row;
	//Search Button click function
	document.getElementById("btnSearch").addEventListener("click",function(){

		var inputString = document.getElementById("textFieldSearch").value;
		console.log(inputString);

		fetch('http://10.0.0.225:8080/Tims/Search?input='+inputString.toLowerCase(),
			{
				method: "GET",
				headers : {
					'Content-Type' : 'application/json'
				}

			}
		)
		.then(res => res.json())
		.then(data => {
			console.log(data);
			fillTable(data);
		});


		});

	function fillTable(searchResult){
		console.log("Entered fillTable method!")
		const tbody = document.querySelector('tbody');
		tbody.innerHTML = '';

		searchResult.forEach(obj => {
			const json = JSON.parse(obj);
			// row = document.createElement('tr');
			// row.append('<td>'+json['name']+'</td>');
			// row.append('<td>'+json['city']+'</td>');
			// row.append('<td>'+json['rating']+'</td>');
			// row.append('<td>'+json['address']+'</td>');
			// row.append('<td>'+json['name']+'</td>');
			// row.append('<td>'+json['name']+'</td>');
			//table.appendChild(tbody);
			tbody.innerHTML += '<tr>' +
				'<td>'+json['name']+'</td>' +
				'<td>'+json['rating']+'</td>' +
				'<td>'+json['city']+'</td>' +
				'<td>'+json['address']+'</td>' +

				'</tr>';
			console.log(json.name);
		})
	}


});


