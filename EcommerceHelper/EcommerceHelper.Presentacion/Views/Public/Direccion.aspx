<%@ Page Language="C#"  MasterPageFile="~/Shared/PaginaMaestraCliente.Master" AutoEventWireup="true" EnableViewState="true" CodeBehind="Direccion.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Public.Direccion" %>
 <%@ MasterType VirtualPath="~/Shared/PaginaMaestraCliente.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 

<link href="../../Content/EstilosPermisos.css" rel="stylesheet" />

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
<asp:Label ID="lblDireccion" runat="server" Text="<%$Resources:Global, Direccion %>" style="margin-left:30px; font-size:16px"></asp:Label>
   
   <br />
   <br />     
   <br />
<div style="border:groove; background-image:url('../../Content/Image/banner2.jpg'); background-size:cover">
   
   <br />
   <br />
   <br />
    <asp:Label ID="lblCalle" runat="server" Text="<%$Resources:Global, Calle %>"  style="margin-left:100px; color:white"></asp:Label>
    <asp:TextBox ID="txtCalle" runat="server" style="width:400px; margin-left:195px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Ingrese Calle" Font-Bold="True" ControlToValidate="txtCalle"></asp:RequiredFieldValidator>
     <br />
   <br />
    <asp:Label ID="lblNumero" runat="server" Text="<%$Resources:Global, Numero %>"  style="margin-left:100px; color:white"> </asp:Label>
    <asp:TextBox ID="txtNumero" runat="server" style="width:400px; margin-left:175px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Ingrese Numero" ControlToValidate="txtNumero" Font-Bold="True"></asp:RequiredFieldValidator>
   <br />
     <br />
    <asp:Label ID="lblPiso" runat="server" Text="<%$Resources:Global, Piso %>" style="margin-left:90px; color:white"> </asp:Label>
    <asp:TextBox ID="txtPiso" runat="server" style="width:400px; margin-left:205px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Ingrese Piso" ControlToValidate="txtPiso" Font-Bold="True"></asp:RequiredFieldValidator>
    <br />
     <br />
    <asp:Label ID="LblDepartamento" runat="server" style="margin-left:100px; color:white" Text="<%$Resources:Global, Departamento %>"></asp:Label>
    <asp:TextBox ID="txtDepartamento" runat="server" style="width:400px; margin-left:130px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Ingrese Departamento" ControlToValidate="txtDepartamento" Font-Bold="True"></asp:RequiredFieldValidator>
    <br /> 
   <%--<asp:ScriptManager runat="server"></asp:ScriptManager>--%>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
                
                  <br /> 
                  <asp:Label ID="lblProvincia" For="ddProvincia" style=" color:white; margin-right:160px; margin-left:100px" runat="server" Text="<%$Resources:Global, Provincia %>">></asp:Label>  
                  <div style="margin-left:320px">     
                  <asp:DropDownList ID="ddProvincia" runat="server" AutoPostBack="True" Width="400px" CssClass="form-control" OnSelectedIndexChanged="ddProvincia_SelectedIndexChanged" >
                  </asp:DropDownList>
                  </div>
                  <br />
                  <br />
            
                  <asp:Label ID="lblLocalidad" for="ddLocalidad" style=" color:white; margin-right:160px; margin-left:100px" runat="server" Text="<%$Resources:Global, Localidad %>">></asp:Label>
                  <div style="margin-left:320px;">     
                  <asp:DropDownList ID="ddLocalidad" runat="server" Width="400px" ClientIDMode="Static" CssClass="form-control">
                  </asp:DropDownList>
                  </div>
                  <br />

            </ContentTemplate>
    </asp:UpdatePanel>
   <br />
    <asp:Label ID="Label2" runat="server" Text="Label" style="margin-left:100px;color:white">Tipo de Direccion</asp:Label> 
    <asp:DropDownList runat="server" ID="DDLTipodeDireccion" AutoPostBack="true" CssClass="form-control" style="width:400px; margin-left:360px">  </asp:DropDownList>     
     <br />
    <br />
    <br />
    <br />  
    <br />
    
   <asp:Button style="margin-left:250px " ID="btnNuevaDireccion" runat="server" Text= "Continuar" OnClick="btnNuevaDireccion_Click"  Width="150px" />
   <asp:Button style="margin-left:100px " ID="Button2" runat="server" Text="Cancelar " Width="150px" PostBackUrl ="url('~/Views/Public/MisDirecciones.aspx')" />
   <br />
   <br />
   <br />
    </div>
   </div>

</div>
  
</asp:Content>