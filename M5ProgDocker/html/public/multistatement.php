<?php

include_once("../source/database.php");

$connection = database_connect();


function Findleerling($conn, $search){

  $q = "select * from leerlingen where naam ='$search';";
echo $q;
    $stmt = $conn->prepare($q);
    $stmt->execute();
    $result = $stmt->get_result();
    if($result){
        for($i = 0; $i < $result->num_rows; $i++){
            $row = $result->fetch_assoc();
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
        for($i = 0; $i < $result->num_rows; $i++){
            $row = $result->fetch_assoc();
            print_r($row);
        }
    }

}

$search = $_GET["search"]; 
echo $search;

print_r($_GET);

//ShowALLleerlingen($connection);

Findleerling($connection, $search);
