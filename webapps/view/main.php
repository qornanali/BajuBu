<?php
include 'navbar.php'
?>

<div class="container">
  <?php
  $redirect = 0;
    if(isset($_GET['nav'])){
      if(isset($_GET['view'])){
        // if($_GET['view'] == "detail"){
        //   $redirect = 3;
        // }else if($_GET['view'] == "form"){
        //   $redirect = 4;
        // }
      }else if($_GET['nav'] == "login"){
        $redirect = 1;
      }else if($_GET['nav'] == "catalog"){
        $redirect = 2;
      }else if($_GET['nav'] == "cart"){
        $redirect = 2;
      }
    }

    switch($redirect){
      case 1 :
      include 'login.php';
      break;
      case 2 :
      include 'catalog.php';
      break;
      case 3 :
      include "cart.php";
      break;
      default :
      include 'home.php';
      break;
    }

    ?>
</div>
