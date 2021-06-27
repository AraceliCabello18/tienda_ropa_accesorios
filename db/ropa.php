<?php include "header.php"; ?>
<?php
include 'Configuracion.php';
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Armario Vintage</title>
    <meta charset="utf-8">
    <?php include "footer.php"; ?>
</head>
</head>
<body>
<div class="panel-body">
    <h1>Ropa</h1>
    <a href="VerCartaRopa.php"></a>
  
        <?php
      
        //get rows query
        $query = $db->query("SELECT * FROM mis_ropa ORDER BY id DESC LIMIT 10");
        if($query->num_rows > 0){ 
            while($row = $query->fetch_assoc()){
        ?>
        <div class="table-responsive">
    <table class="table table-condensed" >   
    <thead>
        <tr>
            <th>Producto</th>
            <th>Descripcion</th>
            <th>Precio</th>
            <th>Actualizar</th>
            <th>Eliminar &nbsp;</th>
        </tr>
    </thead>
    <tbody>
        <tr>
        <td><?php echo $row["name"]; ?></td>
                <td><?php echo $row["description"]; ?></td>
                <td><?php echo '$'.$row["price"].' MXN'; ?></td>
                <td>
                <a class="btn btn-success" href="AccionRopa.php?action=addToCart&id=<?php echo $row["id"];?>&tienda=ropa">Agregar a la Carta</a> 
                </td>
                <td>
                <a href="AccionRopa.php?action=removeCartItem&id=<?php echo $item["rowid"]; ?>" class="btn btn-danger" onclick="return confirm('Confirma eliminar?')"><i class="glyphicon glyphicon-trash"></i>Eliminar</a>
            </td>
        </tr>

        </div>
        <?php } }else{ ?>
        <p>Producto(s) no existe.....</p>
        <?php } ?>
    </div>
        </div>
 <div class="panel-footer"></div>
 </div><!--Panek cierra-->
 
</div>
</body>
</html>