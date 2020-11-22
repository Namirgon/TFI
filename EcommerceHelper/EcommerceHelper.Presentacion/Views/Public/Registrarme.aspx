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
   <h2  style="margin-left:30px">Registrarme</h2>
   <br />
   <br />     
   <br />
<div style="border:groove; background-image:url('../../Content/Image/banner2.jpg'); background-size:cover">
   
   <br />
   <br />
   <br />
   <br />

        
    <div class="form-group">
       
    <asp:Label ID="lblUsuario" runat="server" Text="Usuario" style="margin-left:100px;color:white">Usuario</asp:Label>
    <asp:TextBox  runat="server" style=" margin-left:200px; " ID="txtusuario" TextMode="Email"  placeholder="Ingrese Correo Electronico"></asp:TextBox>
   <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="  *  " ControlToValidate="txtusuario" Font-Bold="True"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Ingrese Email Valido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtusuario"></asp:RegularExpressionValidator>    --%>

    </div>

    <br />
    <div class="form-group">
 <asp:Label ID="lblContrasena" runat="server" for="txtcontrasena" style="margin-left:100px;color:white">Contraseña</asp:Label>
 <asp:TextBox  ID="txtcontrasena" runat="server" type="Password" style= "margin-left:179px" placeholder="Ingrese Contraseña" ></asp:TextBox>
 <asp:RequiredFieldValidator ID="RequiredFieldValidatorF" runat="server" ErrorMessage="  *  " ControlToValidate="txtcontrasena" Font-Bold="True"></asp:RequiredFieldValidator>
     <br />
     <br />
     </div>

    <div class="form-group">
 <asp:Label ID="lblrcontrasena" runat="server" for="txtrepetircontrasena" style="margin-left:100px;color:white">Reingresar Contraseña</asp:Label>
 &nbsp;&nbsp;
 <asp:TextBox  ID="txtrepetircontrasena" runat="server" type="Password" style=" margin-left:95px" placeholder="Reingrese Contraseña" ></asp:TextBox>
<asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="CompareValidator" ControlToValidate="txtrepetircontrasena" ControlToCompare="txtcontrasena" text="Las contraseñas deben ser iguales" ></asp:CompareValidator>
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="  *  " ControlToValidate="txtrepetircontrasena" Font-Bold="True"></asp:RequiredFieldValidator>
        </div>
    <br />
  
    <asp:Label ID="lblNombre" runat="server" Text="Label"  style="margin-left:100px;color:white" >Nombre</asp:Label>
    <asp:TextBox ID="txtNombre" style="margin-left:200px" runat="server" placeholder="Ingrese Nombre"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="  *  " ControlToValidate="txtNombre" Font-Bold="True"></asp:RequiredFieldValidator>
    
    <br />
    <br />
    <asp:Label ID="lblApellido" runat="server" Text="Label" style="margin-left:100px;color:white"  >Apellido</asp:Label>
    <asp:TextBox ID="txtApellido" style=" margin-left:200px" runat="server" placeholder="Ingrese Apellido" ></asp:TextBox>   
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtApellido" ErrorMessage="  *  " Font-Bold="True"></asp:RequiredFieldValidator>
   
    <br />
    <br />
    <asp:Label ID="lblSexo" runat="server" Text="Label" style="margin-left:100px;color:white" > Genero</asp:Label>
    <asp:DropDownList runat="server" ID="ddSexo" AutoPostBack="true" style="width:400px; margin-left:355px" CssClass="form-control" > </asp:DropDownList>
    <br />
   <br />
    <asp:Label ID="lblDNI" runat="server" Text="Label" style="margin-left:100px;color:white">DNI</asp:Label> 
    <asp:TextBox ID="txtDNI" style="width:400px; margin-left:222px" runat="server" placeholder="Ingrese DNI"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="  *  " ControlToValidate="txtDNI" Font-Bold="True"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="lblTipoTelefono" runat="server" Text="Label" style="margin-left:100px;color:white" >Tipo de Telefono</asp:Label> 
    <asp:DropDownList runat="server" ID="ddTipoTelefono" AutoPostBack="true" style="width:400px; margin-left:350px" CssClass="form-control">  </asp:DropDownList>   
      
     <br />                                                                                                                                    
    <br />
    <asp:Label ID="lblTelefono" runat="server" Text="Label" style="margin-left:100px;color:white">Telefono</asp:Label> 
    <asp:TextBox ID="txtTelefono" style="width:400px; margin-left:190px" runat="server" OnTextChanged="txtTelefono_TextChanged"   placeholder="Ingrese Telefono"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="  *  " ControlToValidate="txtTelefono" Font-Bold="True"></asp:RequiredFieldValidator>
    <br />
    <br />

     <asp:Label ID="lblCalle" runat="server" Text="Calle" style="margin-left:95px; color:white">Calle</asp:Label>
    <asp:TextBox ID="txtCalle" runat="server" style="width:400px; margin-left:220px"  placeholder="Ingrese Calle" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="  *  " Font-Bold="True" ControlToValidate="txtCalle"></asp:RequiredFieldValidator>
     <br />
   <br />
    <asp:Label ID="lblNumero" runat="server" Text="Label"  style="margin-left:100px; color:white"> Numero</asp:Label>
    <asp:TextBox ID="txtNumero" runat="server" style=" margin-left:200px"  placeholder="Ingrese Altura" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="  *  " ControlToValidate="txtNumero" Font-Bold="True"></asp:RequiredFieldValidator>
   <br />
     <br />
    <asp:Label ID="lblPiso" runat="server" Text="Label" style="margin-left:100px; color:white"> Piso</asp:Label>
    <asp:TextBox ID="txtPiso" runat="server" style=" margin-left:225px"   placeholder="Ingrese Piso"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="  *  " ControlToValidate="txtPiso" Font-Bold="True"></asp:RequiredFieldValidator>
    <br />
     <br />
    <asp:Label ID="LblDepartamento" runat="server" style="margin-left:80px; color:white" Text="Label">Departamento</asp:Label>
    <asp:TextBox ID="txtDepartamento" runat="server" style=" margin-left:180px"   placeholder="Ingrese Departamento"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="  *  " ControlToValidate="txtDepartamento" Font-Bold="True"></asp:RequiredFieldValidator>
    <br /> 
     <asp:ScriptManager ID="ScriptManger1" runat="Server" />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
                    <div class="form-group">
                  <br /> 
                  <asp:Label ID="lblProvincia" For="ddProvincia" style="margin-left:100px; color:white" runat="server" Text="Provincia"></asp:Label>  
                <asp:DropDownList ID="ddProvincia" runat="server" ClientIDMode="static" CssClass="form-control"   Width="400px" OnSelectedIndexChanged="ddProvincia_SelectedIndexChanged" AutoPostBack="True"  style="margin-left:360px;">
                  </asp:DropDownList> </div>
                        
                  <br />
             <div class="form-group">
                  <asp:Label ID="lblLocalidad" for="ddLocalidad" style="margin-left:100px; color:white" runat="server" Text="Localidad"></asp:Label>
                  <asp:DropDownList ID="ddLocalidad" runat="server" Width="400px" ClientIDMode="static" CssClass="form-control " style="margin-left:360px;" >
                  </asp:DropDownList>
                 </div>
         </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Label" style="margin-left:100px;color:white">Tipo de Direccion</asp:Label> 
    <asp:DropDownList runat="server" ID="DDLTipodeDireccion" AutoPostBack="true" CssClass="form-control" style="width:400px; margin-left:360px">  </asp:DropDownList>     
        <br />
    <br />
   <asp:Button style="margin-left:250px " ID="BtnContinuar" runat="server" Text="Confirmar"  Width="150px"  OnClick="BtnContinuar_Click"/>
   <asp:Button style="margin-left:100px " ID="BtnCancelar" runat="server" Text="Cancelar" Width="150px"   />
   <br />
   <br />

 

</div>
 <br />
 </div>
</div>

    <script type="text/javascript">
    function balidatu(){
        var pas1 = $("#txtcontrasena").val();
        var pas2 = $("#txtrepetircontrasena").val();
        return (pas1 === pas2);


    }
</script>
  
</asp:Content>