<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/PaginaMaestraAdministracion.Master" AutoEventWireup="true" CodeBehind="GestionEmpleado.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Private.GestionEmpleado" %>
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
   <h2  style="margin-left:30px">Gestion Empleado</h2>
   <br />
   <br />     
   <br />
                <div style="border:groove; background-image:url('../../Content/Image/bannerIntranet.jpg'); background-size:cover">
   
                <br />
                <br />
                     <h3  style="margin-left:30px; color:aliceblue">Listado de Empleados</h3>
                <br />
                <br />
              <center>             
        <asp:GridView ID="GVGrillaEmpleado" runat="server"  AutoGenerateColumns="False" ViewStateMode="Enabled" OnRowCommand="GVGrillaEmpleado_RowCommand"  OnDataBound="GVGrillaEmpleado_DataBound" cssclass="table table-striped " BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataSourceID="SqlDataSource1" GridLines="None">
            <Columns>
            
         
                  <asp:BoundField DataField="IdUsuario" HeaderText="IdUsuario" InsertVisible="False" ReadOnly="True" SortExpression="IdUsuario"  />
                  <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                  <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
                  <asp:BoundField DataField="NumeroDocumento" HeaderText="NumeroDocumento" SortExpression="NumeroDocumento" />
                 <asp:BoundField DataField="NumeroTelefono" HeaderText="NumeroTelefono" SortExpression="NumeroTelefono" />
                  <asp:BoundField DataField="IdSexo" HeaderText="IdSexo" SortExpression="IdSexo" />
                  <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                 <asp:BoundField DataField="IdDireccion" HeaderText="IdDireccion" SortExpression="IdDireccion" InsertVisible="False" ReadOnly="True"  />
                 <asp:BoundField DataField="Calle" HeaderText="Calle" SortExpression="Calle" />
                 <asp:BoundField DataField="Numero" HeaderText="Numero" SortExpression="Numero" />
                 <asp:BoundField DataField="Piso" HeaderText="Piso" SortExpression="Piso" />
                <asp:BoundField DataField="Departamento" HeaderText="Departamento" SortExpression="Departamento" />
                 <asp:BoundField DataField="IdLocalidad" HeaderText="IdLocalidad" SortExpression="IdLocalidad" />
                  <asp:BoundField DataField="IdProvincia" HeaderText="IdProvincia" SortExpression="IdProvincia" />

                  <asp:ButtonField CommandName="btnModificar" Text="Modificar" />
                  <asp:ButtonField CommandName="btnEliminar" Text="Eliminar" />

            </Columns>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
        </asp:GridView>
</center>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HelperDataBase %>" ProviderName="<%$ ConnectionStrings:HelperDataBase.ProviderName %>" SelectCommand="SelectEmpleado" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

   <br />
                       <br />
                       <br />
 <h3 style="color:aliceblue; margin-left:30px;">Modificar Empleados</h3><br /><br />

     <asp:HiddenField ID="hfModificar" runat="server" ></asp:HiddenField>

   <br />
  <div class="form-group row">
    <asp:Label ID="lblNombre" runat="server" Text="Label"  style="margin-left:100px;color:white; font-size:15px"  AssociatedControlID="txtNombre">Nombre</asp:Label>
    <asp:TextBox ID="txtNombre" style="width:400px; margin-left:128px" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Ingrese el Nombre" ControlToValidate="txtNombre" Font-Bold="True"></asp:RequiredFieldValidator>
    </div>
   <br />
 <div class="form-group row">
    <asp:Label ID="lblApellido" runat="server" Text="Label" style="margin-left:100px;color:white; font-size:15px"  AssociatedControlID="txtApellido" >Apellido</asp:Label>
    <asp:TextBox ID="txtApellido" style="width:400px ; margin-left:124px" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtApellido" ErrorMessage="Ingrese Apellido" Font-Bold="True"></asp:RequiredFieldValidator>
    </div>
   <br />
<div class="form-group row">
    <asp:Label ID="lblDNI" runat="server" Text="Label" style="margin-left:100px;color:white; font-size:15px" AssociatedControlID="txtDNI">DNI</asp:Label> 
    <asp:TextBox ID="txtDNI" style="width:400px; margin-left:152px" runat="server" TextMode="Number"></asp:TextBox>
  </div>
   <br />
<div class="form-group row">
    <asp:Label ID="lblSexo" runat="server" Text="Label" style="margin-left:100px;color:white; font-size:15px" AssociatedControlID="ddSexo" > Genero</asp:Label>
    <asp:DropDownList runat="server" ID="ddSexo" AutoPostBack="true" style="width:400px; margin-left:133px" CssClass="dropdownlist"> </asp:DropDownList>
       </div>
    <br />
 <div class="form-group row">
    <asp:Label ID="lblUsuario" runat="server" Text="Usuario" style="margin-left:100px;color:white; font-size:15px" AssociatedControlID="txtusuario">Email</asp:Label>
    <asp:TextBox  runat="server" style="width:400px; margin-left:140px" ID="txtusuario" TextMode="Email"></asp:TextBox>
 </div>                                                                                                                                   
   <br />
        <div class="form-group row">             
    <asp:Label ID="lblTelefono" runat="server" Text="Label" style="margin-left:130px;color:white; font-size:15px" AssociatedControlID="txtTelefono">Telefono</asp:Label> 
    <asp:TextBox ID="txtTelefono" style="width:400px; margin-left:95px" runat="server" TextMode="Number"></asp:TextBox>
      </div>
    <br />
    <div class="form-group row"> 
 <asp:Label ID="lblCalle" runat="server" Text="Calle" style="margin-left:100px; color:white; font-size:15px" AssociatedControlID="txtCalle">Calle</asp:Label>
    <asp:TextBox ID="txtCalle" runat="server" style="width:400px; margin-left:150px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Ingrese Calle" Font-Bold="True" ControlToValidate="txtCalle"></asp:RequiredFieldValidator>
    </div>
   <br />
     <div class="form-group row"> 
    <asp:Label ID="lblNumero" runat="server" Text="Label"  style="margin-left:100px; color:white; font-size:15px" AssociatedControlID="txtNumero"> Numero</asp:Label>
    <asp:TextBox ID="txtNumero" runat="server" style="width:400px; margin-left:132px" TextMode="Number"></asp:TextBox>
   </div>
    <br />
     <div class="form-group row"> 
    <asp:Label ID="lblPiso" runat="server" Text="Label" style="margin-left:100px; color:white; font-size:15px" AssociatedControlID="txtPiso"> Piso</asp:Label>
    <asp:TextBox ID="txtPiso" runat="server" style="width:400px; margin-left:157px" TextMode="Number"></asp:TextBox>
    </div>
     <br />
    <div class="form-group row"> 
    <asp:Label ID="LblDepartamento" runat="server" style="margin-left:100px; color:white; font-size:15px" Text="Label" AssociatedControlID="txtDepartamento">Departamento</asp:Label>
    <asp:TextBox ID="txtDepartamento" runat="server" style="width:400px; margin-left:97px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Ingrese Departamento" ControlToValidate="txtDepartamento" Font-Bold="True"></asp:RequiredFieldValidator>
    </div>
<br /> 
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
                    <div class="form-group row">            
                  <asp:Label ID="lblProvincia" For="ddProvincia" style="margin-left:100px; color:white; font-size:15px" runat="server" Text="Provincia" AssociatedControlID="ddProvincia"></asp:Label>  
                <asp:DropDownList ID="ddProvincia" runat="server" ClientIDMode="static" CssClass="dropdownlist"    Width="400px" OnSelectedIndexChanged="ddProvincia_SelectedIndexChanged" AutoPostBack="True" style="margin-left:120px">
                  </asp:DropDownList> 
                    </div>
                  <br />
             <div class="form-group row">
                  <asp:Label ID="lblLocalidad" for="ddLocalidad" style="margin-left:100px; color:white; font-size:15px" runat="server" Text="Localidad" AssociatedControlID="ddLocalidad"></asp:Label>
                  <asp:DropDownList ID="ddLocalidad" runat="server" Width="400px" ClientIDMode="static" style="margin-left:60px" CssClass="dropdownlist" >
                  </asp:DropDownList>
                 </div>
         </ContentTemplate>
    </asp:UpdatePanel>
                     <br />
                     <br />
                     <br />
  <div class="btn-group">
       <asp:Button ID="btnModificar" runat="server" Text="Modificar Empleado" OnClick="btnModificar_Click" style="margin-left:310px " /> 
             <asp:Button ID="btnCancelar" runat="server" Text="Modificar Empleado" OnClick="btnCancelar_Click" style="margin-left:50px " /> 
  </div>
    
 
 

   </div>
</div>
     </div>
</asp:Content>




<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
