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
   <p style="margin-left:300px; color:white">Usuario&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   <input type="email" placeholder="Correo electronico" style="width:400px; margin-left:50px"></p> 
   <br />
   <p style="margin-left:300px;  color:white;"> Contraseña  <input type="password" placeholder="Contraseña" style="width:400px; margin-left:50px"></p>
   <br />
  
   <br />
   <asp:Button style="margin-left:400px " ID="Button1" runat="server" Text="Aceptar"  Width="150px" />
   <asp:Button style="margin-left:100px " ID="Button2" runat="server" Text="Cancelar" Width="150px" PostBackUrl ="~/Views/Public/Default.aspx" />
   <br />
   <br />
   <br />
    </div>
   </div>

</div>
  
</asp:Content>
