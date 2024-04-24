<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Login</title>
</head>
<body>
    <form method="post">
        <p>username: </p>
        <input type="text" name="user_name">
        <br>
        <p>passsword: </p>
        <input type="password" name="password">
        <br>
        <button type="submit">login</button>
    </form>
</body>
</html>

<?php
    include_once('../db/config.php');
    if($_SERVER['REQUEST_METHOD'] == 'POST'){
        $uname = $_POST['user_name'];
        $pwd = $_POST['password'];
        $result  = mysqli_query($mysqli, "SELECT student_id FROM students WHERE user_name = '$uname' AND password = '$pwd'");

        if($result->num_rows != 0){
            session_start();
            $_SESSION["isLoggedIn"] = true;
            $_SESSION["type"] = "student";
            $_SESSION["student_id"] = $result->fetch_assoc()['student_id'];
            header('Location:../dashboard');
            exit();
        }else{
            echo "not logged";
        }

    }