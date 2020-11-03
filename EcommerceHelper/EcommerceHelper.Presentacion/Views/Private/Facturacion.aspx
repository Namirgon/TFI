<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/PaginaMaestraAdministracion.Master" AutoEventWireup="true" CodeBehind="Facturacion.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Private.Facturacion" %>
<%@ MasterType VirtualPath="~/Shared/PaginaMaestraAdministracion.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="../../Content/EstilosPermisos.css" rel="stylesheet" />

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



<div class="mibody2" >
   
   <div  >
   <br />
   <br />     
   <br />
        <br />
   <br />     
   <br />
        <div class="row">
            <div class="col-md-8 col-md-offset-2" style="margin-left:100px">
                <h2 class="page-header">
                    <asp:Label ID="Label1" runat="server" Text=" Facturacion "> </asp:Label>
                </h2>
            </div>
        </div>
   <br />
   <br />     
   <br />
       </div>

    <div>

<center>

  
    <asp:gridview runat="server" cssclass="table table-striped " Id="gvFacturas"  Width="1000px" AutoGenerateColumns="False"  >
        <Columns>
            <asp:BoundField DataField="IdFactura" HeaderText="Numero Factura" />
            <asp:BoundField DataField="TipoComprobante.Descripcion" HeaderText="Tipo Comprobante" />
            <asp:BoundField DataField="MiSucursal.Descripcion" HeaderText="Sucursal" />
            <asp:BoundField DataField="MiOrdenDeTrabajo.IdOrdenDeTrabajo" HeaderText="Numero Orden De Trabajo" />
            <asp:BoundField DataField="Fecha" HeaderText="Fecha" />
            <asp:BoundField HeaderText="Importe" />
             <asp:ButtonField CommandName="btnGenerarNC" Text="Generar NC" ButtonType="Button " ControlStyle-BackColor="Red"  ControlStyle-ForeColor="White" />
        </Columns>



    </asp:gridview>
    </center>
          </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
