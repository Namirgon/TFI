<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="RecuperarContrasena.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Public.RecuperarContrasena" %>
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
<asp:Label ID="RecuperarContraseña" runat="server" style="margin-left:30px; font-size:24px" ClientIDMode="Static"></asp:Label>
  
   <br />
   <br />     
   <br />
<div style="background-image:url('../../Content/Image/banner4.jpg') ; width:100%">
   
   <br />
   <br />
   <br />
  
       <asp:Label ID="EtiquetaEmail" runat="server" Text=" Usuario" ClientIDMode="Static" visible="true"  style=" margin-left:100px"></asp:Label>
       <asp:TextBox  ID="TXTEmail" runat="server" style="width:400px; margin-left:75px" TextMode="Email" placeholder="Ingrese mail ejemplo@dominio.com"></asp:TextBox>  
       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Ingrese Email del Usuario" ControlToValidate="TXTEmail"></asp:RequiredFieldValidator>
 
   <br />
   <br />
   <br />
   <br />
   <asp:Button style="margin-left:200px " ID="Aceptar" runat="server" Text=" Aceptar"  CssClass="form-control" ClientIDMode="Static" Width="150px" OnClick="BtnRecuperar_Click" />
   <asp:Button style="margin-left:100px " ID="Cancelar" runat="server" CausesValidation="False"  Text=" Cancelar "   CssClass="form-control" ClientIDMode="Static" Width="150px"   OnClick="BtnCancelar_Click"/>
   <br />
   <br />
   <br />
   
</div>
</div>


</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
