<?php
	include('conexao/conexao.php');


if(empty($_POST["cnpj"]) || empty($_POST["razaosocial"]) || empty($_POST["endereco"]) || empty($_POST["cidade"]) || empty($_POST["estado"])) {
$mensagem = "Dados incompletos. Por favor preencher corretamente o fomulário";

} else {

$cnpj = $_POST["cnpj"];
$razaosocial = $_POST["razaosocial"];
$endereco = $_POST["endereco"];
$cidade = $_POST["cidade"];
$estado = $_POST["estado"];

$sql = "INSERT INTO CadastrodeEmpresas values (null, :cnpj, :razaosocial, :endereco, :cidade, :estado, :del)";

$inserir = $conn->prepare($sql) ;

$inserir->bindParam( ':cnpj', $cnpj);
$inserir->bindParam( ':razaosocial', $razaosocial);
$inserir->bindParam( ':endereco', $endereco);
$inserir->bindParam( ':cidade', $cidade);
$inserir->bindParam( ':estado', $estado);
$inserir->bindValue( ':del', 'N');


$resultado = $inserir->execute();

	if($inserir->rowCount() > 0){
		$mensagem = "Empresa adicionada com sucesso";
	} else {
	$mensagem = "Ocorreram erros ao salvar as informações".$inserir->ErrorInfo()[2];
	}
}

?>

<!DOCTYPE html>
<html lang="br">
	<head>
		<title></title>
		<meta charset="utf-8">
		<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
		<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
		<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
		<script type="text/javascript" src="js/jquery-1.6.js" ></script>
		<script type="text/javascript" src="js/cufon-yui.js"></script>
		<script type="text/javascript" src="js/cufon-replace.js"></script>
		<script type="text/javascript" src="js/Vegur_300.font.js"></script>
		<script type="text/javascript" src="js/PT_Sans_700.font.js"></script>
		<script type="text/javascript" src="js/PT_Sans_400.font.js"></script>
		<script type="text/javascript" src="js/atooltip.jquery.js"></script>
		<!--[if lt IE 9]>
		<script type="text/javascript" src="js/html5.js"></script>
		<link rel="stylesheet" href="css/ie.css" type="text/css" media="all">
		<![endif]-->
		<!--[if lt IE 7]>
			<div style=' clear: both; text-align:center; position: relative;'>
				<a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode"><img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." /></a>
			</div>
		<![endif]-->
	</head>
	<body id="page5">
		<div class="main">
<!--header -->
			<header>
				<div class="wrapper">
					<h1><a href="index.html" id="logo">Superior.com</a></h1>
				</div>
				<nav>
					<ul id="menu">
						<li><a href="menuprincipal.php"><span>Menu Principal</span></a></li>
						<li class="last active"><a href="cadastroempresa.php"><span>Empresas</span></a></li>
						<li><a href="Solutions.html"><span>Cargos</span></a></li>
						<li><a href="Services.html"><span>Departamentos</span></a></li>
						<li><a href="Services.html"><span>Usuários</span></a></li>
						<li><a href="Services.html"><span>Veiculos</span></a></li>
						<li><a href="Services.html"><span>Proprietários</span></a></li>
						<li><a href="Services.html"><span>Colaboradores</span></a></li>
						<li><a href="Services.html"><span>Registros</span></a></li>
					</ul>
				</nav>
			</header>
<!--header end-->
<!--content -->
			<article id="content"><div class="ic">More Website Templates @ TemplateMonster.com - November 14, 2011!</div>
				<div class="wrapper">
					<h2><?php echo $mensagem ?></h2>
							<a href="menuprincipal.php" class="button1" onClick="document.getElementById('ContactForm').submit()">Voltar ao Menu</a>
						</div>
				</div>
			</article>
		</div>
		<div class="main">
<!--content end-->
<!--footer -->
			<footer>
				<ul id="icons">
					<li class="first">Follow Us:</li>
					<li><a href="#" class="normaltip" title="Facebook"><img src="images/icon1.jpg" alt=""></a></li>
					<li><a href="#" class="normaltip" title="Twitter"><img src="images/icon2.jpg" alt=""></a></li>
					<li><a href="#" class="normaltip" title="Picasa"><img src="images/icon3.jpg" alt=""></a></li>
					<li><a href="#" class="normaltip" title="YouTube"><img src="images/icon4.jpg" alt=""></a></li>
				</ul>
				Superior.com &copy; 2011 <br>Website Template by <a href="http://www.templatemonster.com/" target="_blank">TemplateMonster.com</a><br>
				<!-- {%FOOTER_LINK} -->
			</footer>
<!--footer end-->
		</div>
		<script type="text/javascript"> Cufon.now(); </script>
	</body>
</html>
