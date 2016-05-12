<?php
session_start();
define("INCLUDING", 'TRUE');
include('config.php');
require_once (METHODS_PATH . '/idea.card.php');
//include_once 'configurazioneDB.php';	
include_once 'database.php';
$db = Database::getInstance();
$mysqli = $db->getConnection();
 // tutti i valori modificati presi dal form di modificaW.php
//recupero tutti vi valori da inserire nella tabella AZIENDE
$rag_soc= $_REQUEST["nome"];
$cap = $_REQUEST["cap"];
$indirizzo =$_REQUEST["indirizzo"];
$citta = $_REQUEST["citta"];
$nazione = $_REQUEST["nazione"];
$provincia = $_REQUEST["provincia"];
$regione = $_REQUEST["regione"];
$p_iva=$_REQUEST["partita_iva"];
$descrizione=$_REQUEST["descrizione"];
//echo $_SESSION['loggeduser']->who();
//aggiorno la tabella AZIENDE
$upd_azienda="UPDATE AZIENDE SET RAGIONE_SOCIALE='$rag_soc',CAP='$cap', INDIRIZZO='$indirizzo', CITTA='$citta', NAZIONE='$nazione', REGIONE='$regione', PARTITA_IVA='$p_iva',DESCRIZIONE='$descrizione' where ID_UTENTE='$_SESSION[ID]'";
//echo $upd_azienda;
$risultato_az= $mysqli->query($upd_azienda);
//recupero i valori della tabella CONTATTI
$cellulare= $_REQUEST["cellulare"];
$face=$_REQUEST["facebook"];
$fax=$_REQUEST["fax"];
$linkedin=$_REQUEST["linkedin"];
$sito=$_REQUEST["sito_web"];
$tel=$_REQUEST["telefono"];
$twit=$_REQUEST["twitter"];
//aggiorno la tabella CONTATTI
$upd_contatti="UPDATE CONTATTI SET CELLULARE='$cellulare', FACEBOOK='$face',FAX='$fax',LINKEDIN='$linkedin', SITO_WEB='$sito',TELEFONO='$tel',TWITTER='$twit' where PROPRIETARIO='$_SESSION[ID]'";
$risultato_cont= $mysqli->query($upd_contatti);
//echo $upd_contatti;
//recupero la mail e aggiorno la tabella UTENTI
$email=$_REQUEST["email"];
$upd_utenti="UPDATE UTENTI SET EMAIL='$email' where ID='$_SESSION[ID]'";
$risultato_utenti= $mysqli->query($upd_utenti);

//recupero valori relativi all'immagine che serviranno anche per i controlli relativi ad essa
$img_name = $_FILES['immagine']['name'];
$img_new_name = $_SESSION['ID'].'.jpg';
$img_temp_name = $_FILES['immagine']['tmp_name'];
$img_dir = 'img/profile/' . $img_new_name;
$img_err = $_FILES['immagine']['error'];
$img_size = $_FILES['immagine']['size'];
$img_ext = strtolower(pathinfo($img_name, PATHINFO_EXTENSION));
move_uploaded_file($img_temp_name,$img_dir);

//recupero i valori della tabella CONTATTI
$cellulare= $_REQUEST["cellulare"];
$face=$_REQUEST["facebook"];
$fax=$_REQUEST["fax"];
$linkedin=$_REQUEST["linkedin"];
$sito=$_REQUEST["sito_web"];
$tel=$_REQUEST["telefono"];
$twit=$_REQUEST["twitter"];
//aggiorno la tabella CONTATTI
$upd_contatti="UPDATE CONTATTI SET CELLULARE='$cellulare', FACEBOOK='$face',FAX='$fax',LINKEDIN='$linkedin', SITO_WEB='$sito',TELEFONO='$tel',TWITTER='$twit' where PROPRIETARIO='$_SESSION[ID]'";
$risultato_cont= $mysqli->query($upd_contatti);
//echo $upd_contatti;
//recupero la mail e aggiorno la tabella UTENTI
$email=$_REQUEST["email"];
$upd_utenti="UPDATE UTENTI SET EMAIL='$email' where ID='$_SESSION[ID]'";
$risultato_utenti= $mysqli->query($upd_utenti);

move_uploaded_file($img_temp_name,$img_dir);
//recupero i valori della tabella CONTATTI
$cellulare= $_REQUEST["cellulare"];
$face=$_REQUEST["facebook"];
$fax=$_REQUEST["fax"];
$linkedin=$_REQUEST["linkedin"];
$sito=$_REQUEST["sito_web"];
$tel=$_REQUEST["telefono"];
$twit=$_REQUEST["twitter"];
//aggiorno la tabella CONTATTI
$upd_contatti="UPDATE CONTATTI SET CELLULARE='$cellulare', FACEBOOK='$face',FAX='$fax',LINKEDIN='$linkedin', SITO_WEB='$sito',TELEFONO='$tel',TWITTER='$twit' where PROPRIETARIO='$_SESSION[ID]'";
$risultato_cont= $mysqli->query($upd_contatti);
//echo $upd_contatti;
//recupero la mail e aggiorno la tabella UTENTI
$email=$_REQUEST["email"];
$upd_utenti="UPDATE UTENTI SET EMAIL='$email' where ID='$_SESSION[ID]'";
$risultato_utenti= $mysqli->query($upd_utenti);
	header("location: home.php?");

?>