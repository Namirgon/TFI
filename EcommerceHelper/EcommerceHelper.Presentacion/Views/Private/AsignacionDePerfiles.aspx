<%@ Page Language="C#" MasterPageFile="~/Shared/PaginaMaestraAdministracion.Master" AutoEventWireup="true" CodeBehind="AsignacionDePerfiles.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Private.AsignacionDePerfilesaspx" %>
<%@ MasterType VirtualPath="~/Shared/PaginaMaestraAdministracion.Master" %>

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
   <h2  style="margin-left:30px">Asignacion de Perfiles</h2>
   <br />
   <br />     
   <br />
<div style="background-image:url('../../Content/Image/bannerIntranet.jpg'); width:auto">
   
   <br />
   <br />
   <br />
   <p style="margin-left:300px; color:white">Ingrese DNI&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   <input placeholder="Numero de DNI" style="width:350px; margin-left:50px"> &nbsp;&nbsp;<label> muestra nombre del empleado</label></p> 
   <br />
    <p style="margin-left:300px; color:white">Seleccione Perfil  <asp:DropDownList runat="server"  style="width:350px; margin-left:50px">
                        <asp:ListItem>Perfil</asp:ListItem>
                        <asp:ListItem>Ventas</asp:ListItem>
                        <asp:ListItem>RRHH</asp:ListItem>
                        
                        </asp:DropDownList></p>
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
