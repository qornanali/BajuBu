<head>
<title>
  <?php
  $redirect = 0;
    if(isset($_GET['nav'])){
      if($_GET['nav'] == "login"){
        $redirect = 1;
          $title = "BajuBu - Masuk";
      }else if($_GET['nav'] == "catalog"){
        if(isset($_GET['id'])){
          $redirect = 4;
        }else {
          $redirect = 2;
        }
        $title = "BajuBu - Katalog Baju";
      }else if($_GET['nav'] == "cart"){
        $redirect = 3;
          $title = "BajuBu - keranjangku";
      }else{
        $title = "BajuBu - Home";
      }
      echo $title;
    }
    ?>
</title/>
</ehad>
<?php
include 'navbar.php'
?>
<body>
<div class="container">
  <?php
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
      case 4 :
      include "catalog_detail.php";
      break;
      default :
      include 'home.php';
      break;
    }
    ?>
</div>
<br><br><br><br>
<?php
include 'footer.php'
    ?>
</body>
