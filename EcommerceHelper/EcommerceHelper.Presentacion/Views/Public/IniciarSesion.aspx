<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="IniciarSesion.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Public.IniciarSesion" %>
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
   <br />
   <h2  style="margin-left:30px">Iniciar Sesion</h2>
   <br />
   <br />     
   <br />
<div style="background-image:url('../../Content/Image/banner4.jpg') ; width:100%">
   
   <br />
   <br />
   <br />
   <p style="margin-left:100px">Usuario <asp:TextBox  ID="TXTEmail" runat="server" style="width:400px; margin-left:75px"></asp:TextBox>  
       <asp:Label ID="EtiquetaEmail" runat="server" Text="Label" Visible="False" style=" margin-left:50px"></asp:Label>
    </p> 
   <br />
   <p style="margin-left:100px"> Contraseña <asp:TextBox ID="TXTPassword" runat="server" style="width:400px; margin-left:50px"></asp:TextBox> 
       <asp:Label ID="EtiquetaPassword" runat="server" Text="Label" Visible="False" style=" margin-left:50px"></asp:Label>
    </p>
   <br />
  
   <br />
   <asp:Button style="margin-left:200px " ID="BtnAceptar" runat="server" Text="Aceptar"  Width="150px" OnClick="Button1_Click" />
   <asp:Button style="margin-left:100px " ID="BtnCancelar" runat="server" Text="Cancelar" Width="150px"  PostBackUrl ="~/Views/Public/Default.aspx" />
   <br />
   <br />
      <p style="margin-left:100px; "><a style="color:white" href="Registrarme.aspx">Registrarme</a></p>
   <br />
    </div>
   </div>

</div>
  
</asp:Content>
