<%@ Page Language="C#" MasterPageFile="~/Shared/PaginaMaestraCliente.Master" AutoEventWireup="true" CodeBehind="Pago.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Private.Pago" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    
<%--//<link href="../../Content/EstilosPermisos.css" rel="stylesheet" />--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
 <div>
     <br />
   <br />
   <br />
   <br />     
   <br />
   <h2  style="margin-left:30px">Pago</h2>
   <br />
   <br />     
   
 </div>   
<div  style="background-image:url('../../Content/Image/banner-curso-degrade.png')">
   
    
    <br /> 
    <br />
    <h3  style="margin-left:30px; margin-top:30px; color:black"> Servicios  /  Pedidos  / Mis Direcciones / Resumen Compra / Pago </h3> 
      <br />   
    
     <br />
      <asp:Label ID="lblMensaje" runat="server" Visible="false" Text="Label"  style="color:white; font-size:20px; margin-left:500px" ></asp:Label> <br /><br />
   <br />
   <br />
 </div>
    <br />
    <br /> 
    <br />

    <center>
     <asp:GridView ID="GVTarjetas" runat="server" AutoGenerateColumns="False" ViewStateMode="Enabled" OnRowCommand="GVTarjetas_RowCommand" OnDataBound="GVTarjetas_DataBound"  cssclass="table table-striped " Width="400px" >
            <Columns>
  
                  <asp:BoundField DataField="IdTarjeta" HeaderText="IdTarjeta" />
                  <asp:BoundField DataField="NombreTitular" HeaderText="Titular" />
                  <asp:BoundField DataField="NumeroTarjeta" HeaderText="Numero" />
                  <asp:BoundField DataField="MiTipoTarjeta.Descripcion" HeaderText="Tipo Tarjeta"  >  
      
                  </asp:BoundField>
  
                  <asp:BoundField DataField="FechaVencimiento" HeaderText="Fecha de Vencimiento" DataFormatString="{0:d}"  ></asp:BoundField>
                  <asp:BoundField DataField="CodigoSeguridad" HeaderText="Codigo de Seguridad" />
                  <asp:ButtonField CommandName="btnSeleccionar" Text="Seleccionar" ButtonType="Button" ControlStyle-ForeColor="White"  ControlStyle-BackColor="Green" >
                 
                                
<ControlStyle BackColor="Green" ForeColor="White"></ControlStyle>
                  </asp:ButtonField>
                 
                                
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


        </center>

    <br />
    <br />
    <div style="margin-left:300px">
    <asp:Button ID="btnAMBTarjeta" runat="server" Text="Registrar / Actualizar Tarjeta" OnClick="btnAMBTarjeta_Click"  CssClass="btn btn-primary " Width="244px"/>
        </div>
    <div>



    </div>

</asp:Content>

