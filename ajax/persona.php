<?php
require_once "../modelos/Persona.php";

$persona = new Persona();
// condicion de una sola linea
$idpersona = isset($_POST["idpersona"])? limpiarCadena($_POST["idpersona"]):"";
$tipo_persona = isset($_POST["tipo_persona"])? limpiarCadena($_POST["tipo_persona"]):"";
$nombre = isset($_POST["nombre"])? limpiarCadena($_POST["nombre"]):"";
$tipo_documento = isset($_POST["tipo_documento"])? limpiarCadena($_POST["tipo_documento"]):"";
$num_documento = isset($_POST["num_documento"])? limpiarCadena($_POST["num_documento"]):"";
$direccion = isset($_POST["direccion"])? limpiarCadena($_POST["direccion"]):"";
$telefono = isset($_POST["telefono"])? limpiarCadena($_POST["telefono"]):"";
$email = isset($_POST["email"])? limpiarCadena($_POST["email"]):"";

$letra_puesto = isset($_POST["letra_puesto"])? limpiarCadena($_POST["letra_puesto"]):"";
$numero_puesto = isset($_POST["numero_puesto"])? limpiarCadena($_POST["numero_puesto"]):"";


//op significa Operacion
$dni = isset($_POST["dni"])? limpiarCadena($_POST["dni"]):"";
switch($_GET["op"]){
    case 'guardaryeditar':
        if(empty($idpersona)){
            $rspta=$persona->insertar($tipo_persona,$nombre,$tipo_documento,$num_documento,$direccion,$telefono,$email,$letra_puesto,$numero_puesto);
            echo $rspta ? "Persona registrada" : "Persona no se pudo registrar";
        }
        else {
            $rspta=$persona->editar($idpersona,$tipo_persona,$nombre,$tipo_documento,$num_documento,$direccion,$telefono,$email,$letra_puesto,$numero_puesto);
            echo $rspta ? "Persona actualizada" : "Persona no se pudo actualizar";
        }
    break;
    case 'eliminar':
        $rspta=$persona->eliminar($idpersona);
        echo $rspta ? "Persona eliminada" : "Persona no se puede desactivar";
    break;
    case 'mostrar':
        $rspta=$persona->mostrar($idpersona);
        echo json_encode($rspta);
    break;
    case 'validarSunat':
        $rspta=$persona->validarSunat($num_documento);
       echo json_encode($rspta);
    break;
    case 'validarReniec':
        $rspta=$persona->validarReniec($dni);
       echo json_encode($rspta);
    break;
    case 'listarp':
        $rspta=$persona->listarp();
        $data = Array();
        while ($reg=$rspta->fetch_object()){
            $data[]=array(
                "0"=>'<button class="btn btn-warning" onclick="mostrar('.$reg->idpersona.')"><i class="fa fa-pencil"></i></button>'.
                ' <button class="btn btn-danger" onclick="eliminar('.$reg->idpersona.')"><i class="fa fa-trash"></i></button>',
                "1"=>$reg->nombre,
                "2"=>$reg->tipo_documento,
                "3"=>$reg->num_documento,
                "4"=>$reg->telefono,
                "5"=>$reg->email,
            );

        }
        $results= array(
            "sEcho"=>1, //info para datatables
            "iTotalRecords"=>count($data),
            "iTotalDisplayRecords"=>count($data),
            "aaData"=>$data);
        echo json_encode($results);
    break;
    case 'listarc':
    $rspta=$persona->listarc();
    $data = Array();
    while ($reg=$rspta->fetch_object()){
        $data[]=array(
            "0"=>'<button class="btn btn-warning" onclick="mostrar('.$reg->idpersona.')"><i class="fa fa-pencil"></i></button>'.
            ' <button class="btn btn-danger" onclick="eliminar('.$reg->idpersona.')"><i class="fa fa-trash"></i></button>',
            "1"=>$reg->nombre,
            "2"=>$reg->tipo_documento,
            "3"=>$reg->num_documento,
            "4"=>$reg->telefono,
            "5"=>$reg->letra_puesto,
            "6"=>$reg->numero_puesto
        );

    }
    $results= array(
        "sEcho"=>1, //info para datatables
        "iTotalRecords"=>count($data),
        "iTotalDisplayRecords"=>count($data),
        "aaData"=>$data);
    echo json_encode($results);
break;    

}
?>