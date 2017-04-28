<?php

$limit = 12;
if($_GET['nav'] != 'home'){
  $limit = 30;
}
    $sql = "SELECT product.PRODUCT_ID, product.PRODUCT_NAME, product.PRODUCT_DESCRIPTION, product.PRODUCT_IMAGE  FROM product LIMIT " . $limit;
$listProduct = mysqli_query($connection, $sql);
while($data = mysqli_fetch_array($listProduct, MYSQL_ASSOC)){
 ?>
<!-- <div class="row"> -->
  <div class="col-sm-3">
  <h4><?php echo $data['PRODUCT_NAME']; ?></h4>
  <img src="<?php echo $data['PRODUCT_IMAGE']; ?>" class="img-rounded" alt="Cinque Terre" width="150" height="150">
  <br>
  <?php echo $data['PRODUCT_DESCRIPTION']; ?>
  <br><br>
  <a href="<?php echo "index.php?nav=catalog&id=" . $data['PRODUCT_ID']; ?>">
    <button type="button" class="btn btn-primary">Lihat</button>
  </a>
<!-- </div> -->
</div>
<?php
}
?>
