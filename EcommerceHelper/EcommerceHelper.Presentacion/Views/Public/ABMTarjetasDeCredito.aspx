<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/PaginaMaestraCliente.Master" AutoEventWireup="true" CodeBehind="ABMTarjetasDeCredito.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Public.ABMTarjetasDeCredito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div>
   <br />
   <br />     
   <br />
         <br />
   <h2  style="margin-left:30px">Mis Tarjetas</h2>
   <br />
 
 </div>   
<div  style="background-image:url('../../Content/Image/banner-curso-degrade.png')">
   
    
    <br />
    <h3  style="margin-left:30px; margin-top:30px; color:black"> Servicios  /  Pedidos  / Mis Direcciones / Resumen Compra / Pago / Mis Tarjetas </h3> 
       <br />
    <br />             
   
 </div>
    <br />
    <br /> 
    <br />
    <div>

           <div style="align-content:center; margin-left:100px; width:1300px" class="form-group"> <br />


             <asp:HiddenField ID="hid" runat="server" ></asp:HiddenField>

 
           <asp:Label ID="idNombreTitular" runat="server" Text="Titular"  style=" font-size: 16px; margin-left:30px; margin-right: 20px" ></asp:Label>
           <asp:TextBox ID="txtNombreTitular" runat="server"  style="width:400px;  margin-left:235px; margin-right:40px" CssClass="form-control" placeholder="ingrese Titular de la Tarjeta"></asp:TextBox> 
          
               <br />
                
           <asp:Label ID="idNumerotarjeta" runat="server" Text="Numero"  style=" font-size: 16px; margin-left:30px; margin-right: 20px" ></asp:Label>
           <asp:TextBox ID="txtNumeroTarjeta" runat="server"  style="width:400px;  margin-left:235px; margin-right:40px" CssClass="form-control" placeholder="ingrese Numero de la Tarjeta"></asp:TextBox> 
            
               <br />
           <asp:Label ID="txtFechaVencimiento" runat="server" Text="Fecha De Vencimiento"  style=" font-size: 16px; margin-left:30px; margin-right: 20px" ></asp:Label>
           <input id="txtFecha" type="date" name="txtfecha"  style="width:400px;  margin-left:235px; margin-right:40px" class="form-control" runat="server"   />
         
                <br />
            <asp:Label ID="Label1" runat="server" Text="Codigo de Seguridad"  style=" font-size: 16px; margin-left:30px; margin-right: 20px" ></asp:Label>
                <asp:TextBox ID="txtcodseguridad" runat="server"  style="width:400px;  margin-left:235px; margin-right:40px" CssClass="form-control" placeholder="ingrese codigo de Seguridad"></asp:TextBox> 
                 <br />
 
              <asp:Label ID="lblTipoTarjeta" runat="server" Text="Tipo Tarjeta" style="margin-left:30px; font-size:16px">Tipo de Tarjeta</asp:Label> 
                <asp:DropDownList runat="server" ID="ddlTipoTarjeta" AutoPostBack="true" CssClass="form-control" style="width:400px; margin-left:230px">  </asp:DropDownList>     

               <br />
               <br />
               <br />
<div style="margin-left:30PX">
           <asp:Button ID="btnAltaTarjeta" runat="server" Text="Alta" OnClick="btnAltaTarjeta_Click" class="btn btn-primary btn-lg" Width="167px" />
           &nbsp;
           <asp:Button ID="BtnModificarTarjeta" runat="server"   Text=" Guardar Cambios " OnClick="BtnModificarTarjeta_Click" class="btn btn-primary btn-lg" Width="178px" />
                &nbsp;
          <asp:Button ID="btnVolverPago" runat="server"   Text=" Volver A Pago " OnClick="btnVolverPago_Click" class="btn btn-primary btn-lg" Width="178px" />
   
    </div>


          <br />
          <br />


         <asp:GridView ID="GVTarjetas" runat="server" AutoGenerateColumns="False" ViewStateMode="Enabled" OnRowCommand="GVTarjetas_RowCommand" OnDataBound="GVTarjetas_DataBound"  cssclass="table table-striped " Width="400px" >
            <Columns>
  
                  <asp:BoundField DataField="IdTarjeta" HeaderText="IdTarjeta" />
                  <asp:BoundField DataField="NombreTitular" HeaderText="Titular" />
                  <asp:BoundField DataField="NumeroTarjeta" HeaderText="Numero" />
                  <asp:BoundField DataField="MiTipoTarjeta.Descripcion" HeaderText="Tipo Tarjeta"  >  
      
                  </asp:BoundField>
  
                  <asp:BoundField DataField="FechaVencimiento" HeaderText="Fecha de Vencimiento"  ></asp:BoundField>
                  <asp:BoundField DataField="CodigoSeguridad" HeaderText="Codigo de Seguridad" />
                  <asp:ButtonField CommandName="btnModificar" Text="Modificar" ButtonType="Button" ControlStyle-ForeColor="White"  ControlStyle-BackColor="Green" />
                  <asp:ButtonField CommandName="btnEliminar" Text="Eliminar" ButtonType="Button " ControlStyle-BackColor="Red"  ControlStyle-ForeColor="White" />
                                
            </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
               
        </asp:GridView>

    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
