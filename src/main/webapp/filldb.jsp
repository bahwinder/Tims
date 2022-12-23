<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <div>
        <input type="text" id="name" placeholder="Name.." required><br>
        <input type="text" id="address" placeholder="Address" required><br>
        <input type="text" id="city" placeholder="City.." required><br>
        <input type="text" id="rating" placeholder="Rating.. Out of 10!" required><br>
        <input type="text" id="powerOutlets" placeholder="Does it have power outlets?"><br>
        <input type="text" id="hotness" placeholder="How hot was it?"><br><br>
        <input type="button" id="btnSubmit" value="Add to DB"><br>
        <h3 id="alert"></h3>
    </div>
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

            fetch('http://localhost:8080/Tims_war_exploded/FillDb?name='+name+'&address='+address+'&city='+city+'&rating='+rating,
			{
				method: "GET",
				headers : {
					'Content-Type' : 'application/json'
				}
				
			}
		)
		.then(res => res.json())
        .then(res => console.log(JSON.stringify(res)));

           }

        });
    });

</script>
</html>