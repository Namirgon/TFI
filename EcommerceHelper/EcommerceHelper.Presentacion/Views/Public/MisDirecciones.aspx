<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/PaginaMaestraCliente.Master" AutoEventWireup="true" CodeBehind="MisDirecciones.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Public.MisDirecciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
     <br />
    <br />
     <div  style="background-image:url('../../Content/Image/banner-curso-degrade.png')">
   <br />
   <br />     
   <h3  style="margin-left:30px; margin-top:30px"> Servicios  /  Pedidos  / Mis Direcciones</h3>
   <br />     
    <br />
      </div>


    <asp:GridView ID="GVMisDirecciones" runat="server" cssclass="table table-striped " OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HiddenField  id="IdDireccion" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "IdDireccion")%> '  />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Calle"  HeaderText=" Calle"/>
            <asp:BoundField DataField="Numero" HeaderText="Numero"/>
            <asp:BoundField DataField="Piso" HeaderText="Piso"/>
            <asp:BoundField DataField="Departamento" HeaderText="Departamento"/>
            <asp:BoundField DataField="IdLocalidad" HeaderText="Localidad"/>
        </Columns>


    </asp:GridView>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
