<%@ Page Language="C#"  MasterPageFile="~/Shared/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Registrarme.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Public.Registrarme" %>

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
   <h2  style="margin-left:30px">Registrarme</h2>
   <br />
   <br />     
   <br />
<div style="border:groove; background-image:url('../../Content/Image/banner2.jpg'); background-size:cover">
   
   <br />
   <br />
   <br />
   <p style="margin-left:100px;color:white">Usuario&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   <input type="email" placeholder="Correo electronico" style="width:400px"></p> 
   <br />
   <p style="margin-left:100px;color:white"> Contraseña  <input type="password" placeholder="Contraseña" style="width:400px"></p>
   <br />
   <p style="margin-left:100px; color:white"> Reingresar Contraseña&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" placeholder="Reingresar Contraseña" style="width:400px; margin-left:40px"/> </p> 
   <br />
     <p style="margin-left:100px; color:white">Nombre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   <input  placeholder="Nombre" style="width:400px"/></p> 
   <br />
   <p style="margin-left:100px; color:white">Apellido &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input placeholder="Apellido" style="width:400px"></p>
   <br />
    <p style="margin-left:100px;color:white">Sexo <asp:DropDownList runat="server"  style="width:400px; margin-left:225px">
                        <asp:ListItem>Sexo</asp:ListItem>
                        <asp:ListItem>Femenino</asp:ListItem>
                        <asp:ListItem>Masculino</asp:ListItem>
                        
                        </asp:DropDownList></p>
   <br />
    <p style="margin-left:100px; color:white">DNI &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input placeholder="Numero de DNI" style="width:400px"></p>
   <br />
    <p style="margin-left:100px; color:white">Tipo de Telefono <asp:DropDownList runat="server"  style="width:400px; margin-left:140px">
                        <asp:ListItem>Tipo de Telefono</asp:ListItem>
                        <asp:ListItem>Celular</asp:ListItem>
                        <asp:ListItem>Fijo</asp:ListItem>
                        
                        </asp:DropDownList></p>
   <br />
    <p style="margin-left:100px; color:white">Telefono &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input placeholder="Telefono" style="width:400px"></p>
   <br />
  
   <asp:Button style="margin-left:250px " ID="Button1" runat="server" Text="Continuar"  Width="150px" PostBackUrl ="Direccion.aspx"/>
   <asp:Button style="margin-left:100px " ID="Button2" runat="server" Text="Cancelar" Width="150px"  PostBackUrl ="~/Views/Public/Default.aspx"  />
   <br />
   <br />
   <br />
    </div>
   </div>

</div>
  
</asp:Content>