<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="IniciarSesionIntranet.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Private.IniciarSesionIntranet" %>

<%@ MasterType VirtualPath="~/Shared/PaginaMaestra.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <link href="../../Content/EstilosPermisos.css" rel="Stylesheet" />

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
   <br />
   <h2 ><asp:Label ID="IniciarSesion2" runat="server" ClientIDMode="Static"  style=" margin-left:30px; font-size:18px; color:black"></asp:Label></h2>
   <br />
   <br />     
   <br />
<div style="background-image:url('../../Content/Image/bannerIntranet.jpg'); width:auto">
   
   <br />
   <br />
   <br />
    <br />
    <div style="width:700px">
  <fieldset>
      <legend>
      <asp:Label ID="EtiquetaEmail" runat="server" ClientIDMode="Static" visible="true"  style=" margin-left:180px; color:aliceblue"></asp:Label>
       <asp:TextBox  ID="TXTEmail" runat="server" style="width:400px; margin-left:150px"></asp:TextBox>  </legend>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Ingrese un Email valido" ControlToValidate="TXTEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
   <br />
     <br />
      <legend>
    <asp:Label ID="EtiquetaPassword2" runat="server" ClientIDMode="Static"  style=" margin-left:180px; color:aliceblue"></asp:Label>
    <asp:TextBox ID="TXTPassword" type="Password" runat="server" style="width:400px; margin-left:150px"></asp:TextBox> </legend>
       <asp:Label ID="EtiquetaPassword" runat="server" Text="Label" visible="false" style=" margin-left:50px"></asp:Label>
    
   <br />

      </fieldset>

  </div>
   <br />

       <asp:Button style="margin-left:150px " ID="Aceptar" runat="server" ClientIDMode="Static"  Width="150px" OnClick="Button1_Click" />
   <asp:Button style="margin-left:100px " ID="Cancelar" runat="server" ClientIDMode="Static"  Width="150px" PostBackUrl ="~/Views/Public/Default.aspx" />
   <br />
   <br />
   <br />
        
    </div>
   </div>

</div>
  
</asp:Content>
