<%@ Page Language="C#" MasterPageFile="~/Shared/PaginaMaestraAdministracion.Master" AutoEventWireup="true" CodeBehind="AsignacionDePerfiles.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Private.AsignacionDePerfilesaspx" %>


<%@ MasterType VirtualPath="~/Shared/PaginaMaestraAdministracion.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <%-- 
     <link rel="stylesheet" href="../../Content/css/bootstrap.min.css" />
     <link rel="stylesheet" href="../../Content/css/bootstrap.css" />--%>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <br />
   <br />     
   <br />
<div class="mibody" >
   
   <div  >

   <br />     
   <br />
  
   <h2 ><asp:Label ID="AsignacionDePerfiles2" runat="server" ClientIDMode="Static" style="margin-left:60px;"></asp:Label></h2>
   <br />
   <br />     
   <br />
<div style="background-image:url('../../Content/Image/bannerIntranet.jpg'); width:auto">
   
   <br />
   <br />
   <br />
    <div runat="server"  style="width:700px; margin-left:100px">
        <br />
   <br />
    <br />  
   <br /><fieldset>

        
   <legend>
   <asp:label runat="server" ID="SeleccioneEmpleado" style="margin-left:180px; color:white ; font-size:15px; " AssociatedControlID="ddlEmpleado" ClientIDMode="Static" > </asp:label> 
    <asp:DropDownList ID="ddlEmpleado" runat="server" AutoPostBack="true"  style="width:400px; margin-left:150px"  CssClass="form-control"></asp:DropDownList>
   <asp:DropDownList runat="server" ID="DDLIDEmpleado" AutoPostBack="true" visible="false"  style="width:400px; margin-left:120px">  </asp:DropDownList>  </legend>   


  
   <br />
    <legend>
    <asp:label runat="server" ID="SeleccionePerfil" style="margin-left:180px; color:white ; font-size:15px" AssociatedControlID="ddlFamilia" ClientIDMode="Static"> </asp:label>  
    <asp:DropDownList ID="ddlFamilia" runat="server" AutoPostBack="true"  style="width:400px; margin-left:150px"  CssClass="form-control"></asp:DropDownList>
</legend>
   <br />
   <br />
    <br />  
   <br />
       </fieldset>
    <br />  
   <br />
  <br />
            <div class="btn-group"  >
    <asp:Button ID="Aceptar" runat="server" Width="150px" style="margin-left:150px" CssClass="form-control" OnClick="BtnAceptar_Click1" ClientIDMode="Static"  /> 
    <asp:Button ID="Cancelar" runat="server" Width="150px" style="margin-left:100px" CssClass="form-control" OnClick="BtnCancelar_Click1" ClientIDMode="Static" />
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
