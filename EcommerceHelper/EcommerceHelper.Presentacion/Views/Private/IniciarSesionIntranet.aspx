<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="IniciarSesionIntranet.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Private.IniciarSesionIntranet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
     <link rel="stylesheet" href="../../Content/css/bootstrap.min.css" />
     <link rel="stylesheet" href="../../Content/css/bootstrap.css" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <br />
   <br />     
   <br />
<div class="mibody" >
   
   <div  >

   <br />     
   <br />
   <h2  style="margin-left:30px">Iniciar Sesion Intranet</h2>
   <br />
   <br />     
   <br />
<div style="background-image:url('../../Content/Image/bannerIntranet.jpg'); width:auto">
   
   <br />
   <br />
   <br />
    <br />
  
       <asp:Label ID="EtiquetaEmail" runat="server" Text="Usuario" visible="true"  style=" margin-left:200px; color:aliceblue">Usuario</asp:Label>
       <asp:TextBox  ID="TXTEmail" runat="server" style="width:400px; margin-left:75px"></asp:TextBox>  
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Ingrese un Email valido" ControlToValidate="TXTEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
   <br />
     <br />
    <asp:Label ID="EtiquetaPassword2" runat="server" Text="Password"  style=" margin-left:200px; color:aliceblue">Password</asp:Label>
    <asp:TextBox ID="TXTPassword" type="Password" runat="server" style="width:400px; margin-left:60px"></asp:TextBox> 
       <asp:Label ID="EtiquetaPassword" runat="server" Text="Label" visible="false" style=" margin-left:50px"></asp:Label>
    
   <br />
  
   <br />

       <asp:Button style="margin-left:250px " ID="BtnAceptar" runat="server" Text="Aceptar"  Width="150px" OnClick="Button1_Click" />
   <asp:Button style="margin-left:100px " ID="Button2" runat="server" Text="Cancelar" Width="150px" PostBackUrl ="~/Views/Public/Default.aspx" />
   <br />
   <br />
   <br />
    </div>
   </div>

</div>
  
</asp:Content>
