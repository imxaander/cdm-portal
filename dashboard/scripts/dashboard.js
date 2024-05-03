fetch('./actions/student/fetchstudentgrades.php').then((response)=>{response.json()}).then((response)=>{
    console.log(response);
})