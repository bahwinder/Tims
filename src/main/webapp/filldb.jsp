<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fill Database!</title>
</head>
<body>

<form id="inputForm">

    <input type="text" class="inputs" id="name" placeholder="Name.." required><br>
    <input type="text" class="inputs" id="address" placeholder="Address" required><br>
    <input type="text" class="inputs" id="city" placeholder="City.." required><br>
    <input type="text" id="rating" class="inputs" placeholder="Rating.. Out of 10!" required><br>
    <input type="text" id="powerOutlets" class="inputs" placeholder="Does it have power outlets?"><br>
    <input type="text" id="hotness" class="inputs" placeholder="How hot was it?"><br><br>
    <input type="button" id="btnSubmit" class="inputs" value="Add to DB"><br>
    <h3 id="alert"></h3>

</form>
</body>
<style>
    input{
        width: 70%;
        height: 40px;
        background-color: darkslategrey;
        color: aliceblue;
    }
    body{
        background: black;
        color: aliceblue;
        text-align: center;
        font-size: 2em;
    }
</style>
<script>
    window.addEventListener('load',function(){
        console.log("page loaded!");

        document.getElementById('btnSubmit').addEventListener('click',function(){

            console.log("Clicked Submit");
            var name = document.getElementById('name').value;
            var address = document.getElementById('address').value;
            var city = document.getElementById('city').value;
            var rating = document.getElementById('rating').value;
            var powerOutlets = document.getElementById('powerOutlets').value;
            var hotness = document.getElementById('hotness').value;

           if(name != null && rating != null && city != null){

            fetch('http://localhost:8080/Tims_war/FillDb?name='+name+'&address='+address+'&city='+city+'&rating='+rating,
			{
				method: "GET",
				headers : {
					'Content-Type' : 'application/json'
				}
				
			}
		)
		.then(res => res.json())
        .then(res => document.getElementById('inputForm').reset());

           }

        });
    });

</script>
</html>