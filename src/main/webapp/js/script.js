window.addEventListener('load', function () {
	init();
});
const table = document.getElementById('listTable');
function init(){

	document.getElementById("loadingText").style.display = "none";
	table.style.display="none";

	//Search Button click function
	document.getElementById("btnSearch").addEventListener("click",find);
	document.querySelector('#textFieldSearch').addEventListener('keypress', function (e) {
		if (e.key === 'Enter') {
			find();
		}
	});


}
function find(){
	let inputString = document.getElementById("textFieldSearch").value;
	console.log(inputString);
	if(inputString.length >= 3){

		document.getElementById("loadingText").style.display = "initial";

		fetch('http://localhost:8080/Tims_war/Search?input='+inputString.toLowerCase(),
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
				document.getElementById("loadingText").style.display = "none";
				table.style.display="initial";
			});

	}
}
function getDirectionLink(address){
	const myArray = address.split(" ");
	let url = "https://www.google.com/maps/search/";
	for(let i = 0;i<myArray.length;i++){
		if(i != 0){
			url += "+";
		}
		url += myArray[i];
	}
}
function fillTable(searchResult){
	console.log("Entered fillTable method!")
	const tbody = document.querySelector('tbody');
	tbody.innerHTML = '';

	searchResult.forEach(obj => {
		const json = JSON.parse(obj);
		const jsonID = JSON.parse(JSON.stringify( json['_id']));
		console.log(jsonID[0]);
		tbody.innerHTML += '<tr class="table-row" id="'+jsonID[0]+'">' +
			'<td>'+json['name']+'</td>' +
			'<td>'+json['city']+'</td>' +
			'<td>'+json['address']+'</td>' +
			'<td>'+json['rating']+'</td>' +

			'</tr>';

	})
	document.querySelectorAll('.table-row').forEach(elem => elem.addEventListener('click',function(){
		console.log(this.id)
	}));
}


