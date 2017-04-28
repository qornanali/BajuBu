<?php

$sql = "SELECT product.PRODUCT_ID, product.PRODUCT_NAME, product.PRODUCT_DESCRIPTION, product.PRODUCT_IMAGE FROM product WHERE product.PRODUCT_ID = '" . $_GET['id'] . "' LIMIT 1";
$listProduct = mysqli_query($connection, $sql);

$data = mysqli_fetch_array($listProduct, MYSQL_ASSOC);
if(!mysqli_connect_error()){

}else{
    echo mysqli_connect_error();
}
?>

<div class="row">
  <div class="col-sm-4">
  <h4><?php echo $data['PRODUCT_NAME']; ?></h4>
  <img src="<?php echo $data['PRODUCT_IMAGE']; ?>" class="img-rounded" alt="Cinque Terre" width="150" height="150">
</div>
