<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/PaginaMaestraCliente.Master" AutoEventWireup="true" CodeBehind="Pedido.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Public.Pedido" %>

<%@ MasterType VirtualPath="~/Shared/PaginaMaestraCliente.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <script src = "http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
     <script src = "http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type = "text / javascript"> </script>
    <link   href = "http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel = "Stylesheet" type = "text / css"/>
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

   <%-- ----------------------  Tabla deseos Titulo - Descripcion - Precio  - Fecha - Horario - Eliminar  - Confirmar --------------------------%>
    <br />     
    <br />
    <br />     
    <br />

      <%-- <span id="lblmensaje"  visible="false"></span>--%>
        <asp:Label ID="lblMensaje" runat="server" Visible="false" Text="Label" ClientIDMode="Static"   style="color:white; font-size:20px" ></asp:Label> <br /><br />
  <center>
   
           
     
  
 
    <asp:GridView ID="GVPedido" runat="server" OnRowCommand="GVPedido_RowCommand" OnRowUpdating="GVPedido_RowUpdating"   OnRowEditing="GVPedido_RowEditing" AutoGenerateColumns="False" CellPadding="3" Height="263px" Width="878px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnSelectedIndexChanged="GVPedido_SelectedIndexChanged" OnDataBound="GVPedido_DataBound">
        <Columns>
            <asp:BoundField DataField="IdItemOrdenDeTrabajo" HeaderText="IdItem" SortExpression="IdItemOrdenDeTrabajo"  >
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="MiServicio.Titulo" HeaderText="Titulo" SortExpression="Titulo"   >
            <HeaderStyle HorizontalAlign="Center" CssClass="Center" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="MiServicio.Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" >
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center"  />
            </asp:BoundField>
            <asp:BoundField DataField="MiServicio.Precio" HeaderText="Precio" SortExpression="Precio" >
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="MiServicio.URLimagen" HeaderText="Imagen"  >
            </asp:BoundField>
            <asp:TemplateField HeaderText="Fecha" ItemStyle-HorizontalAlign = "Center">

                <ItemTemplate >

                 <div class="dates" style="display:flex; color:#000000; width:120px">
                   
<%--                    <input type="text"  class="form-control" id ="<% Response.Write("usr" + (this.Controls.Count).ToString()); %>"  placeholder="YYYY-MM-DD" autocomplete="off" name="DatePickerFecha" style="width:120px;background-color:#ffffff; align-self:center " >--%>


                     </div>
                  
                </ItemTemplate>


                <HeaderStyle HorizontalAlign="Center" />

<ItemStyle HorizontalAlign="Center"></ItemStyle>


            </asp:TemplateField>
            <asp:TemplateField HeaderText="Hora">
                <ItemTemplate >
           
                    <div class='times' style="display:flex; color:#000000; width:110px">

                    <%--<input  type="text"   id="disableTimeRangesExample"  class="form-control" name="DatePickerTime" style="width:110px;background-color:#ffffff; align-self:center "/>--%>
                                       
                      </div>
                    </ItemTemplate>


            </asp:TemplateField>
   
            
            <asp:BoundField HeaderText="Cantidad">
            <HeaderStyle HorizontalAlign="Center" />
            </asp:BoundField>
   
            
            <asp:ButtonField CommandName="btnEliminar" Text="Eliminar" ButtonType="Button " ControlStyle-BackColor="Red"  ControlStyle-ForeColor="White" >
<ControlStyle BackColor="Red" ForeColor="White"></ControlStyle>
            </asp:ButtonField>
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
        </center>
    <br />
    <br />
    <br />

    
  
       <%-- ---------------------- Fin de Tabla deseos Titulo - Descripcion - Precio  - Fecha - Horario - Eliminar  - Confirmar --------------------------%>

            


 
    <div  class="item-toolbar" runat="server"  style="margin-left:160px" >
        <asp:Button ID="BtnContinuar" runat="server" Text=" Continuar " ClientIDMode="Static"  OnClick="BtnContinuar_Click"  class="btn btn-lg btn-default  " style="position: fixed; margin-left: 75px; background-color:cadetblue " />
    <asp:Button ID="btnIrADirecciones" runat="server" Text="Seleccionar Dirección" OnClick="btnIrADirecciones_Click"  class="btn btn-lg btn-default  " style="position: fixed; margin-left: 275px; background-color:cadetblue " />     
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

<%--<script type="text/javascript">

    $(function () {
        $("[id $= txtFecha]").datepicker({

            showOn: 'boton',
            buttonImageOnly: verdadero,
            buttonImage: 'https://jqueryui.com/resources/demos/datepicker/images/calendar.gif'
        });
    });
       
     function EliminarDeseo(laPagina) {
       
          var control = $(laPagina);
           var idServicio = control.data('s');  /*el idServicio viene del data-s*/

            $.ajax({
                type: "POST",
                url: "Pedido.aspx/CancelarItemDeLaLista",
                data: '{ id: ' + idServicio + '}',
            
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                //success: OnSuccess,
                error: function (result) {
                    alert("Error" + result);
                }
            });
        
    };
      

</script>--%>

</asp:Content>
