<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/PaginaMaestraCliente.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="MisDirecciones.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Public.MisDirecciones" %>

 <%@ MasterType VirtualPath="~/Shared/PaginaMaestraCliente.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Content/EstilosPermisos.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <br />
    <br />
     <div  style="background-image:url('../../Content/Image/banner-curso-degrade.png')">
   <br />
   <br />     
   <h3 >  <asp:Label ID="ServicioPedidoMisDirecciones" runat="server"  Font-Bold="true"   style="margin-left:30px; margin-top:30px" ></asp:Label> </h3>
   <br />     
    <br />
      </div>
       
  <div>
      <br />     
    <br />
    <br />  
    <center>
    <asp:GridView ID="GVMisDirecciones" runat="server" Width="800px"   cssclass="table table-striped "    OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="GVMisDirecciones_RowCommand" AutoGenerateColumns="False" OnDataBound="GVMisDirecciones_DataBound">
        <Columns>
          
            <asp:BoundField DataField="IdDireccion" HeaderText="IdDireccion" />
            <asp:BoundField DataField="Calle"  HeaderText=" Calle"/>
            <asp:BoundField DataField="Numero" HeaderText="Numero"/>
            <asp:BoundField DataField="Piso" HeaderText="Piso"/>
            <asp:BoundField DataField="Departamento" HeaderText="Departamento"/>
            <asp:BoundField DataField="MiLocalidad.Descripcion" HeaderText="Localidad"/>
            <asp:BoundField DataField="MiProvincia.Descripcion" HeaderText="Provincia" />
            <asp:BoundField DataField="MiTipoDireccion.Descripcion" HeaderText="Tipo Domicilio" />

    
            <asp:ButtonField CommandName="btnConfirmar"  Text="Seleccionar" ButtonType="Button" ControlStyle-ForeColor="White"  ControlStyle-BackColor="Green" />
            <asp:ButtonField CommandName="btnEliminar" Text="Eliminar" ButtonType="Button " ControlStyle-BackColor="Red"  ControlStyle-ForeColor="White" />
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
      <br />
    
                 

      </div>
    <div style="margin-left:200px">
        <asp:LinkButton ID="linkAltaDireccion" OnClick="linkAltaDireccion_Click" runat="server" CssClass="btn btn-primary"  ></asp:LinkButton>
      
        <asp:LinkButton ID="Continuar" OnClick="BtnContinuar_Click" runat="server"  CssClass="btn btn-primary" Width="214px" ></asp:LinkButton>


        </div>
    <div>


    </div>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">

</asp:Content>
