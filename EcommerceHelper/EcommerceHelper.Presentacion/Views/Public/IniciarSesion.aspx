<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="IniciarSesion.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Public.IniciarSesion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <%-- 
     <link rel="stylesheet" href="../../Content/css/bootstrap.min.css" />
     <link rel="stylesheet" href="../../Content/css/bootstrap.css" />
--%>

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
<asp:Label ID="lblIniciarSesion" runat="server" style="margin-left:30px; font-size:24px" Text="<%$Resources:Global, IniciarSesion %>"></asp:Label>
  
   <br />
   <br />     
   <br />
<div style="background-image:url('../../Content/Image/banner4.jpg') ; width:100%">
   
   <br />
   <br />
   <br />
  
       <asp:Label ID="EtiquetaEmail" runat="server" Text="<%$Resources:Global, Usuario %>" visible="true"  style=" margin-left:100px"></asp:Label>
       <asp:TextBox  ID="TXTEmail" runat="server" style="width:400px; margin-left:75px"></asp:TextBox>  
       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Ingrese Email del Usuario" ControlToValidate="TXTEmail"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Ingrese un Email valido" ControlToValidate="TXTEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
 
   <br />
     <br />
    <asp:Label ID="EtiquetaPassword2" runat="server" Text="<%$Resources:Global, Password %>" style=" margin-left:100px"></asp:Label>
    <asp:TextBox ID="TXTPassword" type="Password" runat="server" style="width:400px; margin-left:60px"></asp:TextBox> 
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Ingrese Clave" ControlToValidate="TXTPassword"></asp:RequiredFieldValidator>
    
   <br />
  
   <br />
   <asp:Button style="margin-left:200px " ID="BtnAceptar" runat="server" Text="<%$Resources:Global, Aceptar %>"  Width="150px" OnClick="Button1_Click" />
   <asp:Button style="margin-left:100px " ID="BtnCancelar" runat="server" Text="<%$Resources:Global, Cancelar %>" Width="150px" OnClick="BtnCancelar_Click" />
   <br />
   <br />
   

     
   <br />
    </div>


        <asp:LinkButton ID="registrarme" runat="server" style="margin-left:100px; font-size:18px " Text="<%$Resources:Global, Registrarme %> " OnClick="lblRegistrarme_Click"></asp:LinkButton>
   </div>

</div>
  
</asp:Content>
