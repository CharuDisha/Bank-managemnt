<?php
session_start();
if(!isset($_SESSION['managerId'])){ header('location:login.php');}
?>
<!DOCTYPE html>
<html>
<head>
  <title>Banking</title>
  <?php require 'assets/autoloader.php'; ?>
  <?php require 'assets/db.php'; ?>
  <?php require 'assets/function.php'; ?>
  <?php if (isset($_GET['delete'])) 
  {
    if ($con->query("delete from useraccounts where id = '$_GET[id]'"))
    {
      header("location:mindex.php");
    }
  } ?>
</head>
<body style="background: url(images/home2.jpeg); background-size: 100% ;font-family: Times New Roman" class="bg-gradient-seconday">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
 <a class="navbar-brand" href="#">
    <img src="images/logo1.png" style="object-fit:cover;object-position:center center" width="150" height="100" class="d-inline-block align-top" alt="">
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item ">
        <a class="nav-link " href="mindex.php">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">  <a class="nav-link" href="maccounts.php">Staff</a></li>
      <li class="nav-item ">  <a class="nav-link" href="maddnew.php">Create Account</a></li>
      <li class="nav-item ">  <a class="nav-link" href="mfeedback.php">Feedback</a></li>
      <!-- <li class="nav-item ">  <a class="nav-link" href="transfer.php">Funds Transfer</a></li> -->
      <!-- <li class="nav-item ">  <a class="nav-link" href="profile.php">Profile</a></li> -->


    </ul>
    <?php include 'msideButton.php'; ?>
    
  </div>
</nav><br><br><br>
<?php
if (isset($_POST['saveAccount']))
{
  if (!$con->query("insert into login (email,password,type) values ('$_POST[email]','$_POST[password]','cashier')")) {
    echo "<div claass='alert alert-info'>Failed. Error is:".$con->error."</div>";
  }
}
if (isset($_GET['del']) && !empty($_GET['del']))
{
  $con->query("delete from login where id ='$_GET[del]'");
}
  $array = $con->query("select * from login where type='cashier'");
  
 ?>
<div class="container">
<div class="card w-75  mx-auto">
  <div class="card-header text-center shadowBlue alert alert-dark">
   STAFF DETAILS <button class="btn btn-outline-info btn-sm float-right" data-toggle="modal" data-target="#exampleModal">Add New Account</button>
  </div>
  <div class="card-body">
    <table class="table table-bordered alert alert-dark">
      <thead>
        <tr>
          <th>Email</th>
          <th>Password</th>
          <th>Account Type</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <?php 
          if ($array->num_rows > 0)
          {
            while ($row = $array->fetch_assoc())
            {
              echo "<tr>";
              echo "<td>".$row['email']."</td>";
              echo "<td>".$row['password']."</td>";
              echo "<td>".$row['type']."</td>";
              echo "<td><a href='maccounts.php?del=$row[id]' class='btn btn-danger btn-sm'>Delete</a></td>";
              echo "</tr>";
            }
          }
         ?>
      </tbody>
    </table>
  </div>
  <div class="card-footer text-center text-muted alert alert-dark">
    <?php echo bankname; ?>
  </div>
</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New Cashier Account</h5>
        <button type="button btn btn-info " class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <form method="POST">
          <div class="form-group">
            <label for="email" class="control-label">Email</label>
            <input class="form-control" type="email" name="email" id="email" required placeholder="Email">
          </div>
          <div class="form-group">
            <label for="password" class="control-label">Password</label>
            <input class="form-control" type="password" name="password" id="password" required placeholder="Password">
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" name="saveAccount" class="btn btn-info">Save Account</button>
      </form>
      </div>
    </div>
  </div>
</div>
</body>
</html>