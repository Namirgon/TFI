<%@ Page Language="C#"  MasterPageFile="~/Shared/PaginaMaestraCliente.Master" AutoEventWireup="true" EnableViewState="true" CodeBehind="Direccion.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Public.Direccion" %>
 <%@ MasterType VirtualPath="~/Shared/PaginaMaestraCliente.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 

<link href="../../Content/EstilosPermisos.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <br />
   <br />     
   <br />
<div class="mibody2" >
   
   <div  >
   <br />
   <br />     
   <br />
<asp:Label ID="Direccion2" runat="server"   ClientIDMode="Static" style="margin-left:30px; font-size:22px"></asp:Label>
   
   <br />
   <br />     
   <br />
<div style="border:groove; background-image:url('../../Content/Image/banner2.jpg'); background-size:cover">
   
   <br />
   <br />
   <br />
 <div style="width:700px">
    <fieldset>
  <legend>
    <asp:Label ID="Calle" runat="server"  ClientIDMode="Static"  style="margin-left:180px; color:white"></asp:Label>
    <asp:TextBox ID="txtCalle" runat="server" style="width:400px; margin-left:150px"></asp:TextBox></legend>

   <br />
 <legend>    
   <asp:Label ID="Numero" runat="server" ClientIDMode="Static"  style="margin-left:180px; color:white"> </asp:Label>
    <asp:TextBox ID="txtNumero" runat="server" style="width:400px; margin-left:150px" TextMode="Number"></asp:TextBox></legend>

  
     <br />
        <legend>
    <asp:Label ID="Piso" runat="server"  ClientIDMode="Static" style="margin-left:180px; color:white"> </asp:Label>
    <asp:TextBox ID="txtPiso" runat="server" style="width:400px; margin-left:150px" TextMode="Number"></asp:TextBox></legend>

     <br />
        <legend>
    <asp:Label ID="Departamento" runat="server" style="margin-left:180px; color:white"  ClientIDMode="Static"></asp:Label>
    <asp:TextBox ID="txtDepartamento" runat="server" style="width:400px; margin-left:150px"></asp:TextBox></legend>
   <br /> 
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
                
                 <legend>
                  <asp:Label ID="Provincia" For="ddProvincia" style=" color:white; margin-right:160px; margin-left:180px" runat="server"  ClientIDMode="Static"></asp:Label>  
                   
                  <asp:DropDownList ID="ddProvincia" runat="server" AutoPostBack="True" Width="400px" CssClass="dropdownlist" style="margin-left:150px" OnSelectedIndexChanged="ddProvincia_SelectedIndexChanged" >
                  </asp:DropDownList></legend>
                  
                
                  <br />
            <legend>
                <asp:Label ID="Localidad" for="ddLocalidad" style=" color:white; margin-right:160px; margin-left:180px" runat="server" ClientIDMode="Static"></asp:Label>
                     
                  <asp:DropDownList ID="ddLocalidad" runat="server" Width="400px" ClientIDMode="Static" CssClass="dropdownlist" style="margin-left:150px">
                  </asp:DropDownList></legend>

            
               

            </ContentTemplate>
    </asp:UpdatePanel>
   <br />
        <legend>
    <asp:Label ID="TipoDeDireccion" runat="server"  style="margin-left:180px;color:white"></asp:Label> 
    <asp:DropDownList runat="server" ID="DDLTipodeDireccion" AutoPostBack="true" CssClass="dropdownlist" style="width:400px; margin-left:150px">  </asp:DropDownList>  </legend>   
   
    <br />
    <br />  
    <br />
    </fieldset>
     </div>
   <asp:Button style="margin-left:250px " ID="Aceptar" runat="server"  OnClick="btnNuevaDireccion_Click"  Width="150px" />
   <asp:Button style="margin-left:100px " ID="Cancelar" runat="server"  Width="150px" OnClick="Button2_Click"  />
   <br />
   <br />
   <br />
    </div>
   </div>

</div>
  
</asp:Content>