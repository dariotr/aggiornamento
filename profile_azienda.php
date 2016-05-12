<?php
session_start();
$id=$_GET['id'];

define("INCLUDING", 'TRUE');
include('config.php');
require_once (METHODS_PATH . '/idea.card.php');
//include_once 'configurazioneDB.php';	
require_once (METHODS_PATH . '/azienda.class.php');
include_once 'database.php';

$db = Database::getInstance();
$mysqli = $db->getConnection();


// controllo se Â� stato impostato l id per evitare che accedano direttamente senza fare il login
if( !isset($id) )
	header("Location: index.php");
	
// Ricavo tutte le informazioni sull azienda che mi interessa tramite l id
$sql = "SELECT * FROM UTENTI JOIN AZIENDE ON ID_UTENTE=ID WHERE ID='".$id."'";
$result=$mysqli->query($sql);
$dati=$result->fetch_assoc();
// tutti i dati son messi nelll array dati

//prendo tutte le informazioni riguradanti i contatti
$SQLcont="SELECT * FROM CONTATTI JOIN AZIENDE ON ID_UTENTE=PROPRIETARIO WHERE PROPRIETARIO='".$id."'";
$result_cont=$mysqli->query($SQLcont);
// tutti i valori saranno memorizzati nell array dati_cont
$dati_cont=$result_cont->fetch_assoc();

//per sapere le province
$SQLprov="SELECT * FROM PROVINCE WHERE CODICE='".$dati['PROVINCIA']."'";
$result_prov=$mysqli->query($SQLprov);
// tutti i valori saranno memorizzati nell array dati_prov
$dati_prov=$result_prov->fetch_assoc();

// per conoscere le persone che lavorano nell azienda
$SQLpers="SELECT NOME,COGNOME,INFO,FOTO,RUOLO FROM PERSONE WHERE AZIENDA='".$id."'";
$result_pers=$mysqli->query($SQLpers);


//per le idee sviluppate dagli utenti dell azienda
$SQLideeU="SELECT TITOLO,P.ID_UTENTE,DESCRIZIONE FROM IDEE JOIN PERSONE P ON CREATORE=P.ID_UTENTE JOIN AZIENDE A ON AZIENDA=A.ID_UTENTE WHERE A.ID_UTENTE='".$id."'";
$result_ideeU=$mysqli->query($SQLideeU);

$SQLideeA="SELECT TITOLO,DESCRIZIONE FROM IDEE WHERE CREATORE='".$id."'";
$result_idee=$mysqli->query($SQLideeA);

//echo $SQLideeA;
?>

<!DOCTYPE html>
<html>
<head>
  <title> <?php echo  $dati['RAGIONE_SOCIALE']?> | Borsa delle Idee</title>
  <?php include(TEMPLATES_PATH.'/head.php'); ?>
</head>

<body>

<div class="container">

<?php include (TEMPLATES_PATH.'/navbar.php');?>	
<div class="col-md-3">
		<div class="user-data well panel panel-default">
		<img class="profile-user-img img-responsive center-block" src='
			<?php
			if($dati['FOTO'])
				echo "img/profile/". $dati['FOTO'];
			else
				echo 'img/profile/default.png';
			?>
			' alt='Foto profilo'>
			<h5 class="text-capitalize"><?php echo $_SESSION['loggeduser']->who()?></h5>

			<h6>Partita Iva: <?php
			echo $dati['PARTITA_IVA'];
			/*
			
			if($dati['NAZIONE']){
        	echo $dati['NAZIONE'];
			if($dati['CITTA'])
					echo " presso ".$dati['CITTA'];}
        	else echo "\r\n";*/ ?> </h6>
 <!-- >         	<hr>
	       		<p> <b><i class='fa fa-lightbulb-o margin-r-5'></i>Idee</b> -->
	<?php	echo "<br>";
	// while ($row1=mysqli_fetch_assoc($result_idee)){
      //  echo $row1['TITOLO']."<br>";}
        
	 
  					     ?>
  					     </p>
  					</a>
  					<hr>
            <p>
            	<b><i class='fa fa-envelope margin-r-5'></i>Email</b> 
            	<?php 
            			echo "<br>";
                      echo $dati['EMAIL'];
                      	?></a>
</p>
<hr>
        <?php 
		if(isset($_SESSION['loggeduser']) && $_SESSION['loggeduser']->isLoggedIn()){
        	if ($_SESSION["loggeduser"]->getid() !== $id){?>
        		
        		<a href="#" class="btn btn-primary btn-block"><b>Contatta</b></a>
        		
	    	<?php }
        }
	    
	    ?>
	    <!-- AddToAny BEGIN -->
		<a class="a2a_dd btn btn-primary btn-block" href="https://www.addtoany.com/share">Condividi</a>
		<script async src="https://static.addtoany.com/menu/page.js"></script>
		<!-- AddToAny END -->
		</div>
			<div class="user-info well panel panel-default">
			 <?php
                echo "<strong><i class='fa fa-phone margin-r-5'></i> Telefono</strong>
                  <p>".$dati_cont['TELEFONO']."
                  </p><hr>";	?>

			 <?php 
                     	if( !($dati_cont['CELLULARE']==0) ) // gli if mi permettono di non mostrare nulla nel caso questi campi non siano presnti nel db
                echo "<strong><i class='fa fa-mobile margin-r-5'></i> Cellulare</strong>
                  <p>".$dati_cont['CELLULARE']."
                  </p><hr>";	?>

			 <?php 
                     	if( !($dati_cont['FAX']==NULL) ) // gli if mi permettono di non mostrare nulla nel caso questi campi non siano presnti nel db
                echo "<strong><i class='fa fa-fax margin-r-5'></i> Fax</strong>
                  <p>".$dati_cont['FAX']."
                  </p><hr>";	?>

			 <?php 
                     	if( !($dati_cont['FACEBOOK']==NULL) ) // gli if mi permettono di non mostrare nulla nel caso questi campi non siano presnti nel db
                echo "<strong><i class='fa fa-facebook margin-r-5'></i> Facebook</strong>
                  <p>".$dati_cont['FACEBOOK']."
                  </p><hr>";	?>

			 <?php 
                     	if( !($dati_cont['LINKEDIN']==NULL) ) // gli if mi permettono di non mostrare nulla nel caso questi campi non siano presnti nel db
                echo "<strong><i class='fa fa-linkedin margin-r-5'></i> Linkedin</strong>
                  <p>".$dati_cont['LINKEDIN']."
                  </p><hr>";	?>

			 <?php 
                     	if( !($dati_cont['TWITTER']==NULL) ) // gli if mi permettono di non mostrare nulla nel caso questi campi non siano presnti nel db
                echo "<strong><i class='fa fa-twitter margin-r-5'></i> Twitter</strong>
                  <p>".$dati_cont['TWITTER']."
                  </p><hr>";	?>
                  
 			 <?php 
                     	if( !($dati_cont['SITO_WEB']==NULL) ) // gli if mi permettono di non mostrare nulla nel caso questi campi non siano presnti nel db
                echo "<strong><i class='fa fa-link margin-r-5'></i> Sito</strong>
                  <p>".$dati_cont['SITO_WEB']."
                  </p>";	?>                         	                 	
				</div>
				  <div class="container"> 
   
     		</div>
		</div>

		<div class="col-md-9">
		<div class="panel panel-default">
			<ul class="nav nav-tabs">
				<li role="presentation" class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"><i class='fa fa-lightbulb-o margin-r-5'></i>
						Idee <span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="#IdeeAzienda" data-toggle='tab'>dell'Azienda</a></li>
						<li><a href="#IdeeUtenti" data-toggle='tab'>degli Utenti</a></li>		
				  	</ul>
				  	</li>
				  	<li><a href="#Sede" data-toggle='tab'><i class='fa fa-home margin-r-5'></i> Sede</a></li>	
				  	<li><a href="#Utenti" data-toggle='tab'><i class='fa fa-user margin-r-5'></i> Utenti</a></li>	
				  	</ul>
				  	
<!--  Quello che si visualizza se clicchiamo su SEDE -->
		<div class="panel-body main-panel">	
		<div class="tab-content">			  	
		        <div class="tab-pane" id="Sede">
				<div class="row">
   				    <div class="col-sm-12">
    			      <div class="well">
     			     <h4><i class='fa fa-globe margin-r-5'></i> Nazione </h4>
      			      <p><?php echo $dati['NAZIONE']?></p> 
      			      <hr>
      			      <h4><i class='fa fa-map-marker margin-r-5'></i>Regione</h4>
      			      <p><?php echo $dati['REGIONE']?></p> 
      			      <hr>
      			      <?php  if( !(dati_prov['NOME']==0) )
       		 	   echo "<h4><i class='fa fa-map-marker margin-r-5'></i>Provincia</h4>
       		 	    <p>".$dati_prov['NOME']."</p>
       		 	    <hr>";
       		 	    ?>
       		 		<h4><i class='fa fa-map-marker margin-r-5'></i> Citta </h4>
      			      <p><?php echo $dati['CITTA']?></p> 
      			      <hr>
      			      <h4><i class='fa fa-map-marker margin-r-5'></i>Indirizzo</h4>
      			      <p><?php echo $dati['INDIRIZZO']." ".$dati['NUMERO_CIVICO']?></p> 
      			      <hr>
       		 	    <h4><i class='fa fa-map-marker margin-r-5'></i>Cap</h4>
       		 	    <p><?php echo $dati['CAP']?></p>  
       		  	 </div>
      		  </div>
				</div>
	   </div>
		     <!-- Quello che si visualizza cliccando su UTENTI -->  
	        <div class="tab-pane" id="Utenti">		       
				<div class="col-sm-12">
					   <?php 
					   		while($row=mysqli_fetch_assoc($result_pers)){?>
   							   <div class="row">
     							   <div class="col-sm-4">
      								    <div class="well">
     								      <h6><b><?php echo $row["NOME"].$row["COGNOME"] ?></b></h6>
     								      <h8><i><?php echo $row["RUOLO"]?></i></h8><br>
   								<hr>   			
					   		<?php if($row[FOTO]==NULL) 
   							   					echo '  <img src="img/profile/default.png"';
   							   					else echo   '<img src="img/profile/'. $row["FOTO"];
   							   					
   							   					echo '"class="img-circle" height="55" width="55" alt="Foto utente">';
   							   					?>
    								     </div>
    							    </div>
     								   <div class="col-sm-7">
          								<div class="well">
          								<p>
   							   			<?php if($row["INFO"]==NUll)
   							   				echo "Nessuna descrizione";
   							   				else echo $row["INFO"];
   							   				?>
   							  </p>
         								   
    							    	  </div>
      								  </div>
   							   </div>
   							<?php    }?>
   							   			   
  				</div>
  	</div>
  	
  		<!-- panello su Idee degli UTENTI -->
		        <div class="tab-pane " id="IdeeUtenti">
			        <?php  /*ZONA IDEE PUBBLICATE*/
		        
			        while( $row1=mysqli_fetch_assoc($result_ideeU) ){
			        	
			        	ideaprint(1,$row1['TITOLO'],$row1['DESCRIZIONE'],"http://placehold.it/1024x1280");
	
			        }
			        ?>
			        </div>
	
		<!-- pannello sulle ide dell AZIENDA -->
				<div class="tab-pane fade" id="IdeeAzienda">
			        <?php /*ZONA IDEE SEGUITE */
			         while( $row1=mysqli_fetch_assoc($result_idee) ){
				        
			        	ideaprint(1,$row1['TITOLO'],$row1['DESCRIZIONE'],"http://placehold.it/1024x1280");
			        	
			        }
			        ?>
			    </div>
			    
		</div>
        	</div>
        </div>	



<?php include (TEMPLATES_PATH.'/footer.php');
	?>
</body>

</html>
