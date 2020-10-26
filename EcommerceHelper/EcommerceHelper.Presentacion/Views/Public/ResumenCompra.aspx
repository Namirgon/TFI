<%@ Page Language="C#"  MasterPageFile="~/Shared/PaginaMaestraCliente.Master" AutoEventWireup="true" CodeBehind="ResumenCompra.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Private.MiDireccion" %>
 <%@ MasterType VirtualPath="~/Shared/PaginaMaestraCliente.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link  href="../../Content/EstilosPermisos.css" rel="Stylesheet"/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
 <div>
   <br />
   <br /> 
      <br />
   <br />
      <h3  style="margin-left:30px; margin-top:30px">  Resumen Compra</h3>
   <br />
   <br />     
  
     
<div style="background-image:url('../../Content/Image/banner-curso-degrade.png')">
   
   
    <br />
    <h3  style="margin-left:30px; margin-top:30px; color:aliceblue"> Servicios  /  Pedidos  / Mis Direcciones / Resumen Compra</h3>

     <br />
     <br />
</div>
      
      <br />
     <br />
     <div style="background-color:grey">   
    <br />

  <center>
   
    <asp:GridView ID="GVPedido" runat="server" OnRowCommand="GVPedido_RowCommand" OnRowDataBound="GVPedido_RowDataBound"  AutoGenerateColumns="False" CellPadding="3" Height="263px" Width="878px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnSelectedIndexChanged="GVPedido_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="IdItemOrdenDeTrabajo" HeaderText="IdItem" SortExpression="IdItemOrdenDeTrabajo" >
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="MiServicio.Titulo" HeaderText="Titulo" SortExpression="Titulo" >
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="MiServicio.Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" >
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>      
            <asp:BoundField DataField="MiServicio.URLimagen" HeaderText="Imagen"  >
            </asp:BoundField>
            <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:d}" />
            <asp:BoundField DataField="Hora" HeaderText="Hora" DataFormatString="{0:t}" />
              <asp:BoundField DataField="Precio" HeaderText="Precio" SortExpression="Precio" >
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
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
         <div style="margin-left:920px; font-size:20px ">
         <asp:Label ID="lblTotal" runat="server" Text="Total" ></asp:Label> 
         <asp:TextBox ID="txtTotal" runat="server" style="margin-left:30px; width: 122px;"></asp:TextBox>
       
         </div>
    <br />
    <br />
         
     <center>
    <asp:GridView ID="GVMisDirecciones" runat="server" Width="867px"   cssclass="table table-striped "    OnSelectedIndexChanged="GVMisDirecciones_SelectedIndexChanged"  OnRowCommand="GVMisDirecciones_RowCommand" AutoGenerateColumns="False" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
        <Columns>
          
            <asp:BoundField DataField="IdDireccion" HeaderText="IdDireccion" />
            <asp:BoundField DataField="Calle"  HeaderText=" Calle"/>
            <asp:BoundField DataField="Numero" HeaderText="Numero"/>
            <asp:BoundField DataField="Piso" HeaderText="Piso"/>
            <asp:BoundField DataField="Departamento" HeaderText="Departamento"/>
            <asp:BoundField DataField="MiLocalidad.Descripcion" HeaderText="Localidad"/>
            <asp:BoundField DataField="MiProvincia.Descripcion" HeaderText="Provincia" />
            <asp:BoundField DataField="MiTipoDireccion.Descripcion" HeaderText="Tipo Domicilio" />    
        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" Height="50"  HorizontalAlign="Center" />
                        <EmptyDataTemplate>No se encontraron registros</EmptyDataTemplate>
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>

        </center>
      <br />
    <br />  
    
    
   <asp:Button style="margin-left:500px " ID="Button1" runat="server" Text="Pagar"  Width="150px"  PostBackUrl ="~/Views/Public/Pago.aspx" />
   <asp:Button style="margin-left:100px " ID="Button2" runat="server" Text="Cancelar" Width="150px"  PostBackUrl ="~/Views/Public/Default.aspx" />
   <br />
   <br />
 </div>

    </div>
 </asp:Content>