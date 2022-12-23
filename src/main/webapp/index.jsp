<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">

    <title>Document</title>
</head>
<body>
<header>
    <h3>Find Your Steeped Tea!</h3>

</header>

<div >
    <input id="textFieldSearch" type="text" class="input" value = "Exeter" placeholder="Enter City..."><br>
    <input id="btnSearch" type="submit" class="btnSearch" value="Search!" >
</div>

<div>
    <table id="listTable">
        <tr>
            <th>Name</th>
            <th>City</th>
            <th>Rating</th>
            <th>Address</th>
            <th>Power Outlets</th>
            <th>Hotness</th>
        </tr>

    </table>
</div>


<footer>

</footer>
</body>
<script type="text/javascript" src="js/script.js"></script>
</html>