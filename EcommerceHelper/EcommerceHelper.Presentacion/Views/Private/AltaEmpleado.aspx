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
   <h2  style="margin-left:30px">Alta Empleado</h2>
   <br />
   <br />     
   <br />
<div style="border:groove; background-image:url('../../Content/Image/bannerIntranet.jpg'); background-size:cover">
   
   <br />
   <br />
    <div class="form-group">
    <asp:Label ID="lblUsuario" runat="server" Text="Usuario" style="margin-left:100px;color:white; font-size:15px" AssociatedControlID="txtusuario">Usuario</asp:Label>
    <asp:TextBox  runat="server" style="width:400px; margin-left:200px" ID="txtusuario" TextMode="Email"></asp:TextBox>
    </div>
    <br />
    <br />
    <div class="form-group">
 <asp:Label ID="lblContrasena" runat="server" for="txtcontrasena" style="margin-left:100px;color:white; font-size:15px" AssociatedControlID="txtcontrasena">Contraseña</asp:Label>
 <asp:TextBox  ID="txtcontrasena" runat="server" type="Password" style="width:400px; margin-left:181px"></asp:TextBox>
 <asp:RequiredFieldValidator ID="RequiredFieldValidatorF" runat="server" ErrorMessage="Ingrese Contraseña" ControlToValidate="txtcontrasena" Font-Bold="True"></asp:RequiredFieldValidator>
     </div>
     <br />
     <br />
    <div class="form-group">
 <asp:Label ID="lblrcontrasena" runat="server" for="txtrepetircontrasena" style="margin-left:102px;color:white; font-size:15px" AssociatedControlID="txtrepetircontrasena">Reingresar Contraseña</asp:Label>
 <asp:TextBox  ID="txtrepetircontrasena" runat="server" type="Password" style="width:400px; margin-left:109px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Reingrese la Constraseña" ControlToValidate="txtrepetircontrasena" Font-Bold="True"></asp:RequiredFieldValidator>
        </div>
     <br />
  <br />
    <div class="form-group">
    <asp:Label ID="lblNombre" runat="server" Text="Label"  style="margin-left:100px;color:white; font-size:15px" AssociatedControlID="txtNombre" >Nombre</asp:Label>
    <asp:TextBox ID="txtNombre" style="width:400px; margin-left:198px" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Ingrese el Nombre" ControlToValidate="txtNombre" Font-Bold="True"></asp:RequiredFieldValidator>
    </div>
    <br />
   <br />
     <div class="form-group">
    <asp:Label ID="lblApellido" runat="server" Text="Label" style="margin-left:100px;color:white; font-size:15px" AssociatedControlID="txtApellido" >Apellido</asp:Label>
    <asp:TextBox ID="txtApellido" style="width:400px ; margin-left:194px" runat="server"></asp:TextBox>
   
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtApellido" ErrorMessage="Ingrese Apellido" Font-Bold="True"></asp:RequiredFieldValidator>
   </div>
   <br />
    <br />
     <div class="form-group">
    <asp:Label ID="lblSexo" runat="server" Text="Genero" style="margin-left:100px;color:white; font-size:15px"  AssociatedControlID="ddSexo"> Genero</asp:Label>
    <asp:DropDownList runat="server" ID="ddSexo" AutoPostBack="true" style="width:400px; margin-left:202px" CssClass="dropdownlist"> </asp:DropDownList>
         </div>
    <br />
   <br />
     <div class="form-group">
    <asp:Label ID="lblDNI" runat="server" Text="Label" style="margin-left:100px;color:white; font-size:15px" AssociatedControlID="txtDNI">DNI</asp:Label> 
    <asp:TextBox ID="txtDNI" style="width:400px; margin-left:218px" runat="server" TextMode="Number"></asp:TextBox>
         </div>
   <br />
    <br />
     <div class="form-group">
    <asp:Label ID="lblTipoTelefono" runat="server" Text="Label" style="margin-left:100px;color:white; font-size:15px" AssociatedControlID="ddTipoTelefono">Tipo de Telefono</asp:Label> 
    <asp:DropDownList runat="server" ID="ddTipoTelefono" AutoPostBack="true" style="width:400px; margin-left:144px" CssClass="dropdownlist">  </asp:DropDownList>  
         </div>
        <br />
                                                                                                                                    
   <br />
     <div class="form-group row">
    <asp:Label ID="lblTelefono" runat="server" Text="Label" style="margin-left:100px;color:white; font-size:15px" AssociatedControlID="txtTelefono">Telefono</asp:Label> 
    <asp:TextBox ID="txtTelefono" style="width:400px; margin-left:205px" runat="server" TextMode="Phone"></asp:TextBox>
         </div>
      <br />
   <br />
     <div class="form-group row">
     <asp:Label ID="lblCalle" runat="server" Text="Calle" style="margin-left:100px; color:white; font-size:15px" AssociatedControlID="txtCalle">Calle</asp:Label>
    <asp:TextBox ID="txtCalle" runat="server" style="width:400px; margin-left:220px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Ingrese Calle" Font-Bold="True" ControlToValidate="txtCalle"></asp:RequiredFieldValidator>
     </div>
         <br />
   <br />
     <div class="form-group row">
    <asp:Label ID="lblNumero" runat="server" Text="Label"  style="margin-left:100px; color:white; font-size:15px" AssociatedControlID="txtNumero"> Numero</asp:Label>
    <asp:TextBox ID="txtNumero" runat="server" style="width:400px; margin-left:199px" TextMode="Number"></asp:TextBox>
         </div>
   <br />
     <br />
     <div class="form-group row">
    <asp:Label ID="lblPiso" runat="server" Text="Label" style="margin-left:100px; color:white; font-size:15px" AssociatedControlID="txtPiso"> Piso</asp:Label>
    <asp:TextBox ID="txtPiso" runat="server" style="width:400px; margin-left:223px" TextMode="Number"></asp:TextBox>
</div>
    <br />
     <br />
     <div class="form-group row">
    <asp:Label ID="LblDepartamento" runat="server" style="margin-left:100px; color:white; font-size:15px" Text="Label" AssociatedControlID="txtDepartamento">Departamento</asp:Label>
    <asp:TextBox ID="txtDepartamento" runat="server" style="width:400px; margin-left:144px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Ingrese Departamento" ControlToValidate="txtDepartamento" Font-Bold="True"></asp:RequiredFieldValidator>
   </div>
     <br /> 
     <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
             <br /> 
 <br /> 

                    <div class="form-group row">
                 
                  <asp:Label ID="lblProvincia" For="ddProvincia" style="margin-left:100px; color:white; font-size:15px" runat="server" Text="Provincia" AssociatedControlID="ddProvincia"></asp:Label>  
                <asp:DropDownList ID="ddProvincia" runat="server" ClientIDMode="static" CssClass="dropdownlist"   Width="400px" OnSelectedIndexChanged="ddProvincia_SelectedIndexChanged" AutoPostBack="True" style="margin-left:192px">
                  </asp:DropDownList> 
<br /> 
                  <br />
                    </div>
                  <br /> 
                  <br />
             <div class="form-group row">
                  <asp:Label ID="lblLocalidad" for="ddLocalidad" style="margin-left:100px; color:white; font-size:15px" AssociatedControlID="ddLocalidad" runat="server" Text="Localidad"></asp:Label>
                  <asp:DropDownList ID="ddLocalidad" runat="server" Width="400px" ClientIDMode="static" style="margin-left:190px"  CssClass="dropdownlist">
                  </asp:DropDownList>
                 <br />
    <br />
                 </div>
             <br />
             <br /> 

         </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <br />
     <div class="form-group row">
    <asp:Label ID="Label2" runat="server" Text="Label" style="margin-left:100px;color:white; font-size:15px" AssociatedControlID="DDLTipodeDireccion">Tipo de Direccion</asp:Label> 
    <asp:DropDownList runat="server" ID="DDLTipodeDireccion" AutoPostBack="true" style="width:400px; margin-left:140px" CssClass="dropdownlist">  </asp:DropDownList>    
    </div>
    
    <br />
     <br />
    <div class="btn-group">
   <asp:Button style="margin-left:50px " ID="BtnContinuar" runat="server" Text="Confirmar"  Width="150px"  OnClick="BtnContinuar_Click"/>
   <asp:Button style="margin-left:50px " ID="BtnCancelar" runat="server" Text="Cancelar" Width="150px" OnClick="BtnCancelar_Click"  />
        </div>
 <br />
        <br />
    <br />
    <br />
    <br />
    <br />
   <br />
   <br />
   <br />

   <br />
   <br />
   <br />
   <br />
    </div>
   <br />
   <br />
   </div>

</div>
  
</asp:Content>

