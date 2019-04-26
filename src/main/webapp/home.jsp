<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome Home!</title>
</head>
<body>

<h2>Getcha todos done, <%= session.getAttribute("currentUser") %>!</h2>


<form action="/Devops_Example/api/todos" method="POST">
	
	<label for="title">Title</label>
	<input type="text" name="title"><br>
	<label for="description">Description</label>
	<input type="text" name="description"> <br>
	<input type="submit" value="Add Todo To List!">
	

</form>


<table>
	<thead>
		<tr>
			<th>ID</th>
			<th>Title</th>
			<th>Description</th>
		</tr>
	</thead>
	<tbody id="todoTable"></tbody>
</table>
<script>window.onload = () => {
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