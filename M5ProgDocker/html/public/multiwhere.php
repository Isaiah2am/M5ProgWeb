<?php

include_once("../source/database.php");

$connection = database_connect();

$result = $connection->query("SELECT 'het werkt' as nice");
print_r($result->fetch_all());

function Findleerling($conn, $search, $leef){
    $q = "SELECT * FROM leerlingen WHERE naam LIKE ? OR leeftijd = ?";
    $stmt = $conn->prepare($q);
    $stmt->bind_param("si", $search, $leef);
    $stmt->execute();
    $result = $stmt->get_result();
    if($result){
        while($row = $result->fetch_assoc()){
            print_r($row);
        }
    }
}

function ShowALLleerlingen($conn){
    $q = "SELECT * FROM leerlingen;";
    $stmt = $conn->prepare($q);
    $stmt->execute();
    $result = $stmt->get_result();
    if($result){
        while($row = $result->fetch_assoc()){
            print_r($row);
        }
    }
}

$search = isset($_GET["search"]) ? $_GET["search"] : "";
$leef = isset($_GET["leeftijd"]) ? (int)$_GET["leeftijd"] : 0;

if($search || $leef){
    Findleerling($connection, $search, $leef);
}else{
    ShowALLleerlingen($connection);
}

print_r($_GET);
?>
