﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/PaginaMaestraCliente.Master" AutoEventWireup="true" CodeBehind="Pedido.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Public.Pedido" %>

<%@ MasterType VirtualPath="~/Shared/PaginaMaestraCliente.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
     <div  style="background-image:url('../../Content/Image/banner-curso-degrade.png')">
   <br />
   <br />     
   <h3  style="margin-left:30px; margin-top:30px"> Servicios  /  Pedidos  </h3>
   <br />     
   <br />
      </div>

   <%-- ----------------------  Tabla deseos Titulo - Descripcion - Precio  - Fecha - Horario - Eliminar  - Total --------------------------%>
    <br />     
    <br />
    <br />     
    <br />

   

   
      <div id="test" runat="server">
             <% if (ListaDeServicios != null && ListaDeServicios.Any())
                        {
            %>

      <table  class="table-bordered col-md-12" id="tlbPedido" style="width:70%; margin-left:160px; " > <%--tabla de los servicios deseados--%>
        <thead>
            <tr> <%--// tr filas--%>
                <th class="text-center" id="txtImagen"> </th>
                <th class="text-center" id="txtTitulo"> Titulo</th> <%--th encabezados--%>
                <th class="text-center" id="txtDescripcion">Descripcion</th>
                <th class="text-center" id="txtPrecio">Precio</th>
                <th class="text-center" id="txtFecha">Fecha</th>
                <th class="text-center" id="txtHorario">Horario</th>
                <th class="text-center" id="txtEliminar">Eliminar</th>
                <th></th>
               
            </tr>
      
       </thead>

                          <tbody>
                               <% foreach (var s in ListaDeServicios)
                        {
                               %>
                                    <tr class="<%= s.IdServicio%>">

                                      <td class="text-center" style="padding: 7px;">
                                         
                                        <div class="img-thumbnail img-thumbnail-cart">
                                             <img class="img-responsive" src="/Content/Image/<%= s.URLimagen%>" style="vertical-align: middle;" />
                                        </div>
                                      </td>
                                      <td class="Text-center">
                                         <h4><%=s.Titulo%></h4>
                                     
                                      </td>
                                      <td class="Text-center">
                                          <h4><%=s.Descripcion%></h4>
                                            
                                      </td>
                                      <td class="text-center" style="width: 80px">
                                         <p><span> $ </span>  <span><%= s.Precio %></span>
                                         </p>
                                     </td>
                                      <td>
                                          <%--fecha--%>
                                     
                                         
                                          <div class="dates" style="display:flex; color:#000000; width:120px">
    
                                         <input type="text"  class="form-control" id="usr1"  placeholder="YYYY-MM-DD" autocomplete="off" style="width:120px;background-color:#ffffff; align-self:center " >
                                         </div>
                                            
                                       </td>
                                     <td>
                                  <%--   horario--%>
                                         <div class='times' style="display:flex; color:#000000; width:110px">


                                             <input  type="text"  id="disableTimeRangesExample"  class="form-control" style="width:110px;background-color:#ffffff; align-self:center "/>
                                       
                                         </div>
                                        
                                     </td>

                                     <td class="text-center"  style="width: 80px">
                                         <button   id="putEliminarDeseo" data-s="<%=s.IdServicio %>" value="Eliminar" onclick="fEliminarDeseo(this)" class="btn-default " title="Eliminar" >Eliminar</button>
                                         <%--<input  type="button" data-s="<%=s.IdServicio %>" value="Eliminar" onclick="EliminarDeseo()" clientidmode="static" runat="server" />--%>
                                          
                                     </td>

                                <%
                                  } %>
                         </tbody>

      </table>

          
              <%
                } %>


          


           &nbsp;</div>

    <br />
    <br />
    <br />

    
  
       <%-- ---------------------- Fin de Tabla deseos Titulo - Descripcion - Precio  - Fecha - Horario - Eliminar  - Total --------------------------%>

            


 
    <div  class="item-toolbar" runat="server"  >
  
           <a href="MisDirecciones.aspx"  class="btn btn-lg btn-default  " runat="server" style="position: fixed; margin-left: 75px; background-color:cadetblue " > Continuar </a>
                <%--<input type="button" id="footer" class="btn btn-lg btn-warning pull-right btn-caja" runat="server" onclick="btnDatosPersonales"  value="Continuar" />--%>

           </div>
  
    <style>

        #footer {
   position:fixed;
   left:0px;
   bottom:0px;
   height:30px;
   width:100%;
   background:#999;
}
    </style>

  
 </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">

      
  <script>


       $(document).ready(function() {
			$('.dates #usr1').datepicker({
                'format': 'yyyy-mm-dd',
                 daysOfWeekDisabled: [0],
				'autoclose': true
			});
	   });

      $(document).ready(function() {
        $('.times #disableTimeRangesExample').timepicker({
          'disableTimeRanges': [
                ['0.00am', '7.59am' ],
               ['12.01pm', '23.59am']
           
	      ]
        });
      });

  </script>

<script type="text/javascript">

     function fEliminarDeseo(laPagina) {
       
          var control = $(laPagina);
           var idServicio = control.data('s');  /*el idServicio viene del data-s*/

            $.ajax({
                type: "POST",
                url: "Pedido.aspx/CancelarDeseoDeLaLista",
                data: '{ id: ' + idServicio + '}',
            
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                //success: OnSuccess,
                error: function (result) {
                    alert("Error" + result);
                }
            });
        
    };
      
       //$(function EliminarDeseo() {
       //     $('#EliminarDeseo').click(function() {

       //         var ValorId = $('IdServicio').val();
           
       //    $.ajax({
       //        type: "POST",
       //        url: "Pedido.aspx/CancelarDeseoDeLaLista" ,
       //        data: '{ id: ' + ValorId + '}',
       //          //data: '{ id: ' + $(this).data('s') +'}',
       //        contentType: "application/json; charset=utf-8",
       //        dataType: "json",
       //         success: OnSuccess,
       //         error: function (result) {
       //         alert("Error" + result);
       //    }
       //        });
       // });

       //});

</script>


<%--      //$(function () {
      //     //$('#basicExample').timepicker();

      //          $('#datetimepicker3').datetimepicker({
      //              format: 'LT'
      //          });
      //});
     
      //  $('.delete-cart').click(function () {
      //      $.ajax({
      //          type: "POST",
      //          url: "Pedido.aspx/DeleteItem",
      //          data: '{ id: ' + $(this).data('s') + '}',
      //          contentType: "application/json; charset=utf-8",
      //          dataType: "json",
      //          error: function (xhr, status, error) {
      //              alert(error);
      //          },
      //          success: function () {
      //              app.reload();

      //          }
      //    });
--%>

   <%-- <script type="text/javascript">
          jQuery('#fecha').datepicker({  //datatimepicker2 fecha

        onGenerate: function (ct) {
            jQuery(this).find('.xdsoft_date')
                .toggleClass('xdsoft_disabled');

        },
        dateFormat: "dd/mm/yy",
        minDate: '-1970/01/2',
        maxDate: '+1970/01/2',
        timepicker: false,
        datepicker: true,
        beforeshowday: $.datepicker.noWeekends,
        noWeekends: true,

    });

    $('#hora').timepicker({
        'minTime': '9:00pm',
        'maxTime': '12:00pm',
        //'step': 30,
        'showDuration': true,
        'timeFormat': 'H:i',
        'disableTimeRanges': [
            ['09:00', '12:01'],
            ['12:01', '18:01']]//unavailableTime
    });--%>
  
  
</asp:Content>
