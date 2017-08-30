<?php

include ('conexao/conexao.php');

$usuario= $_POST['usuario'];
$senha = $_POST['senha'];

$sql = "SELECT * from Usuários where Login_Usuários = :usuario and Senha_Usuários = :senha and Del = 'N'";

$conferir = $conn->prepare($sql) ;

$conferir->bindParam( ':usuario', $usuario);
$conferir->bindParam( ':senha', $senha);

$result = $conferir->execute();

$registro = $conferir->fetch (PDO::FETCH_OBJ);
$rows = $conferir->rowCount();

?>

<html>

<head>
  <title>Autenticando Usuario</title>
  <script type="text/javascript">
function loginsucessfuly() {
    setTimeout (function() {window.location='menuprincipal.php'}, 0)
}

function loginfailed() {
  setTimeout (function() {window.location='index.php'}, 0)
}
  </script>
</head>
<body>
<?php if ($rows > 0) {
  session_start();
  $_SESSION['usuario'] = $_POST['usuario'];
  $_SESSION['senha'] = $_POST['senha'];
  echo"<center>Autenticado com Sucesso!Aguarde para ser redirecionado<center>";
  echo"<script>loginsucessfuly()</script>";
} else {
  echo"<center>Ususario ou Senha inválidos!Aguarde para ser redirecionado<center>";
  echo"<script>loginsycessfailed()</script>";
}
         ?>
</body>
</html>
