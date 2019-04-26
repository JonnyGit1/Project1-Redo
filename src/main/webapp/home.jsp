<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reimbursement Portal!</title>
<style>

body
{
background-color: grey;
text-align:center;

}
div
   {
    background-color: rgba(34, 114, 180, 0.514);
    font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
    color: rgb(28, 32, 37);
   
            position: relative;
            top: 30%;
            display: inline-block 
    }
 
 
table, td, th 
{
 border: 1px solid black;
}

table 
{
 border-collapse: collapse;
 width: 100%;
}

th 
{
 text-align: left;
}


    #t
    {
    
     position: relative;
            top: 30%;
            display: inline-block 
    }
    
  </style>
</head>

<body>

<h2>Would you like a Reimbursement, <%= session.getAttribute("currentUser") %>?</h2>

<div class="container">
<fieldset>
<form action="/Devops_Example/api/todos" method="POST">
	
	<label for="title">Amount</label>
	<input type="text" name="title"><br>
	<label for="description">Description</label>
	<input type="text" name="description"> <br>
	<input type="submit" value="Submit Request">
	
</form>
</fieldset>
</div>


<p style="color:white;">Here is a list of your current requests, <%= session.getAttribute("currentUser") %>.</p>


<div>
<table>
	<thead>
		<tr>
			<th>Request ID</th>
			<th>Amount</th>
			<th>Description</th>
		</tr>
	</thead>
	<tbody id="todoTable"></tbody>
</table>
</div>


<script>
window.onload = () => {
	populateTodosTable();
}

const populateTodosTable = () => {
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = () => {
		if (xhr.status === 200 && xhr.readyState === 4) {
			let todos = JSON.parse(xhr.responseText);
			addTodosToTable(todos);
		}
	}
	
	xhr.open("GET", "http://localhost:8009/Devops_Example/api/todos");
	xhr.send();
}

function addTodosToTable(todos) {
	for (let todo of todos) {
		let tdId = document.createElement("td");
		let tdTitle = document.createElement("td");
		let tdDescription = document.createElement("td");
		
		console.log(todo);
		
		tdId.textContent = todo.id;
		tdTitle.textContent = todo.title;
		tdDescription.textContent = todo.description;
		
		let row = document.createElement("tr");
		
		row.appendChild(tdId);
		row.appendChild(tdTitle);
		row.appendChild(tdDescription);
		
		document.getElementById("todoTable").appendChild(row);
	}
}
</script>
<!-- <script type="text/javascript" src="js/index.js"></script> -->
</body>
</html>