<%@ Page Language="C#"  MasterPageFile="~/Shared/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="ResumenCompra.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Private.MiDireccion" %>

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
   <br />
        <br />
     
<div style="background-image:url('../../Content/Image/banner-curso-degrade.png')">
   
   <br />
    <br />
    <h3  style="margin-left:30px; margin-top:30px; color:aliceblue"> Servicios  /  Pedidos  / Mis Direcciones / Resumen Compra</h3>

     <br />
     <br />
</div>
      <br />
     <br />
      <br />
     <br />
     <div>
     <center>
    <asp:GridView ID="GVMisDirecciones" runat="server" Width="800px"   cssclass="table table-striped "    OnSelectedIndexChanged="GVMisDirecciones_SelectedIndexChanged"  OnRowCommand="GVMisDirecciones_RowCommand" AutoGenerateColumns="False" CellPadding="4" GridLines="None" ForeColor="#333333">
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
                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Height="50"  HorizontalAlign="Center" />
                        <AlternatingRowStyle BackColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <EmptyDataTemplate>No se encontraron registros</EmptyDataTemplate>
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>

        </center>
      <br />
    
    
   <asp:Button style="margin-left:400px " ID="Button1" runat="server" Text="Pagar"  Width="150px"  PostBackUrl ="~/Views/Public/Pago.aspx" />
   <asp:Button style="margin-left:100px " ID="Button2" runat="server" Text="Cancelar" Width="150px"  PostBackUrl ="~/Views/Public/Default.aspx" />
   <br />
   <br />
 </div>

    </div>
 </asp:Content>