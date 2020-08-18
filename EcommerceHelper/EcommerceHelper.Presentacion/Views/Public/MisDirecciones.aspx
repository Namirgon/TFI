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
       
  <div>
      <br />     
    <br />
    <br />  
    <center>
    <asp:GridView ID="GVMisDirecciones" runat="server" Width="800px"   cssclass="table table-striped "  OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="GVMisDirecciones_RowCommand" AutoGenerateColumns="False">
        <Columns>
            <%--<asp:TemplateField>
                <ItemTemplate>
                    <asp:HiddenField  id="IdDireccion" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "IdDireccion")%> '  />
                </ItemTemplate>
            </asp:TemplateField>--%>
            <asp:BoundField DataField="IdDireccion" HeaderText="IdDireccion" />
            <asp:BoundField DataField="Calle"  HeaderText=" Calle"/>
            <asp:BoundField DataField="Numero" HeaderText="Numero"/>
            <asp:BoundField DataField="Piso" HeaderText="Piso"/>
            <asp:BoundField DataField="Departamento" HeaderText="Departamento"/>
            <asp:BoundField DataField="MiLocalidad.Descripcion" HeaderText="Localidad"/>
            <asp:BoundField DataField="MiProvincia.Descripcion" HeaderText="Provincia" />
            <asp:BoundField DataField="MiTipoDireccion.Descripcion" HeaderText="Tipo Domicilio" />
        </Columns>
                       <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#454545" Font-Bold="True" ForeColor="White" Height="50"  HorizontalAlign="Center" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                          <EmptyDataTemplate>No se encontraron registros</EmptyDataTemplate>

        
        
        

    </asp:GridView>

        </center>

      </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
