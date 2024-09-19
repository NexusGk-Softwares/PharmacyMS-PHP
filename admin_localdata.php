<?php
session_start();
include_once('connect_db.php');
if(isset($_SESSION['username'])){
    $id=$_SESSION['admin_id'];
    $username=$_SESSION['username'];
}else{
header("location:http://".$_SERVER['HTTP_HOST'].dirname($_SERVER['PHP_SELF'])."/index.php");
exit();
}
if(isset($_POST['submit'])){
$fname=$_POST['first_name'];
$lname=$_POST['last_name'];
$sid=$_POST['staff_id'];
$postal=$_POST['postal_address'];
$phone=$_POST['phone'];
$email=$_POST['email'];
$user=$_POST['username'];
$pas=$_POST['password'];
$sql1=mysql_query("SELECT * FROM pharmacist WHERE username='$user'")or die(mysql_error());
 $result=mysql_fetch_array($sql1);
if($result>0){
$message="<font color=blue>sorry the username entered already exists</font>";
 }else{
$sql=mysql_query("INSERT INTO pharmacist(first_name,last_name,staff_id,postal_address,phone,email,username,password,date)
VALUES('$fname','$lname','$sid','$postal','$phone','$email','$user','$pas',NOW())");
if($sql>0) {header("location:http://".$_SERVER['HTTP_HOST'].dirname($_SERVER['PHP_SELF'])."/admin_pharmacist.php");
}else{
$message1="<font color=red>Registration Failed, Try again</font>";
}
	}}
?>
<!DOCTYPE html>
<html>
<head>
<title><?php echo $username;?> -  Pharmacy Managemnt Systems</title>
<link rel="stylesheet" type="text/css" href="style/ms.css">
<link rel="stylesheet" href="style/s.css" type="text/css" media="screen" /> 
 
<link rel="stylesheet" href="style/ta.css" type="text/css" media="screen" /> 
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

<script src="js/function.js" type="text/javascript"></script>
<script>



function validateForm()
{

//for alphabet characters only
var str=document.form1.first_name.value;
	var valid="abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	//comparing user input with the characters one by one
	for(i=0;i<str.length;i++)
	{
	//charAt(i) returns the position of character at specific index(i)
	//indexOf returns the position of the first occurence of a specified value in a string. this method returns -1 if the value to search for never ocurs
	if(valid.indexOf(str.charAt(i))==-1)
	{
	alert("First Name Cannot Contain Numerical Values");
	document.form1.first_name.value="";
	document.form1.first_name.focus();
	return false;
	}}
	
if(document.form1.first_name.value=="")
{
alert("Name Field is Empty");
return false;
}

//for alphabet characters only
var str=document.form1.last_name.value;
	var valid="abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	//comparing user input with the characters one by one
	for(i=0;i<str.length;i++)
	{
	//charAt(i) returns the position of character at specific index(i)
	//indexOf returns the position of the first occurence of a specified value in a string. this method returns -1 if the value to search for never ocurs
	if(valid.indexOf(str.charAt(i))==-1)
	{
	alert("Last Name Cannot Contain Numerical Values");
	document.form1.last_name.value="";
	document.form1.last_name.focus();
	return false;
	}}
	

if(document.form1.last_name.value=="")
{
alert("Name Field is Empty");
return false;
}
alert("Registration Sucessful");
}

</script>


<style>
   
#left-column {height: 477px;}
#main {height: 477px;}

.scroll
		{
			height:380px;
			/* width:630px; */
			
			overflow: scroll;
		}

</style>


</head>
<body>
<div id="content">
<div id="header">
<h1> Pharmacy Management System</h1></div>
<div id="left_column">
<div id="button">
		<ul>
		<li><a href="admin.php"><i class="fa fa-home"></i>&nbsp; Dashboard</a></li>
			<li><a href="admin_pharmacist.php"><i class="fa fa-prescription-bottle-alt"></i>&nbsp;&nbsp; Pharmacist</a></li>
			<li><a href="admin_manager.php"><i class="fa fa-user-cog"></i>&nbsp;Manager</a></li>
			<li><a href="admin_cashier.php"><i class="fa fa-cash-register"></i>&nbsp; Cashier</a></li>
			<li><a href="admin_localdata.php"><i class="fa fa-database"></i>&nbsp; Local Data</a></li>
			<li><a href="admin_globaldata.php"><i class="fa fa-server"></i>&nbsp; Global Data</a></li>
			<li><a href="logout.php"><i class="fa fa-power-off"></i>&nbsp; Logout</a></li>
		</ul>	
</div>
</div>
<div id="main">
<div id="tabbed_box" class="tabbed_box">  
    <h4>To find pharmacist from selected cities locally from the local database</h4> 
<hr/>	
    <div class="tabbed_area">  
       
      
        
         
        <div class = "scroll">
        <div id="content_1" class="content">
            
        



<form action="#" method="post">
<select name="City">
<option value="Select" selected="selected">----Select City----</option>
<option value="All" >All</option>
<option value="Fullerton" >Fullerton</option>
<option value="Michikan">Michikan</option>
<option value="Newark">Newark</option>
<option value="Ladora">Ladora</option>
</select>
<input type="submit" name="cityvalue" value="Go" />
</form>
<?php
if(isset($_POST['cityvalue'])){
$selected_val = $_POST['City'];  // Storing Selected Value In Variable
echo 'You have selected:'. $selected_val;
}
?>



		<?php echo $message;
              echo $message1;
              
              
		/* 
		View
        Displays all data from 'Pharmacist' table
		*/
        // connect to the database
        include_once('connect_db.php');
       // get results from database
     

	   $result = mysql_query("SELECT * FROM pharmacist ")or die(mysql_error());
	   if($selected_val=="All")
	   				$result = mysql_query("SELECT * FROM pharmacist")or die(mysql_error());	
	   if($selected_val=="Fullerton")
				   $result = mysql_query("SELECT * FROM pharmacist WHERE postal_address='Fullerton' ")or die(mysql_error());
		if($selected_val=="Michikan")
				   $result = mysql_query("SELECT * FROM pharmacist WHERE postal_address='Michikan' ")or die(mysql_error());
		if($selected_val=="Newark")
				   $result = mysql_query("SELECT * FROM pharmacist WHERE postal_address='Newark' ")or die(mysql_error());
		if($selected_val=="Ladora")
       			$result = mysql_query("SELECT * FROM pharmacist WHERE postal_address='Ladora' ")or die(mysql_error());		   
		
		// display data in table
        echo "<table border='1' cellpadding='5'align='center'>";
        echo "<tr> <th>ID</th>  <th>Staff ID</th><th>Firstname </th> <th>Lastname </th> <th>Username </th> <th>Address</th> <th>Phone</th></tr>";
        // loop through results of database query, displaying them in the table
        while($row = mysql_fetch_array( $result )) {
                // echo out the contents of each row into a table
                echo "<tr>";
                echo '<td>' . $row['pharmacist_id'] . '</td>';
                echo '<td>' . $row['staff_id'] . '</td>';
                echo '<td>' . $row['first_name'] . '</td>';
				echo '<td>' . $row['last_name'] . '</td>';
                echo '<td>' . $row['username'] . '</td>';
				echo '<td>' . $row['postal_address'] . '</td>';
                echo '<td>' . $row['phone'] . '</td>';
               
				?>


				<?php
		 } 
        // close table>
        echo "</table>";
?> 
        </div> 
         
        
        </div>  
    </div>  
</div>
</div>
<div id="footer" align="Center"> </div>
</div>
</body>
</html>

				<script>
function myFunction() {
    alert("User Register");
}
</script>