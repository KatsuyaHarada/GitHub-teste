<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Login Form</title>



      <link rel="stylesheet" href="css/stylelogin.css">


</head>

<body>
  <body>
	<div class="login">
		<div class="login-screen">
			<div class="app-title">
				<h1>Login</h1>
			</div>


			<div class="login-form">
				<div class="control-group">
    <form action = "userautentication.php" method="post">
				<input type="text" class="login-field" placeholder="Usuario" name = "usuario">
				<label class="login-field-icon fui-user" for="login-name"></label>
				</div>
				<div class="control-group">
				<input type="password" class="login-field"  placeholder="Senha" name="senha">
				<label class="login-field-icon fui-lock" for="login-pass"></label>
				</div>
        <button type="submit" class="btn btn-primary btn-large btn-block">Acesso</button>
      </form>
			</div>
		</div>
	</div>
</body>


</body>
</html>
