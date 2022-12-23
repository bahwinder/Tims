window.addEventListener('load', function () {

	//Search Buttun click function
	document.getElementById("btnSearch").addEventListener("click",function(){

		var inputString = document.getElementById("textFieldSearch").value;
		console.log(inputString);
		var x = {inputString}
		fetch('http://localhost:8080/Tims_war_exploded/Search?input='+inputString,
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
		});


		});







});