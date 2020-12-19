<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/PaginaMaestraAdministracion.Master" AutoEventWireup="true" CodeBehind="GestorServicios.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Private.GestorServicios" %>
<%@ MasterType VirtualPath="~/Shared/PaginaMaestraAdministracion.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <link rel="Stylesheet"   href="../../Content/EstilosPermisos.css"/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="mibody2" >
       <br />     
      <br />
      <br />     
     <br />     
      <br />
      <br /> 

     <h2 style="margin-left:60px" > <asp:Label ID="GestionDeServicios" runat="server" ClientIDMode="Static" > </asp:Label>
                </h2>
     
     <br />
     <br />     
     <br />
<div style="background-image:url('../../Content/Image/bannerIntranet.jpg'); width:100%; ">
   
   <br />
   <br />
   <br />

    <h3 style="margin-left:60px; color:aliceblue" > <asp:Label ID="AltaServicios"  runat="server" ClientIDMode="Static" > </asp:Label>
                </h3>
     
    <br />
 <div style="align-content:center; margin-left:100px; width:700px"> <br />
      <asp:HiddenField ID="hidServicio" runat="server"  Value="0"></asp:HiddenField>
     <br />
     <fieldset>
   <legend>
    <asp:Label ID="Titulo" runat="server" style="margin-left:180px;color:white; font-size:15px" ClientIDMode="Static" > </asp:Label>   
    <asp:TextBox ID="txtTitulo" style="width:400px; margin-left:150px" runat="server"></asp:TextBox></legend>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtTitulo" Font-Bold="True"></asp:RequiredFieldValidator>
    
    <br />
 <legend>
    <asp:Label ID="Descripcion" runat="server" ClientIDMode="Static" style="margin-left:180px;color:white; font-size:15px" > </asp:Label>   
    <asp:TextBox ID="txtDescripcion" style="width:400px; margin-left:150px" runat="server"></asp:TextBox></legend>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtDescripcion" Font-Bold="True"></asp:RequiredFieldValidator>
    
    <br />
     <legend>
    <asp:Label ID="Precio" runat="server" ClientIDMode="Static" style="margin-left:180px;color:white; font-size:15px"  ></asp:Label>
    <asp:TextBox ID="txtPrecio" style="width:400px ; margin-left:150px" runat="server" ValidationExpression = "^\d+?$" ></asp:TextBox>  </legend>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Type="integer" runat="server"  ControlToValidate="txtPrecio" ErrorMessage="*" Font-Bold="True"></asp:RequiredFieldValidator>   
    
    <br />
    <div class="form-group">
                    <div class="form-group">
                        <asp:Label ID="Imagen" runat="server" ClientIDMode="Static" style="margin-left:180px;color:white; font-size:15px" > </asp:Label>  
                        <label id="urlErrorMessage" style="color: coral; font-weight: 100;" hidden="hidden">Soporte solo para imagenes: jpeg,jpg,png,gif</label>
                       
                        <asp:FileUpload ID="urlServicio" runat="server" ClientIDMode="static" style="margin-left:150px" onchange="showimagepreview(this)" />
                        <br />
                        <img id="uploadFile" style="max-width: 50%; max-height: 50%;" src="#" alt="" />
                    </div>  
    </div>  <br />
     <br />
     <br />
      </fieldset>

     <br />
     <br />
     <br />
     <br />
   <br />
     <br />
     <div style="margin-left:100px" class="btn-group">

       <asp:Button ID="Aceptar" runat="server" ClientIDMode="Static" CssClass="btn btn-primary " OnClick="btnNuevo_Click" Width="162px" />
      <asp:Button ID="Modificar" runat="server" ClientIDMode="Static" CssClass="btn btn-primary " Width="162px"  OnClick="BtnModificar_Click"/>
     </div>
      <br />
     <br />
     <br />
     <br />
</div>
    <center>

     <asp:GridView ID="GrillaServicios" runat="server" Width="1000px" OnRowCommand ="GrillaServicios_RowCommand" AutoGenerateColumns="False" OnDataBound="GrillaServicios_DataBound" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDataBound="GrillaServicios_RowDataBound">
         <AlternatingRowStyle BackColor="White" />
         <Columns>
             <asp:BoundField DataField="IdServicio" HeaderText="IdServicio" SortExpression="IdServicio" />
               <asp:BoundField DataField="Titulo" HeaderText="Título" SortExpression="Titulo" />
             <asp:BoundField DataField="Descripcion" HeaderText="Descripción" SortExpression="Descripción" />
             <asp:BoundField DataField="Precio" HeaderText="Precio" SortExpression="Precio" />
             <asp:BoundField DataField="URLimagen" HeaderText="URLimagen" SortExpression="URLimagen" />
             <asp:ButtonField CommandName="btnModificar" Text="Modificar" ButtonType="Button" ControlStyle-ForeColor="White"  ControlStyle-BackColor="Green"  />
             <asp:ButtonField CommandName="btnEliminar" Text="Eliminar" ButtonType="Button" ControlStyle-ForeColor="White"  ControlStyle-BackColor="Red"  />
         </Columns>
         <EditRowStyle BackColor="#2461BF" />
         <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
         <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
         <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
         <RowStyle BackColor="#EFF3FB" />
         <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
         <SortedAscendingCellStyle BackColor="#F5F7FB" />
         <SortedAscendingHeaderStyle BackColor="#6D95E1" />
         <SortedDescendingCellStyle BackColor="#E9EBEF" />
         <SortedDescendingHeaderStyle BackColor="#4870BE" />
     </asp:GridView>
        </center>
     <br />
      <br />
      <br />
</div>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
