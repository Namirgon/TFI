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
   <h2 ></h2>
   <br />
   <br />     
   <br />
                <div style="border:groove; background-image:url('../../Content/Image/bannerIntranet.jpg'); background-size:cover">
   
                <br />
                <br />
                     <h3  ><asp:Label ID="ListadoEmpleado" runat="server" ClientIDMode="Static" style="margin-left:30px; color:aliceblue"></asp:Label></h3>
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

                  <asp:ButtonField CommandName="btnModificar" Text="Modificar" ControlStyle-ForeColor="White"  ControlStyle-BackColor="Green" />
                  <asp:ButtonField CommandName="btnGuardar" Text="Guardar Cambios" ControlStyle-ForeColor="White"  ControlStyle-BackColor="Blue" />
               <%-- //  <asp:ButtonField CommandName="btnEliminar" Text="Eliminar" ControlStyle-ForeColor="White"  ControlStyle-BackColor="Red" />

                --%>

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
 <h3 ><asp:Label ID="ModificarEmpleados" runat="server" ClientIDMode="Static" style="margin-left:30px; color:aliceblue"></asp:Label></h3><br /><br />

    
 <div style="width:700px">
      <asp:HiddenField ID="hfModificar" runat="server" Value="0" ></asp:HiddenField>
     <fieldset>
  
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
<br />
     <legend>
    <asp:Label ID="DNI" runat="server"  style="margin-left:180px;color:white; font-size:15px" AssociatedControlID="txtDNI" ClientIDMode="Static"></asp:Label> 
    <asp:TextBox ID="txtDNI" style="width:400px; margin-left:150px" runat="server" TextMode="Number"></asp:TextBox></legend>
        
   <br />
  
    <legend>
    <asp:Label ID="Sexo" runat="server" ClientIDMode="Static" style="margin-left:180px;color:white; font-size:15px"  AssociatedControlID="ddSexo"> </asp:Label>
    <asp:DropDownList runat="server" ID="ddSexo" AutoPostBack="true" style="width:400px; margin-left:150px" CssClass="dropdownlist"> </asp:DropDownList></legend>
    
    <br />
 <legend>  
    <asp:Label ID="EtiquetaEmail" runat="server" ClientIDMode="Static" style="margin-left:180px;color:white; font-size:15px" AssociatedControlID="txtusuario"></asp:Label>
    <asp:TextBox  runat="server" style="width:400px; margin-left:150px" ID="txtusuario" TextMode="Email"></asp:TextBox></legend>
                                                                                                                                 
    <br />
  <legend>
    <asp:Label ID="Telefono" runat="server" ClientIDMode="Static" style="margin-left:180px;color:white; font-size:15px" AssociatedControlID="txtTelefono"></asp:Label> 
    <asp:TextBox ID="txtTelefono" style="width:400px; margin-left:150px" runat="server" TextMode="Phone"></asp:TextBox></legend>

     <br /> <asp:HiddenField ID="hfDireccion" runat="server" Value="0" ></asp:HiddenField>
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
               <br />
         </ContentTemplate>
    </asp:UpdatePanel>
                   
                     
                     <br />
                     <br />
        
     </fieldset>
     </div>
                     <div class="form-group" >
                <%--<asp:Button ID="Aceptar" runat="server" Text="Modificar Empleado" OnClick="btnModificar_Click" style="margin-left:150px; width:150px " />--%>
                   <asp:Button ID="Cancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" style="margin-left:50px; width:150px  " /> 

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
                     <br />
                     <br />

   </div>
</div>
     </div>
</asp:Content>




<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
