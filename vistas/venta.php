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

if ($_SESSION['ventas']==1)
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
                          <h1 class="box-title">Salidas <button class="btn btn-success" id="btnagregar" onclick="mostrarform(true)"><i class="fa fa-plus-circle"></i> Agregar</button></h1>
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
                            <th>Cliente</th>
                            <th>Usuario</th>
                            <th>Tip. Operacion</th>
                            
                            <th>Total Venta</th>
                            <th>Estado</th> 
                            <th>Tip. Servicio</th> 
                            <th>Tip. empaquetado</th> 
                          </thead>
                          <tbody>                            
                          </tbody>
                          <tfoot>
                          <th>Opciones</th>
                            <th>Fecha</th>
                            <th>Cliente</th>
                            <th>Usuario</th>
                            <th>Tip. Operacion</th>
                           
                            <th>Total Venta</th>
                            <th>Estado</th>
                            <th>Tip. Servicio</th> 
                            <th>Tip. empaquetado</th> 
                          </tfoot>
                        </table>
                    </div>
                    <div class="panel-body" style="height: 400px;" id="formularioregistros">
                        <form name="formulario" id="formulario" method="POST">

                          <div class="row">
                            <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                              <label>Cliente(*):</label>
                              <input type="hidden" name="idventa" id="idventa">
                              <select name="idcliente" id="idcliente" class="form-control selectpicker" data-live-search="true" required></select>
                            </div><!-- /Clientes -->
                            <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                              <label>Fecha(*):</label>
                              <input type="date" class="form-control" name="fecha_hora" id="fecha_hora"  required>
                            </div><!-- /Fecha -->
                          </div>
                          <div class="row">
                            <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                              <label>Vendedor:</label>
                                  <a data-toggle="modal" href="#modalAddSell">
                                  <button id="btnAgregarArt" type="button" class="btn btn-success" > <span class="fa fa-plus"></span>
                                  Agregar Vendedor</button></a>  
                            </div><!-- /Vendedor -->
                            <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                              <label>Seleccionar Vendedor:</label>
                              <a data-toggle="modal" href="#modalSearchCustomer">
                                  <button id="btnBuscarContacto" type="button" class="btn btn-info" > <span class="fa fa-plus"></span>
                                  Seleccionar Vendedor</button></a>
                                  <table id="tablaDetalleContacto" class="table table-striped table-bordered table-condensed table-hover">
                                        <thead>
                                          <th>Nombre</th>
                                          <th>Apellido</th>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                  </table>
                            </div><!-- /Seleccionar Vendedor -->
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
                            <div class="form-group col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                  <label>Agregar Articulo(*):</label>
                                   
                                    <a data-toggle="modal" href="#myModal">
                                    <button id="btnAgregarArt" type="button" class="btn btn-primary" > <span class="fa fa-plus"></span>
                                    Agregar Articulos</button></a>
                            </div><!-- /Agregar Articulo -->
                            <div class="form-group col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                  <label>descripcion</label>
                                  <textarea  class="form-control" name="descripcion" id="descripcion" cols="4" rows="4" placeholder="Descripcion"></textarea>
                            </div><!-- /Agregar Descripci[on] -->
                          </div>   

                             
                        <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
                        <table id="detalles" class="table table-striped table-bordered table-condensed table-hover">
                          <thead>
                          <th>Opciones</th>
                          <th>Artículo</th>
                          <th>Cantidad</th>
                          <th>Precio Venta</th>
                          <th>Descuento</th>
                          <th>Subtotal</th>
                          </thead>
                        <!--  //pie -->
                        <tfoot>
                          <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>SubTotal</td>
                            <td><input placeholder="SubTotal" id="idSubtotal" name="txtSubTotal" value=""></td>
                          </tr>
                          <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>IGV</td>
                            <td><input placeholder="IGV" id="igv" name="txtIgv" value="" readonly ></td>
                          </tr>
                          <td></td>
                          <th></th>
                          <th></th>
                          <th></th>
                          <th></th>
                          <th>TOTAL</th>
                          <td><span class="total" id="total">S/ 0.00</span> <input type="hidden" name="total_venta" id="total_venta"> </td>
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

<!-- Modal Cliente buscar -->
<div class="modal fade" id="modalSearchCustomer" tabindex="-1" role="dialog" aria-labelledby="modalSearchCustomerLabel">
  <form name="frmBuscarContacto" id="frmBuscarContacto" method="POST">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="modalSearchCustomerLabel">Buscar cliente</h4>
      </div>
      <div class="modal-body">
     
  
        <!-- tabla -->
       		
                          <table id="detalleBusqueda" class="table table-striped table-bordered table-condensed table-hover">
                          <thead>
                          <th>Opciones</th>
                          <th>Nombre</th>
                          <th>Apellido</th>
                          <th>Celular</th>
                      
                          </thead>
                          
                          <tfoot>
                          <th>Opciones</th>
                          <th>Nombre</th>
                          <th>Apellido</th>
                          <th>Celular</th>
                          </tfoot>
                          
                          <tbody>
                          </tbody>
                        </table>
        <!-- /tabla -->
     
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
      </div>

      
      <div class="alert alert-success" role="alert" id="divMensajeCliente"></div>
      </div>
    </div>
    </form>
    </div>	
    <!-- /Modal Cliente buscar -->  
<style>
  table#detalles {
    background: #ffffff;
}
</style>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" style="width: 65% !important;">
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
                    <th>Precio Venta</th>
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
                        <th>Precio Venta</th>                    
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

<!-- Modal Agregar Vendedor -->
<div class="modal fade" id="modalAddSell" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" >
    <div class="modal-content">
      <div class="modal-header">
         <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;
         </button>
         <h4 class="modal-title">Agregar Vendedor</h4>
         <form name="frmVendedor" id="frmVendedor" method="POST">
        <!-- datos del Vendedor -->
                <div class="row">
                  <div class="col-md-6 col-xs-12">
                  <input type="hidden" id="idvendedor " name="idvendedor " class="form-control">
                    <label for="f_name">Nombre</label>
                    <input type="text" id="nombre" name="nombre" class="form-control" placeholder="Nombres completos" required>
                  </div>
                  <div class="col-md-6 col-xs-12">
                    <label for="f_name">Apellidos</label>
                    <input type="text" id="apellido" name="apellido" class="form-control" placeholder="Apellido paterno y materno">
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6 col-xs-12">
                    <label for="dniruc">DNI</label>
                    <label>Número Documento: <a class="btn btn-success" href="#" onclick="getReniec()">RENIEC</a> </label></label>
                    <input oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" type = "number"  maxlength = "11" id="dni" name="dni" class="form-control" placeholder="Ingrese minimo 8 caracteres para el DNI y 11 para el RUC">
                  </div>
  
                  <div class="col-md-6 col-xs-12">
                    <label for="email">Email</label>
                    <input type="text" id="email" name="email" class="form-control" placeholder="Email requerido">
                  </div>
  
                </div>
                <div class="row">
                  <div class="col-md-12 col-xs-12">
                    <label for="mobile">Celular</label>
                    <input type="text" id="celular" name="celular" class="form-control" placeholder="01 999999999">
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-12 col-xs-12">
                    <label for="address">WhatsApp </label>
                    <input type="text" id="whatsapp" name="whatsapp" class="form-control" placeholder="Whatsapp">
                  </div>
                </div>
        <!-- datos del Vendedor -->
     
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
     
        <button class="btn btn-primary" type="submit" id="btnGuardarContacto"><i class="fa fa-save"></i> Guardar</button>
      </div>
      <div class="alert alert-success" role="alert" id="divMensajeCliente"></div>
      </form>
    </div>
  </div>
</div> 
<!-- /Modal Agregar Cliente -->

<!-- Modal Cliente buscar -->
<div class="modal fade" id="modalSearchCustomer" tabindex="-1" role="dialog" aria-labelledby="modalSearchCustomerLabel">
<form name="frmBuscarContacto" id="frmBuscarContacto" method="POST">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="modalSearchCustomerLabel">Buscar cliente</h4>
      </div>
      <div class="modal-body">
        <!-- tabla -->
            <table id="detalleBusqueda" class="table table-striped table-bordered table-condensed table-hover">
                <thead>
                  <th>Opciones</th>
                  <th>Nombre</th>
                  <th>Apellido</th>
                  <th>Celular</th>
                </thead>           
                <tfoot>
                  <th>Opciones</th>
                  <th>Nombre</th>
                  <th>Apellido</th>
                  <th>Celular</th>
                </tfoot>
                            
                <tbody>
                </tbody>
            </table>
        <!-- /tabla -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
      </div>

      
      <div class="alert alert-success" role="alert" id="divMensajeCliente"></div>
      </div>
    </div>
    </form>
    </div>	
    <!-- /Modal Cliente buscar -->

<STYLE>
input#impuesto {
    WIDTH: 70PX;
    DISPLAY: INLINE-BLOCK;
}
div#formularioregistros {
    height: 520px !important;
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
<script type="text/javascript" src="scripts/venta.js"></script>
<?php
}
ob_end_flush();
?>