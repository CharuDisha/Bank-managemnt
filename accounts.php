<?php
session_start();
if(!isset($_SESSION['userId'])){ header('location:login.php');}
?>
<!DOCTYPE html>
<html>
<head>
  <title>Banking</title>
  <?php require 'assets/autoloader.php'; ?>
  <?php require 'assets/db.php'; ?>
  <?php require 'assets/function.php'; ?>

</head>
<body style="background: url(images/user3.png);background-size: 100% ;font-family: Times New Roman" class="bg-gradient-seconday">
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
        <a class="nav-link " href="index.php">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active ">  <a class="nav-link" href="accounts.php">Account</a></li>
      <li class="nav-item ">  <a class="nav-link" href="statements.php">Statements</a></li>
      <li class="nav-item ">  <a class="nav-link" href="transfer.php">Transfer</a></li>
      <!-- <li class="nav-item ">  <a class="nav-link" href="profile.php">Profile</a></li> -->


    </ul>
    <?php include 'sideButton.php'; ?>
   
  </div>
</nav><br><br><br>
<div class="container">
  <div class="card alert alert-secondary w-50 mx-auto">
  <div class="card-header alert alert-dark text-center">
    ACCOUNT INFORMATION
  </div>
  <div class="card-body">
    <table class="table table-striped w-75 mx-auto">
  <thead>
    <tr>
      <td scope="col">Account No.</td>
      <th scope="col"><?php echo $userData['accountNo']; ?></th>
    </tr>
  </thead>
  <tbody>
  <tr>
      <th scope="row">Name</th>
      <td><?php echo $userData['name']; ?></td>
    </tr>
    <tr>
      <th scope="row">Branch</th>
      <td><?php echo $userData['branchName']; ?></td>
    </tr>
    <tr>
      <th scope="row">Branch Code</th>
      <td><?php echo $userData['branchNo']; ?></td>
    </tr>
    <tr>
      <th scope="row">Account Type</th>
      <td><?php echo $userData['accountType']; ?></td>
    </tr>
    <tr>
      <th scope="row">Account Created</th>
      <td><?php echo $userData['date']; ?></td>
    </tr>
    <tr>
      <th scope="row">Balance</th>
      <td><?php echo $userData['balance']; ?></td>
    </tr>
  </tbody>
</table>
      
  </div>
  <div class="card-footer text-center text-muted alert alert-dark">
   <?php echo bankname ?>
  </div>
</div>

</div>
</body>
</html>