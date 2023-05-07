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
        <a class="nav-link active" href="mindex.php">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item ">  <a class="nav-link" href="maccounts.php">Staff</a></li>
      <li class="nav-item ">  <a class="nav-link" href="maddnew.php">Create Account</a></li>
      <li class="nav-item ">  <a class="nav-link" href="mfeedback.php">Feedback</a></li>
      <!-- <li class="nav-item ">  <a class="nav-link" href="transfer.php">Funds Transfer</a></li> -->
      <!-- <li class="nav-item ">  <a class="nav-link" href="profile.php">Profile</a></li> -->


    </ul>
    <?php include 'msideButton.php'; ?>
    
  </div>
</nav><br><br><br>
<?php 
  $array = $con->query("select * from useraccounts where userid = '$_GET[id]'");
  $row = $array->fetch_assoc();


 ?>
<div class="container">
<div class="card w-50 mx-auto text-center shadowBlue">
  <div class="card-header alert alert-dark">
    NOTICE TO <?php echo $row['name'] ?>
  </div>
  <div class="card-body">
    <form method="POST">
          <div class="alert alert-dark w-50 mx-auto">
            <input type="hidden" name="userId" value="<?php echo $row['userId'] ?>">
            <textarea class="form-control" name="notice" required placeholder="Write your message"></textarea>
            <button type="submit" name="send" class="btn btn-info btn-block btn-sm my-1">Send</button>
          </div>
      </form><?php
    if (isset($_POST['send']))
    {
      if ($con->query("insert into notice (notice,userId) values ('$_POST[notice]','$_POST[userId]')")) {
        echo "<div class='alert alert-success'>Successfully send</div>";
      }else
      echo "<div class='alert alert-danger'>Not sent Error is:".$con->error."</div>";
    }
    
    ?>  
  </div>
  <div class="card-footer alert alert-dark text-muted">
    <?php echo bankname; ?>
  </div>
</div>

</body>
</html>