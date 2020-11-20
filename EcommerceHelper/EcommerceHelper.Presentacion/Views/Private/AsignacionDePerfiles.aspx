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
    <div runat="server"  style="width:1000px; margin-left:100px">
        <br />
   <br />
    <br />  
   <br />
   <div class="form-group row" >
   <asp:label runat="server" Text="Seleccione Empleado" style="margin-left:100px; color:white ; font-size:15px; " AssociatedControlID="ddlEmpleado" > </asp:label> 
    <asp:DropDownList ID="ddlEmpleado" runat="server" AutoPostBack="true"  style="width:400px; margin-left:80px"  CssClass="form-control"></asp:DropDownList>
   <asp:DropDownList runat="server" ID="DDLIDEmpleado" AutoPostBack="true" visible="false"  style="width:400px; margin-left:120px">  </asp:DropDownList>     

   </div>
   <br />
  
   <br />
    <div class="form-group row" >
    <asp:label runat="server" Text="Seleccione Perfil" style="margin-left:100px; color:white ; font-size:15px" AssociatedControlID="ddlFamilia"> </asp:label>  
    <asp:DropDownList ID="ddlFamilia" runat="server" AutoPostBack="true"  style="width:400px; margin-left:110px"  CssClass="form-control"></asp:DropDownList>
   </div>
   <br />
   <br />
    <br />  
   <br />
      
    <br />  
   <br />
  <br />
            <div class="btn-group"  >
    <asp:Button ID="BtnAceptar" runat="server" Text="Aceptar" Width="150px" style="margin-left:300px" CssClass="form-control" OnClick="BtnAceptar_Click1"  /> 
    <asp:Button ID="BtnCancelar" runat="server" Text="Cancelar" Width="150px" style="margin-left:100px" CssClass="form-control" OnClick="BtnCancelar_Click1" />
                 </div>
  <br />  
   <br />
  <br />
           
   <br />
        <br />  
   <br />
  <br />
        </div>
   <br />
    </div>
   </div>

</div>
  
</asp:Content>
