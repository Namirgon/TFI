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
    <div class="form-group">
    <asp:Label ID="lblUsuario" runat="server" Text="Usuario" style="margin-left:100px;color:white">Usuario</asp:Label>
    <asp:TextBox  runat="server" style="width:400px; margin-left:200px" ID="txtusuario"></asp:TextBox>
   <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Ingrese Email del Usuario" ControlToValidate="txtusuario" Font-Bold="True"></asp:RequiredFieldValidator>
  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Ingrese Email Valido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtusuario"></asp:RegularExpressionValidator>    

        </div>

    <br />
    <div class="form-group">
 <asp:Label ID="lblContrasena" runat="server" for="txtcontrasena" style="margin-left:100px;color:white">Contraseña</asp:Label>
 <asp:TextBox  ID="txtcontrasena" runat="server" style="width:400px; margin-left:180px"></asp:TextBox>
 <asp:RequiredFieldValidator ID="RequiredFieldValidatorF" runat="server" ErrorMessage="Ingrese Contraseña" ControlToValidate="txtcontrasena" Font-Bold="True"></asp:RequiredFieldValidator>
     <br />
     <br />
     </div>

    <div class="form-group">
 <asp:Label ID="lblrcontrasena" runat="server" for="txtrepetircontrasena" style="margin-left:100px;color:white">Reingresar Contraseña</asp:Label>
 <asp:TextBox  ID="txtrepetircontrasena" runat="server"  style="width:400px; margin-left:100px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Reingrese la Constraseña" ControlToValidate="txtrepetircontrasena" Font-Bold="True"></asp:RequiredFieldValidator>
        </div>
     <br />
  
    <asp:Label ID="lblNombre" runat="server" Text="Label"  style="margin-left:100px;color:white" >Nombre</asp:Label>
    <asp:TextBox ID="txtNombre" style="width:400px; margin-left:200px" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Ingrese el Nombre" ControlToValidate="txtNombre" Font-Bold="True"></asp:RequiredFieldValidator>
    
    <br />
   <br />
    <asp:Label ID="lblApellido" runat="server" Text="Label" style="margin-left:100px;color:white"  >Apellido</asp:Label>
    <asp:TextBox ID="txtApellido" style="width:400px ; margin-left:200px" runat="server"></asp:TextBox>
   
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtApellido" ErrorMessage="Ingrese Apellido" Font-Bold="True"></asp:RequiredFieldValidator>
   
   <br />
    <br />
    <asp:Label ID="lblSexo" runat="server" Text="Label" style="margin-left:100px;color:white" > Sexo</asp:Label>
    <asp:DropDownList runat="server" ID="ddSexo" AutoPostBack="true" style="width:400px; margin-left:225px"> </asp:DropDownList>
    <br />
   <br />
    <asp:Label ID="lblDNI" runat="server" Text="Label" style="margin-left:100px;color:white">DNI</asp:Label> 
    <asp:TextBox ID="txtDNI" style="width:400px; margin-left:230px" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Ingrese DNI" ControlToValidate="txtDNI" Font-Bold="True"></asp:RequiredFieldValidator>
   <br />
    <br />
    <asp:Label ID="lblTipoTelefono" runat="server" Text="Label" style="margin-left:100px;color:white">Tipo de Telefono</asp:Label> 
    <asp:DropDownList runat="server" ID="ddTipoTelefono" AutoPostBack="true" style="width:400px; margin-left:140px">  </asp:DropDownList>     
        <br />
                                                                                                                                    
   <br />
    <asp:Label ID="lblTelefono" runat="server" Text="Label" style="margin-left:100px;color:white">Telefono</asp:Label> 
    <asp:TextBox ID="txtTelefono" style="width:400px; margin-left:195px" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Ingrese Numero de Telefono" ControlToValidate="txtTelefono" Font-Bold="True"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Ingrese solo Numeros" ControlToValidate="txtTelefono" Font-Bold="True" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
    <br />
   <br />
  
   <asp:Button style="margin-left:250px " ID="BtnContinuar" runat="server" Text="Continuar"  Width="150px" PostBackUrl ="Direccion.aspx" OnClick="BtnContinuar_Click"/>
   <asp:Button style="margin-left:100px " ID="BtnCancelar" runat="server" Text="Cancelar" Width="150px"   />
   <br />
   <br />

   <br />
    </div>
   </div>

</div>
  
</asp:Content>