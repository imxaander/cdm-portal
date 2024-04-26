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
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Colegio de Muntinlupa - <?php echo ($_SESSION["type"] == 'student')? "Student": "Employee"; ?> Portal</title>
        </head>
        <body>
            <h2>Good Morning, <?php echo $sFirstName?>. </h2>
            <h3>Program  : <?php echo $sProgram; ?> </h3>
            <h3>First Name : <input type="text" value="<?php echo $sFirstName?>"></h3>
            <h3>Last Name : <input type="text" value="<?php echo $sLastName?>"></h3>
            <h2>Course Enlistment:</h2>
            <!-- if an enrollment is going on.... -->
            NO ENROLLMENT YET
            <!-- <h3>>1st Year</h3>
            <h4>>>1st sem</h4>
            <h4>>>2nd sem</h4> -->
            
            <h2>Grade Viewing - A.Y 2023, 2nd Semester </h2>
            <table border=1>
                <thead>
                    <td>Course Code</td>
                    <td>Course Title</td>
                    <td>Units</td>
                    <td>Midterm</td>
                    <td>Final</td>
                    <td>Semestral</td>
                    <td>Point</td>
                    <td>Remarks</td>
                </thead>
            <?php
                //fetch grades depending on what academic year and semester
                $result = mysqli_query($mysqli, "SELECT * FROM grades WHERE student_id = '$student_id' AND semester = '2nd' AND academic_year = '2023' ORDER BY course_title ASC");
                if($result->num_rows > 0){
                    while($row = $result->fetch_assoc()){ ?>
                        <tr>
                            <td><?php echo $row['course_code'] ?></td>
                            <td><?php echo $row['course_title'] ?></td>
                            <td><?php echo $row['units'] ?></td>
                            <td><?php echo $row['midterm'] ?></td>
                            <td><?php echo $row['final'] ?></td>
                            <td>semstrl</td>
                            <td>pnt</td>
                            <td>rmrks</td>
                        </tr>
                    <?php }
                }
            ?>
            </table>
            <h2>Faculty Evaluation</h2>
            <h3>>Prof 1</h3>
            <h3>>Prof 2</h3>
            <a href="../logout/">Logout</a>
        </body>
    </html>
<?php }else{
    header("Location:../");
};