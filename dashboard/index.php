<?php
include '../db/config.php';
session_start();

if($_SESSION["isLoggedIn"] == true){?>
    <?php if($_SESSION["type"] == "student"){
        $student_id = $_SESSION["student_id"];
        $result = mysqli_query($mysqli, "SELECT * FROM students WHERE student_id = '$student_id'");
        if($result->num_rows > 0){
            $row = $result->fetch_assoc();
            $sFirstName = $row["first_name"];
            $sLastName = $row["last_name"];
            $sAge = $row["age"];
            $sProgram = $row["program"];
        }else{
            echo "error in fetching your data";
        }
    }?>
    <h1>DASHBOARD- <?php echo ($_SESSION["type"] == 'student')? "STUDENT": "EMPLOYEE"; ?></h1>
    <h2>My Info:</h2>
    <h3>Name : <?php echo $sFirstName + " " + $sLastName;?> </h3>
    <h3>Age  : <?php echo $sAge; ?> </h3>
    <h3>Program  : <?php echo $sProgram; ?> </h3>
    
    <h2>Course Enlistment:</h2>
    <h3>>1st Year</h3>
    <h4>>>1st sem</h4>
    <h4>>>2nd sem</h4>
    
    <h2>Grade Viewing</h2>
    <h3>>1st Year</h3>
    <h4>>>1st sem</h4>
    <h4>>>2nd sem</h4>

    <h2>Faculty Evaluation</h2>
    <h3>>Prof 1</h3>
    <h3>>Prof 2</h3>
    
    <a href="../logout/">Logout</a>
<?php }else{
    header("Location:../");
};