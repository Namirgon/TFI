<%@ Page Language="C#"  MasterPageFile="~/Shared/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Registrarme.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Public.Registrarme" %>
<%@ MasterType VirtualPath="~/Shared/PaginaMaestra.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <link rel="stylesheet" href="../../Content/EstilosPermisos.css"  />
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
   <h2 > <asp:Label ID="Registrarme2" runat="server" style="margin-left:60px;" ClientIDMode="Static"></asp:Label></h2>
   <br />
   <br />     
   <br />
<div style="border:groove; background-image:url('../../Content/Image/banner2.jpg'); background-size:cover">
   
   <br />
   <br />
          <asp:Label ID="lblMensaje" runat="server" Visible="false" Text="Label"  style="color:white; font-size:20px; margin-left:500px" ></asp:Label> <br /><br />
   <br />
   <br />
    <div style="width:700px">
     <fieldset>
  <legend>           
    <asp:Label ID="Usuario" runat="server" Text="Usuario" style="margin-left:180px;color:white" ClientIDMode="Static"></asp:Label>
    <asp:TextBox  runat="server" style=" margin-left:150px;  width:400px" ID="txtusuario" TextMode="Email"  placeholder="Ingrese Correo Electronico"></asp:TextBox>  </legend>
  <br />
    <legend>
 <asp:Label ID="Password" runat="server" for="txtcontrasena" style="margin-left:180px;color:white">Contraseña</asp:Label>
 <asp:TextBox  ID="txtcontrasena" runat="server" type="Password" style= "margin-left:150px; width:400px" placeholder="Ingrese Contraseña" ClientIDMode="Static" ></asp:TextBox></legend>
 <asp:RequiredFieldValidator ID="RequiredFieldValidatorF" runat="server" ErrorMessage="  *  " ControlToValidate="txtcontrasena" Font-Bold="True"></asp:RequiredFieldValidator>

  <br />
<legend>
   <asp:Label ID="Password2" runat="server" ClientIDMode="Static"  for="txtrepetircontrasena" style="margin-left:180px;color:white"></asp:Label>
 <asp:TextBox  ID="txtrepetircontrasena" runat="server" type="Password" style=" margin-left:150px; width:400px" placeholder="Reingrese Contraseña" ></asp:TextBox> </legend>
<asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="CompareValidator" ControlToValidate="txtrepetircontrasena" ControlToCompare="txtcontrasena" text="Las contraseñas deben ser iguales" ></asp:CompareValidator>
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="  *  " ControlToValidate="txtrepetircontrasena" Font-Bold="True"></asp:RequiredFieldValidator>
 <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Las Contraseñas no son Iguales" ControlToCompare="txtcontrasena" ControlToValidate="txtrepetircontrasena" ValidationGroup="gvcontrasenias"></asp:CompareValidator>

  <br />

         <legend>
    <asp:Label ID="Nombre" runat="server" Text="Label" ClientIDMode="Static"   style="margin-left:180px; color:white" ></asp:Label>
    <asp:TextBox ID="txtNombre" style="margin-left:150px; width:400px" runat="server" placeholder="Ingrese Nombre"></asp:TextBox></legend>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="  *  " ControlToValidate="txtNombre" Font-Bold="True"></asp:RequiredFieldValidator>
 <br />
   <legend> <asp:Label ID="Apellido" runat="server" Text="Label" style="margin-left:180px;color:white" ClientIDMode="Static"   ></asp:Label>
    <asp:TextBox ID="txtApellido" style=" margin-left:150px; width:400px" runat="server" placeholder="Ingrese Apellido" ></asp:TextBox>     </legend>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtApellido" ErrorMessage="  *  " Font-Bold="True"></asp:RequiredFieldValidator>


         <br />
     <legend>
    <asp:Label ID="Sexo" runat="server" Text="Label" style="margin-left:180px;color:white" ClientIDMode="Static"  > </asp:Label>
    <asp:DropDownList runat="server" ID="ddSexo" AutoPostBack="true" style="width:400px; margin-left:150px" CssClass="dropdownlist" > </asp:DropDownList></legend>
  <br />

  
      <legend>
    <asp:Label ID="DNI" runat="server" Text="Label" style="margin-left:180px;color:white" ClientIDMode="Static" ></asp:Label> 
    <asp:TextBox ID="txtDNI" style="width:400px; margin-left:150px; width:400px" runat="server" placeholder="Ingrese DNI " TextMode="Number"></asp:TextBox> </legend>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="  *  " ControlToValidate="txtDNI" Font-Bold="True"></asp:RequiredFieldValidator>
   <br />

  
     <legend>
    <asp:Label ID="TipoTelefono" runat="server"  style="margin-left:180px;color:white"  ClientIDMode="Static"></asp:Label> 
    <asp:DropDownList runat="server" ID="ddTipoTelefono"  AutoPostBack="true" style="width:400px; margin-left:150px" CssClass="dropdownlist" >  </asp:DropDownList>      </legend>
 <br />

  
      <legend>
    <asp:Label ID="Telefono" runat="server" Text="Label" style="margin-left:180px;color:white" ClientIDMode="Static">Telefono</asp:Label> 
    <asp:TextBox ID="txtTelefono" style="width:400px; margin-left:150px" runat="server" OnTextChanged="txtTelefono_TextChanged" TextMode="Phone" placeholder="Ingrese Telefono"></asp:TextBox></legend>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="  *  " ControlToValidate="txtTelefono" Font-Bold="True"></asp:RequiredFieldValidator>
  
    <br />
  
      <legend>
     <asp:Label ID="Calle" runat="server" Text="Calle" style="margin-left:180px; color:white" ClientIDMode="Static"></asp:Label>
    <asp:TextBox ID="txtCalle" runat="server" style="width:400px; margin-left:150px"  placeholder="Ingrese Calle" ></asp:TextBox> </legend>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="  *  " Font-Bold="True" ControlToValidate="txtCalle"></asp:RequiredFieldValidator>
      <br />
    <legend>
    <asp:Label ID="Numero" ClientIDMode="Static" runat="server" style="margin-left:180px; color:white"> </asp:Label>
    <asp:TextBox ID="txtNumero" runat="server" style=" margin-left:150px; width:400px"  placeholder="Ingrese Altura" TextMode="Number" ></asp:TextBox></legend>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="  *  " ControlToValidate="txtNumero" Font-Bold="True"></asp:RequiredFieldValidator>
       <br />

 <legend>
     <asp:Label ID="Piso" ClientIDMode="Static" runat="server" Text="Label" style="margin-left:180px; color:white"> </asp:Label>
    <asp:TextBox ID="txtPiso" runat="server" style=" margin-left:150px ; width:400px"  TextMode="Number"  placeholder="Ingrese Piso"></asp:TextBox>  </legend>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="  *  " ControlToValidate="txtPiso" Font-Bold="True"></asp:RequiredFieldValidator>
       <br />

    <legend>
    <asp:Label ID="Departamento" ClientIDMode="Static" runat="server" style="margin-left:180px; color:white" Text="Label"></asp:Label>
    <asp:TextBox ID="txtDepartamento" runat="server" style=" margin-left:150px; width:400px"   placeholder="Ingrese Departamento"></asp:TextBox></legend>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="  *  " ControlToValidate="txtDepartamento" Font-Bold="True"></asp:RequiredFieldValidator>
      <br />
 
     <asp:ScriptManager ID="ScriptManger1" runat="Server" />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
                    <legend>
                  <br /> 
                  <asp:Label ID="Provincia" For="ddProvincia" style="margin-left:180px; color:white ; width:400px" runat="server" ClientIDMode="Static"></asp:Label>  
                <asp:DropDownList ID="ddProvincia" runat="server" ClientIDMode="static" CssClass="dropdownlist"  Width="400px" OnSelectedIndexChanged="ddProvincia_SelectedIndexChanged" AutoPostBack="True"  style="margin-left:150px;">
                  </asp:DropDownList>  </legend>
  
                  <br />
             <legend>
                  <asp:Label ID="Localidad" for="ddLocalidad" ClientIDMode="Static" style="margin-left:180px; color:white ; width:400px" runat="server" Text="Localidad"></asp:Label>
                  <asp:DropDownList ID="ddLocalidad" runat="server" Width="400px" ClientIDMode="static" CssClass="dropdownlist" style="margin-left:150px;" >
                  </asp:DropDownList>
               </legend>
         </ContentTemplate>
    </asp:UpdatePanel>
    <br />
     <legend>
    <asp:Label ID="TipoDeDireccion" ClientIDMode="Static" runat="server"  style="margin-left:180px;color:white ; width:400px"></asp:Label> 
    <asp:DropDownList runat="server" ID="DDLTipodeDireccion" AutoPostBack="true" CssClass="dropdownlist" style="width:400px; margin-left:150px">  </asp:DropDownList>  
     </legend>
      </fieldset>
    <br />
       
    <br />
     <div class="form-group">
   <asp:Button style="margin-left:150px " ID="Continuar" runat="server" Text="Confirmar"  Width="150px"  OnClick="BtnContinuar_Click"/>
   <asp:Button style="margin-left:100px " ID="Cancelar" CausesValidation="False"  runat="server" Text="Cancelar" OnClick="Cancelar_Click" Width="150px"   />
         </div>
   <br />
   
 
  
   <br />
    <br />
   <br />
 <br />
   <br />
    <br />
   <br />

        </div>
 </div>
</div>
    

   
  
</asp:Content>