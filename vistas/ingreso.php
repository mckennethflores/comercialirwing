<?php
ob_start();
session_start();
if(!isset($_SESSION["nombre"]))
{
  header("Location: login.html");
}
else
{
require_once("header.php");

if ($_SESSION['compras']==1)
{
?>
  <style>
  table.dataTable {
    width: 100% !important;
 
}
 </style>
<!--Contenido-->
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">        
        <!-- Main content -->
        <section class="content">
            <div class="row">
              <div class="col-md-12">
                  <div class="box">
                    <div class="box-header with-border">
                          <h1 class="box-title">Ingreso <button class="btn btn-success" id="btnagregar" onclick="mostrarform(true)"><i class="fa fa-plus-circle"></i> Agregar</button></h1>
                        <div class="box-tools pull-right">
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <!-- centro -->
                    <div class="panel-body table-responsive" id="listadoregistros">
                        <table id="tbllistado" class="table table-striped table-bordered table-condensed table-hover">
                          <thead>
                            <th>Opciones</th>
                            <th>Fecha</th>
                            <th>Proveedor</th>
                            <th>Usuario</th>
                            <th>Tip. Servicio</th>
                            <th>Tip. empaquetado</th>
                            <th>Total Compra</th>
                            <th>Estado</th>
                          </thead>
                          <tbody>                            
                          </tbody>
                          <tfoot>
                            <th>Opciones</th>
                            <th>Fecha</th>
                            <th>Proveedor</th>
                            <th>Usuario</th>
                            <th>Tip. Servicio</th>
                            <th>Tip. empaquetado</th>
                            <th>Total Compra</th>
                            <th>Estado</th>
                          </tfoot>
                        </table>
                    </div>
                    <div class="panel-body" style="height: 400px;" id="formularioregistros">
                        <form name="formulario" id="formulario" method="POST">
                          <div class="row">
                            <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                              <label>Cliente(*):</label>
                              <input type="hidden" name="idingreso" id="idingreso">
                            <select name="idproveedor" id="idproveedor" class="form-control selectpicker" data-live-search="true" required></select>
                            </div><!-- /Cliente -->
                            <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <label>Fecha:(*)</label>
                            <input type="date" class="form-control" name="fecha_hora" id="fecha_hora"  required>
                            </div><!-- /Fecha -->
                          </div>

                          <div class="row">
                            <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                  <label>Tipo de operacion(*):</label>
                                  <select name="tipo_comprobante" id="tipo_comprobante" class="form-control selectpicker" required>
                                    <option value="0" disabled>SELECCIONE EL TIPO DE OPERACION</option>
                                    <option selected value="VENTA">VENTA</option>
                                    <option value="SERVICIO">SERVICIO</option>
                                  </select>
                            </div><!-- /Tipo de operacion -->
                            <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                  <label>Tipo de servicio(*):</label>
                                  <select name="tipo_servicio" id="tipo_servicio" class="form-control selectpicker" required>
                                    <option value="0" disabled>SELECCIONE EL TIPO DE SERVICIO</option>
                                    <option selected value="TOSTADO">TOSTADO</option>
                                    <option value="MOLIENDA">MOLIENDA</option>
                                  </select>
                            </div><!-- /Tipo de servicio -->
                            <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                <label>Tipo de empaquetado(*):</label>
                                <select name="tipo_empaquetado" id="tipo_empaquetado" class="form-control selectpicker" required>
                                  <option value="0" disabled>SELECCIONE EL TIPO DE EMPAQUETADO</option>
                                  <option selected value="EMPAQUETADO">EMPAQUETADO</option>
                                  <option value="GRANEL">GRANEL</option>
                                  <option value="EMPAQUETADO-GRANEL">EMPAQUETADO/GRANEL</option>
                                </select>
                            </div><!-- /Tipo de empaquetado -->
                          </div>
                          <div class="row">
                            <div class="form-group col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                <a data-toggle="modal" href="#modalArticulos">
                                <button id="btnAgregarArt" type="button" class="btn btn-primary" > <span class="fa fa-plus"></span>
                                Agregar Articulos</button>
                                </a>
                            </div><!-- /Agregar Articulo -->
                            <div class="form-group col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                  <label>descripcion</label>
                                  <textarea  class="form-control" name="descripcion" id="descripcion" cols="4" rows="4" placeholder="Descripcion"></textarea>
                            </div><!-- /Agregar Descripcion] -->
                          </div>
                          
                          <!-- <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <label>Tipo Comprobante(*):</label>
                            <select name="tipo_comprobante" id="tipo_comprobante" class="form-control selectpicker" required>
                            <option value="Boleta">Boleta</option>
                            <option value="Factura">Factura</option>
                            <option value="Ticket">Ticket</option>
                            </select>
                          </div> -->
                          <!-- <div class="form-group col-lg-2 col-md-2 col-sm-2 col-xs-12">
                            <label>Serie:</label>
                            <input type="text" class="form-control" name="serie_comprobante" id="serie_comprobante" maxlength="7" placeholder="Número" >
                          </div>  
                          <div class="form-group col-lg-2 col-md-2 col-sm-2 col-xs-12">
                            <label>Número:</label>
                            <input type="text" class="form-control" name="num_comprobante" id="num_comprobante" maxlength="10" placeholder="Serie" >
                          </div> -->
                        <!--   <div class="form-group col-lg-2 col-md-2 col-sm-2 col-xs-12">
                            <label>Impuesto:</label>
                            <input type="text" class="form-control" name="impuesto" id="impuesto" placeholder="Imp." >%
                          </div> -->
                          
                        <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
                        <table id="detalles" class="table table-striped table-bordered table-condensed table-hover">
                          <thead>
                          <th>Opciones</th>
                          <th>Artículo</th>
                          <th>Cantidad</th>
                          <th>Precio Compra</th>
                          <th>Precio Venta</th>
                          <th>Subtotal</th>
                          </thead>
                          <tfoot>
                          <th>TOTAL</th>
                          <th></th>
                          <th></th>
                          <th></th>
                          <th></th>
                          <th><h4 id="total">S/ 0.00</h4> <input type="hidden" name="total_compra" id="total_compra"> </th>
                          </tfoot>
                          <tbody>

                          </tbody>
                        </table>
                        </div>                                                                                      
                          <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12" >
                            <button class="btn btn-primary" type="submit" id="btnGuardar"><i class="fa fa-save"></i> Guardar</button>
                            <button id="btnCancelar" class="btn btn-danger" onclick="cancelarform()" type="button"><i class="fa fa-arrow-circle-left"></i> Cancelar</button>
                          </div>
                        </form>
                    </div>
                    <!--Fin centro -->
                  </div><!-- /.box -->
              </div><!-- /.col -->
          </div><!-- /.row -->
      </section><!-- /.content -->

    </div><!-- /.content-wrapper -->
  <!--Fin-Contenido-->

  <!-- Modal -->
<div class="modal fade" id="modalArticulos" tabindex="-1" role="dialog" 
aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
         <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;
         </button>
         <h4 class="modal-title">Seleccione un Artículo</h4>
      </div>
      <div class="modal-body">
                <table id="tblarticulos" class="table table-striped table-bordered table-condensed table-hover">
                    <thead> 
                    <th>Opciones</th>
                    <th>Nombre</th>
                    <th>Categoría</th>
                    <th>Código</th>
                    <th>Stock</th>
                    <th>Imagen</th>
                    </thead>
                    <tbody>

                    </tbody>
                    <tfoot>
                    <th>Opciones</th>
                    <th>Nombre</th>
                    <th>Categoría</th>
                    <th>Código</th>
                    <th>Stock</th>
                    <th>Imagen</th>                      
                    </tfoot>
                </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>  
<STYLE>
input#impuesto {
    WIDTH: 70PX;
    DISPLAY: INLINE-BLOCK;
}
</STYLE>
  <!-- Fin modal -->
<?php
}
else
{
  require 'noacceso.php';
}
require_once("footer.php");
?>
<script type="text/javascript" src="scripts/ingreso.js"></script>
<?php
}
ob_end_flush();
?>