<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/PaginaMaestraCliente.Master" AutoEventWireup="true" CodeBehind="Pedido.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Public.Pedido1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script src="../../Script/Thirdparty/jquery-3.4.1.min.js"></script>
    <script src="../../Script/Thirdparty/bootstrap.min.js"></script>
    <link href="../../Content/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
     <div  style="background-image:url('../../Content/Image/banner-curso-degrade.png')">
   <br />
   <br />     
   <h2  style="margin-left:30px; margin-top:30px"> Menu Principal  /  Pedidos  </h2>
   <br />     
    <br />
      </div>

   <%-- ----------------------  Tabla deseos Titulo - Descripcion - Precio  - Fecha - Horario - Eliminar  - Total --------------------------%>


   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
   
      <div id="test" runat="server">
             <% if (ListaDeServicios != null && ListaDeServicios.Any())
                        {
            %>

      <table  class="table-bordered col-md-12" id="tlbPedido" style="width:70%; margin-left:160px; " > <%--tabla de los servicios deseados--%>
        <thead>
            <tr> <%--// tr filas--%>
                <th class="text-center" id="txtTitulo"> Titulo</th> <%--th encabezados--%>
                <th class="text-center" id="txtDescripcion">Descripcion</th>
                <th class="text-center" id="txtPrecio">Precio</th>
                <th class="text-center" id="txtFecha">Fecha</th>
                <th class="text-center" id="txtHorario">Horario</th>
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
                                             <%-- <small>SKU: <%=s.Titulo%></small>--%>
                                      </td>
                                      <td class="Text-center">
                                          <h4><%=s.Descripcion%></h4>
                                              <%-- <small>SKU: <%=s.Descripcion %></small>--%>
                                      </td>
                                      <td class="text-center">
                                         <p><span> $ </span>  <span><%= s.Precio %></span>
                                         </p>
                                     </td>
                                      <td>
                                          <%--fecha--%>
                                          <asp:textbox ID="Fecha" runat="server"></asp:textbox>
                                          <asp:imagebutton ID="ImagenBtn" runat="server" imageURL="../../Content/Image/calendario.png"  ImageAlign="AbsBottom" OnClick="ImagenBtn_Click" > </asp:imagebutton>
                                          <asp:calendar ID="Calendar" runat="server" BackColor="#999999" OnSelectionChanged="Calendar_SelectionChanged" OnDayRender="Calendar_DayRender" ></asp:calendar>
                                      </td>
                                     <td>
                                        <%-- horario--%>

<%--                                         <asp:TextBox ID="hora" runat="server"></asp:TextBox>
                                         <asp:ImageButton ID="ImageButtonhora" runat="server" ImageUrl="../../Content/Image/reloj.png" ImageAlign="AbsBottom" OnClick="ImageButtonhora_Click" />
                                         <asp:Timer ID="Timer1" runat="server"></asp:Timer>--%>

                                         <div class="col-md-10">
                                             <input type="text" id="hora" name="Hora" class="form-control" />
                                         </div>
                                     </td>

                                     <td class="text-center">
                                             <button class="btn btn-default delete-cart" data-producto="<%=s.IdServicio %>">
                                             <i class=" glyphicon glyphicon-trash"></i>
                                             </button>
                                     </td>

                                <%
                                  } %>
                         </tbody>

      </table>

          
              <%
                } %>
          </div>

       <%-- ---------------------- Fin de Tabla deseos Titulo - Descripcion - Precio  - Fecha - Horario - Eliminar  - Total --------------------------%>

             <div  class="item-toolbar" runat="server" >
                <input type="button" class="btn btn-lg btn-warning pull-right btn-caja" id="IdContinuarDatosPersonales" runat="server" onclick="btnDatosPersonales" text="Continuar"  />
             </div>


    <script type="text/javascript">
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
    });
    </script>
</asp:Content>
