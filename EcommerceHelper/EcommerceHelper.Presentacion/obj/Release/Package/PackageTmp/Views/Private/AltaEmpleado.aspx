<%@ Page Language="C#"  MasterPageFile="~/Shared/PaginaMaestraAdministracion.Master"  AutoEventWireup="true" CodeBehind="AltaEmpleado.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Private.AltaEmpleado" %>
<%@ MasterType VirtualPath="~/Shared/PaginaMaestraAdministracion.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

   
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
   <h2 ><asp:Label ID="AltaEmpleado2" runat="server" ClientIDMode="Static" style="margin-left:60px;"></asp:Label></h2>
   <br />
   <br />     
   <br />
<div style="border:groove; background-image:url('../../Content/Image/bannerIntranet.jpg'); background-size:cover">
   
   <br />
      <asp:Label ID="lblMensaje" runat="server" Visible="false" Text="Label"  style="color:white; font-size:20px; margin-left:500px" ></asp:Label> <br /><br />
   <br />
    <div style="width:700px">
     <fieldset>
  <legend>  
    <asp:Label ID="EtiquetaEmail" runat="server" ClientIDMode="Static" style="margin-left:180px;color:white; font-size:15px" AssociatedControlID="txtusuario"></asp:Label>
    <asp:TextBox  runat="server" style="width:400px; margin-left:150px" ID="txtusuario" TextMode="Email"></asp:TextBox></legend>
    
    <br />
            <legend>
<asp:Label ID="Password" runat="server" for="txtcontrasena" ClientIDMode="Static" style="margin-left:180px;color:white; font-size:15px" AssociatedControlID="txtcontrasena"></asp:Label>
 <asp:TextBox  ID="txtcontrasena" runat="server" type="Password" style="width:400px; margin-left:150px"></asp:TextBox></legend>
 <asp:RequiredFieldValidator ID="RequiredFieldValidatorF" runat="server" ErrorMessage="Ingrese Contraseña" ControlToValidate="txtcontrasena"  Font-Bold="True"></asp:RequiredFieldValidator>
    
     <br />
  <legend>
 <asp:Label ID="Password2" runat="server" for="txtrepetircontrasena" ClientIDMode="Static" style="margin-left:180px;color:white; font-size:15px" AssociatedControlID="txtrepetircontrasena"></asp:Label>
 <asp:TextBox  ID="txtrepetircontrasena" runat="server" type="Password" style="width:400px; margin-left:150px" CausesValidation="true"></asp:TextBox></legend>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Reingrese la Constraseña" ControlToValidate="txtrepetircontrasena" Font-Bold="True"></asp:RequiredFieldValidator>
       <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Las Contraseñas no son Iguales" ControlToCompare="txtcontrasena" ControlToValidate="txtrepetircontrasena" ValidationGroup="gvcontrasenias"></asp:CompareValidator>
        
  <br />
   <legend>
    <asp:Label ID="Nombre" runat="server" ClientIDMode="Static" style="margin-left:180px;color:white; font-size:15px" AssociatedControlID="txtNombre" >Nombre</asp:Label>
    <asp:TextBox ID="txtNombre" style="width:400px; margin-left:150px" runat="server"></asp:TextBox></legend>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Ingrese el Nombre" ControlToValidate="txtNombre" Font-Bold="True"></asp:RequiredFieldValidator>
    
   <br />
    <legend>
    <asp:Label ID="Apellido" runat="server" ClientIDMode="Static" style="margin-left:180px;color:white; font-size:15px" AssociatedControlID="txtApellido" ></asp:Label>
    <asp:TextBox ID="txtApellido" style="width:400px ; margin-left:150px" runat="server"></asp:TextBox></legend>
   
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtApellido" ErrorMessage="Ingrese Apellido" Font-Bold="True"></asp:RequiredFieldValidator>
   
    <br />
    <legend>
    <asp:Label ID="Sexo" runat="server" ClientIDMode="Static" style="margin-left:180px;color:white; font-size:15px"  AssociatedControlID="ddSexo"> </asp:Label>
    <asp:DropDownList runat="server" ID="ddSexo" AutoPostBack="true" style="width:400px; margin-left:150px" CssClass="dropdownlist"> </asp:DropDownList></legend>
    
   <br />
     <legend>
    <asp:Label ID="DNI" runat="server"  style="margin-left:180px;color:white; font-size:15px" AssociatedControlID="txtDNI" ClientIDMode="Static"></asp:Label> 
    <asp:TextBox ID="txtDNI" style="width:400px; margin-left:150px" runat="server" TextMode="Number"></asp:TextBox></legend>
        
    <br />
    <legend>
    <asp:Label ID="TipoTelefono" runat="server" ClientIDMode="Static" style="margin-left:180px;color:white; font-size:15px" AssociatedControlID="ddTipoTelefono"></asp:Label> 
    <asp:DropDownList runat="server" ID="ddTipoTelefono" AutoPostBack="true" style="width:400px; margin-left:150px" CssClass="dropdownlist">  </asp:DropDownList>  </legend>
                                                                                                                      
   <br />
  <legend>
    <asp:Label ID="Telefono" runat="server" ClientIDMode="Static" style="margin-left:180px;color:white; font-size:15px" AssociatedControlID="txtTelefono"></asp:Label> 
    <asp:TextBox ID="txtTelefono" style="width:400px; margin-left:150px" runat="server" TextMode="Phone"></asp:TextBox></legend>

   <br />
     <legend>
     <asp:Label ID="Calle" runat="server" ClientIDMode="Static" style="margin-left:180px; color:white; font-size:15px" AssociatedControlID="txtCalle">Calle</asp:Label>
    <asp:TextBox ID="txtCalle" runat="server" style="width:400px; margin-left:150px"></asp:TextBox></legend>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Ingrese Calle" Font-Bold="True" ControlToValidate="txtCalle"></asp:RequiredFieldValidator>
    
   <br />
   <legend>
    <asp:Label ID="Numero" runat="server" style="margin-left:180px; color:white; font-size:15px" AssociatedControlID="txtNumero" ClientIDMode="Static"> </asp:Label>
    <asp:TextBox ID="txtNumero" runat="server" style="width:400px; margin-left:150px" TextMode="Number"></asp:TextBox></legend>
     
     <br />
  <legend>
    <asp:Label ID="Piso" runat="server" ClientIDMode="Static" style="margin-left:180px; color:white; font-size:15px" AssociatedControlID="txtPiso"> </asp:Label>
    <asp:TextBox ID="txtPiso" runat="server" style="width:400px; margin-left:150px" TextMode="Number"></asp:TextBox></legend>

     <br />
   <legend>
    <asp:Label ID="Departamento" runat="server" style="margin-left:180px; color:white; font-size:15px;" ClientIDMode="Static"  AssociatedControlID="txtDepartamento"></asp:Label>
    <asp:TextBox ID="txtDepartamento" runat="server" style="width:400px; margin-left:150px"></asp:TextBox></legend>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Ingrese Departamento" ControlToValidate="txtDepartamento" Font-Bold="True"></asp:RequiredFieldValidator>
  
     <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
                    <legend>              
                  <asp:Label ID="Provincia" For="ddProvincia" style="margin-left:180px; color:white; font-size:15px" runat="server" ClientIDMode="Static" AssociatedControlID="ddProvincia"></asp:Label>  
                <asp:DropDownList ID="ddProvincia" runat="server" ClientIDMode="static" CssClass="dropdownlist"   Width="400px" OnSelectedIndexChanged="ddProvincia_SelectedIndexChanged" AutoPostBack="True" style="margin-left:150px">
                  </asp:DropDownList> </legend> 
                  
                  <br />
                  <legend>
                  <asp:Label ID="Localidad" for="ddLocalidad" style="margin-left:180px; color:white; font-size:15px" AssociatedControlID="ddLocalidad" runat="server" Text="Localidad"></asp:Label>
                  <asp:DropDownList ID="ddLocalidad" runat="server" Width="400px" ClientIDMode="static" style="margin-left:150px"  CssClass="dropdownlist">
                  </asp:DropDownList></legend>
                   
         </ContentTemplate>
    </asp:UpdatePanel>
    <br />
  <legend>
    <asp:Label ID="TipoDeDireccion" runat="server" ClientIDMode="Static" style="margin-left:180px;color:white; font-size:15px" AssociatedControlID="DDLTipodeDireccion"></asp:Label> 
    <asp:DropDownList runat="server" ID="DDLTipodeDireccion" AutoPostBack="true" style="width:400px; margin-left:150px" CssClass="dropdownlist">  </asp:DropDownList>   </legend> 
   
     <br />
            </fieldset>
   </div>
 
    <br />
   <br />
   <br />
   <br />

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <asp:Button style="margin-left:50px " ID="Continuar" runat="server" Text="Confirmar"  Width="150px"   OnClick="BtnContinuar_Click"/>
   <asp:Button style="margin-left:50px " ID="Cancelar" runat="server" Text="Cancelar" CausesValidation="false" Width="150px" OnClick="BtnCancelar_Click"  />
        <br />
    <br />
    </div>
    
   <br />
   <br />
  

</div>
  
</asp:Content>

