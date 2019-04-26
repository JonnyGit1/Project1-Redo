<html>

<head>
<style>
#lform
{
    text-align: center;
    font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
    background-color: hsl(212, 62%, 43%); 
   padding-left:100px;
   padding-right:100px;

}

h2
{
    text-align: center;
    font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
    color: blue;
}

body{
    background-color: rgba(34, 114, 180, 0.514);
    font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
    color: rgb(28, 32, 37);
    }
</style>


</head>
<body>

<h2> Employee Reimbursement Login</h2>


<div id ="lform" class="container">
<form action="/Devops_Example/api/login" method="POST">

	<label for="username">Username</label>
	<input type="text" name="username"> <br>
	<label for="password">Password</label>
	<input type="password" name="password"> <br>
	<input type="submit" value="Sign In">

</form>
</div>


</body>
</html>
