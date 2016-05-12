<?php
session_start();
define("INCLUDING", 'TRUE');
include('config.php');
//include_once 'configurazioneDB.php';		
include_once 'database.php';
require_once (METHODS_PATH . '/azienda.class.php');
$db = Database::getInstance();
$mysqli = $db->getConnection();
?>

<!DOCTYPE html>
<html>
<head>
  <title>  | Borsa delle Idee | Modifica</title>
  <?php include(TEMPLATES_PATH.'/head.php'); ?>
</head>

<body>
<div class="container">

<?php include (TEMPLATES_PATH.'/navbar.php'); ?>
<?php // controllo se  stato impostato l id per evitare che accedano direttamente senza fare il login
if( !isset($_SESSION['loggeduser']) )
	header("Location: index.php");
// Ricavo tutte le informazioni sull azienda che mi interessa tramite l id
$id=$_SESSION['loggeduser']->getid();
$_SESSION['ID']=$id;
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
$SQLpers="SELECT NOME,COGNOME FROM PERSONE JOIN AZIENDE A ON A.ID_UTENTE=AZIENDA WHERE AZIENDA='".$id."'";
$result_pers=$mysqli->query($SQLpers);
//per le idee sviluppate dagli utenti dell azienda
$SQLidee="SELECT TITOLO,P.ID_UTENTE FROM IDEE JOIN PERSONE P ON CREATORE=P.ID_UTENTE JOIN AZIENDE A ON AZIENDA=A.ID_UTENTE WHERE A.ID_UTENTE='".$id."'";
$result_idee=$mysqli->query($SQLidee);
?>

  <div class="col-sm-offset-2 col-sm-8">
	<div class="user-info well panel panel-default">
		<h4>Modifica i tuoi dati</h4>
        <ul class="nav nav-tabs" id="mioTab">
		  <li class="active"><a href="#personale" data-toggle="tab">Personale</a></li>
	      <li><a href="#contatti" data-toggle="tab">Contatti</a></li>
	   </ul>
	   
	   <div class="tab-content">
 		   <div class="tab-pane active" id="personale"><h1></h1>
  			 <form method="post" name="registra" action="emodifica.php" id="registra">
 				 <fieldset class="form-group">
 				  <label for="Nome">Ragione Sociale</label>
    			<input type="nome" required class="form-control" id="nome" name="nome" value='<?php echo $dati["RAGIONE_SOCIALE"]; ?>' >
  				</fieldset>

				<fieldset class="form-group">
				<label for="immagine">Immagine</label>
				<input type="file"  class="form-control" name="immagine" id="immagine">
				</fieldset>
				
  				<fieldset class="form-group">
  				  <label for="cap">Cap</label>
   					 <input type="tel" required pattern="[0-9]{1,15}" id="cap" name="cap" value='<?php echo $dati["CAP"]; ?>'>
 				 </fieldset>
  
 				 <fieldset class="form-group">
 				   <label for="indirizzo">Indirizzo</label>
  				  <input type="indirizzo" required class="form-control" id="indirizzo" name="indirizzo" value='<?php echo $dati["INDIRIZZO"]; ?>' >
 				 </fieldset>
  
 				 <fieldset class="form-group">
 				  <label for="citta">Citta</label>
   				 <input type="text" required class="form-control" id="citta" name="citta" value='<?php echo $dati["CITTA"]; ?>'>
  				</fieldset>
  <?php  if($dati["NAZIONE"]==italia){?>
   				 <fieldset class="form-group">
   				 <label for="elencoProvince">Province</label>
  				<select class="form-control"  name='elencoProvince' >
												<option  value="<?php  echo $province ?>" selected><?php  echo $dati_prov['NOME'];?> </option>
											<?php 			
													while	($row = mysqli_fetch_assoc($result) ){
														echo"<option id='$row[CODICE]'>$row[NOME]</option>";
													}
											?>		
												</select>
 				 </fieldset>
    <?php }?>
  				 <fieldset class="form-group">
  				 <label for="Regione">Regione </label>
   				 <input type="text" required class="form-control" id="regione" name="regione" value='<?php echo $dati["REGIONE"]; ?>'>
 				 </fieldset>
  
   				  <fieldset class="form-group">
   				 <label for=nazione>Nazione </label>
   				 <input type="text"  required class="form-control" id="nazione" name="nazione" value='<?php echo $dati["NAZIONE"]; ?>'>
  				</fieldset>
  
  			   <fieldset class="form-group">
  			   <label for=nazione>Partita Iva </label>
   				 <input type="text" required class="form-control" id="partita_iva" name="partita_iva" value='<?php echo $dati["PARTITA_IVA"]; ?>'>
  				</fieldset>  				
  		   </div>
  		   
  		   <div class="tab-pane" id="contatti"><h1></h1>
 			  <fieldset class="form-group">
 			   <label for=nazione>Telefono </label>
 			   <input type="tel" pattern="[0-9]{1,15}" required class="form-control" id="telefono" name="telefono" value='<?php echo $dati_cont["TELEFONO"]; ?>'>
 			 </fieldset>
  
  			   <fieldset class="form-group">
  			  <label for=nazione>Cellulare </label>
  			  <input type="tel" pattern="[0-9]{1,15}"  class="form-control" id="cellulare" name="cellulare" value='<?php echo $dati_cont["CELLULARE"]; ?>'>
 			 </fieldset>
  
 			    <fieldset class="form-group">
 			   <label for="fax">Fax </label>
 				 <input type="tel" pattern="[0-9]{1,15}"  class="form-control" id="fax" name="fax" value='<?php echo $dati_cont["FAX"]; ?>'>
  				</fieldset>
  
 			      <fieldset class="form-group">
  				  <label for="facebook">Facebook</label>
   				  <input type="text" class="form-control" id="facebook" name="facebook" value='<?php echo $dati_cont["FACEBOOK"]; ?>'>
 				 </fieldset>
  
  			       <fieldset class="form-group">
  				  <label for="twitter">Twitter</label>
  				   <input type="text" class="form-control" id="twitter" name="twitter" value='<?php echo $dati_cont["TWITTER"]; ?>'>
 					 </fieldset>
  
  				<fieldset class="form-group">
   				 <label for="linkedin">Linkedin</label>
    			 <input type="text" class="form-control" id="linkedin" name="linkedin" value='<?php echo $dati_cont["LINKEDIN"]; ?>'>
 				 </fieldset>
  
				 <fieldset class="form-group">
    			<label for="sito_web">Sito web</label>
    			 <input type="text" class="form-control" id="sito_web" name="sito_web" value='<?php echo $dati_cont["SITO_WEB"]; ?>'>
  				</fieldset>
  				
				 <fieldset class="form-group">
    			<label for="email">Email</label>
    			 <input type="text" class="form-control" id="email" name="email" value='<?php echo $dati["EMAIL"]; ?>'>
  				</fieldset>
    
  				<fieldset class="form-group">
  				 <label for="parlaci">Maggiori dettagli</label>
    			<textarea class="form-control" id="descrizione" name="descrizione" rows="3"><?php echo $dati["ddescrizione"];?></textarea>
  				</fieldset>
  			</div>
   			<input id="aggiorna" value="AGGIORNA" type="submit" name="aggiorna"></td>
 		 </form>
 	  </div>
   </div>
</div>
  