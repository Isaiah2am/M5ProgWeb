<?php


include_once("../source/database.php");

$connection = database_connect();

$result = $connection->query(query: "SELECT * FROM bordspellen");

print_r($result->fetch_all());

        