<nav class="navbar navbar-default">
 <div class="container-fluid">
   <div class="navbar-header">
     <a class="navbar-brand" href="index.php?nav=home">BajuBu.com</a>
   </div>
   <ul class="nav navbar-nav">
     <li class=<?php echo isset($_GET['nav']) ? ($_GET['nav'] == 'catalog' ?  "active" : "") : (""); ?>>
       <a href="index.php?nav=catalog">Katalog Baju</a>
     </li>
     <li><a href="blog">Blog</a></li>
   <form class="navbar-form navbar-left">
     <div class="form-group">
       <input type="text" class="form-control" placeholder="Search">
     </div>
     <button type="submit" class="btn btn-default">Cari</button>
   </form>
   <li class=<?php echo isset($_GET['nav']) ? ($_GET['nav'] == 'cart' ?  "active" : "") : (""); ?>>
     <a href="index.php?nav=cart">Keranjangku</a>
   </li>
   <li class=<?php echo isset($_GET['nav']) ? ($_GET['nav'] == 'login' ?  "active" : "") : (""); ?>>
     <a href="index.php?nav=login">Masuk / Daftar</a>
   </li>
    </ul>
 </div>
</nav>
