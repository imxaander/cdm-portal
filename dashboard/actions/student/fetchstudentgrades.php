<?php
    include '../../../db/config.php';
    session_start();
    if(empty($_SESSION["student_id"])){
        return "ERROR ST1";
    };

    if(!isset($_POST["student_id"])) {
        return "ERROR ST3";
    }
    return json_encode("{'id': 'daniel'}");

    $student_id = $_POST["student_id"];
    $semester = $_POST["semester"];
    $academic_year = $_POST["academic_year"];
    $result = mysqli_query($mysqli, "SELECT * FROM grades WHERE student_id = '$student_id' AND semester = '$semester' AND academic_year = '$academic_year' ORDER BY course_title ASC");

    $resultArray = array();

    while ($row = $result->fetch_assoc()){
        array_push($resultArray, $row); 
    };

    return json_encode($resultArray);


