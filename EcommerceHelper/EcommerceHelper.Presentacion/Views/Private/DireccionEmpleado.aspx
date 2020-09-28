<%@ Page Language="C#"  MasterPageFile="~/Shared/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="DireccionEmpleado.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Private.DireccionEmpleado" %>
 <%@ MasterType VirtualPath="~/Shared/PaginaMaestraAdministracion.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
     <link rel="stylesheet" href="../../Content/css/bootstrap.min.css" />
     <link rel="stylesheet" href="../../Content/css/bootstrap.css" />


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
   <h2  style="margin-left:30px">Direccion Empleado</h2>
   <br />
   <br />     
   <br />
<div style="border:groove; background-image:url('../../Content/Image/bannerIntranet.jpg'); background-size:cover">
   
   <br />
   <br />
   <br />
   <p style="margin-left:100px; color:white">Calle&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   <input  placeholder="Calle" style="width:400px"></p> 
   <br />
   <p style="margin-left:100px; color:white"> Numero  <input placeholder="Numero" style="width:400px"></p>
   <br />
   <p style="margin-left:100px; color:white"> Piso<input placeholder="Piso" style="width:400px; margin-left:210px"/> </p> 
   <br />
     <p style="margin-left:100px; color:white">Departamento <input  placeholder="Departamento" style="width:400px; margin-left:130px"/></p> 
   <br />
   
    <p style="margin-left:100px; color:white">Localidad <asp:DropDownList runat="server"  style="width:400px; margin-left:165px">
                        <asp:ListItem>Localidad</asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                        
                        </asp:DropDownList></p>
   <br />
  
    <p style="margin-left:100px; color:white">Tipo de Direccion <asp:DropDownList runat="server"  style="width:400px; margin-left:105px">
                        <asp:ListItem>Casa</asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                        
                        </asp:DropDownList></p>
   <br />
  
   <br />
    
   <asp:Button style="margin-left:250px " ID="Button1" runat="server" Text="Continuar"  Width="150px" PostBackUrl ="url('~/Views/Public/Direccion.aspx')"/>
   <asp:Button style="margin-left:100px " ID="Button2" runat="server" Text="Cancelar" Width="150px" />
   <br />
   <br />
   <br />
    </div>
   </div>

</div>
  
</asp:Content>