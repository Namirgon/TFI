<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="IniciarSesion.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Public.IniciarSesion" %>


<%@ MasterType VirtualPath="~/Shared/PaginaMaestra.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Content/EstilosPermisos.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
   <br />
   <br />     
   <br />
<div class="mibody" >
   
   <div  >
   <br />
   <br />     
   <br />
<asp:Label ID="IniciarSesion2" ClientIDMode="Static"  runat="server" style="margin-left:30px; font-size:24px" ></asp:Label>
  
   <br />
   <br />     
   <br />
<div style="background-image:url('../../Content/Image/banner4.jpg') ; width:100%; height:400px">
   
   <br />
   <br />
   <br />
    <div style="width:700px">
    <fieldset>
  <legend>
       <asp:Label ID="EtiquetaEmail" runat="server"  visible="true" ClientIDMode="Static"  style=" margin-left:180px"></asp:Label> 
       <asp:TextBox  ID="TXTEmail" runat="server" style="width:400px; margin-left:160px"></asp:TextBox>  </legend>
       <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Ingrese un Email valido" ControlToValidate="TXTEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

  <br />
  <br />
         <legend>
    <asp:Label ID="EtiquetaPassword2" runat="server" Text="Password " ClientIDMode="Static"  style=" margin-left:180px"></asp:Label>
    <asp:TextBox ID="TXTPassword" type="Password" runat="server" style="width:400px; margin-left:160px"></asp:TextBox> </legend>
    
   <br />
  </fieldset>
   <br />
   <asp:Button style="margin-left:180px " ID="Aceptar" runat="server"  ClientIDMode="Static" Text=" Aceptar"  Width="150px" OnClick="Button1_Click" />
   <asp:Button style="margin-left:100px " ID="Cancelar" runat="server" ClientIDMode="Static"  Text=" Cancelar" Width="150px" OnClick="BtnCancelar_Click" />
   <br />
   <br />
   </div>

     
   <br />
   
</div>
</div>

    <div>
        <asp:LinkButton ID="Registrarme"  runat="server" style="margin-left:100px; font-size:18px " ClientIDMode="Static"   OnClick="lblRegistrarme_Click"></asp:LinkButton>
   </div>
     <div>
        <asp:LinkButton ID="RecuperarContraseña"  runat="server" style="margin-left:100px; font-size:18px "  ClientIDMode="Static"  OnClick="recuperarContrasena_Click"></asp:LinkButton>
   </div>
  </div>
</asp:Content>
