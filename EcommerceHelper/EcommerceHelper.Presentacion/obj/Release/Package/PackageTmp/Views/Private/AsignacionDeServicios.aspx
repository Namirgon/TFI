<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/PaginaMaestraAdministracion.Master" AutoEventWireup="true" CodeBehind="AsignacionDeServicios.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Private.AsignacionDeServicios" %>
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
  <h2 style="margin-left:60px" > <asp:Label ID="Asignacionds" runat="server" ClientIDMode="Static" > </asp:Label>
                </h2>
   <br />
   <br />     
   <br />
<div style="border:groove; background-image:url('../../Content/Image/bannerIntranet.jpg'); background-size:cover">
   
   <br />
   <br />
    <center>

  
    <asp:gridview runat="server" cssclass="table table-striped " Id="gvFacturas" OnRowCommand="gvFacturas_RowCommand"  OnDataBound="gvFacturas_DataBound" Width="750px" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"  >
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="IdComprobante" HeaderText="Numero Factura" />
            <asp:BoundField DataField="MiTipoComprobante.Descripcion" HeaderText="Tipo Comprobante" />
            <asp:BoundField DataField="MiSucursal.Descripcion" HeaderText="Sucursal" />
         
            <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:d}" />
  
                    <asp:ButtonField CommandName="btnVerDetalle" Text="Ver Detalle" ButtonType="Button " ControlStyle-BackColor="Green"  ControlStyle-ForeColor="White" >
<ControlStyle BackColor="Green" ForeColor="White"></ControlStyle>
            </asp:ButtonField>
             <asp:ButtonField CommandName="btnSeleccionar" Text="Seleccionar" ButtonType="Button " ControlStyle-BackColor="Red"  ControlStyle-ForeColor="White" >
<ControlStyle BackColor="Red" ForeColor="White"></ControlStyle>
            </asp:ButtonField>
            <asp:ButtonField ButtonType="Button" CommandName="BtnAsignar" Text="Asignar" ControlStyle-BackColor="Blue"  ControlStyle-ForeColor="White" />
        </Columns>



        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />



    </asp:gridview>
    </center>
   <br />
   <br />     
   <br />
        <center>
        <asp:DetailsView ID="DetalleFactura" runat="server" Height="50px" Width="325px" BackColor="White" OnDataBound="DetalleFactura_DataBound" AutoGenerateRows="False" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" OnPageIndexChanging="DetalleFactura_PageIndexChanging">
            
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="IdItemOrdenDeTrabajo" HeaderText="IdItem" />
                <asp:BoundField DataField="MiServicio.Titulo" HeaderText="Titulo" />
                <asp:BoundField DataField="MiServicio.Descripcion" HeaderText="Descripcion" />
        
          
                <asp:BoundField DataField="Fecha" DataFormatString="{0:d}" HeaderText="Fecha" />
                <asp:BoundField DataField="Hora" DataFormatString="{0:t}" HeaderText="Hora" />
                     
<asp:BoundField DataField="Cantidad" HeaderText="Cantidad"></asp:BoundField>
                <asp:BoundField DataField="Precio" HeaderText="Precio" />
        
          
            </Fields>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        </asp:DetailsView>
        </center>
   <br />
   <br />     
   <br />
    <br />  
   <br />
    <center>
   <div class="form-group row" >
   <asp:label runat="server" ID="SeleccioneEmpleado" ClientIDMode="Static" style="margin-left:300px; color:white ; font-size:18px; " AssociatedControlID="ddlEmpleado" > </asp:label> 
    <asp:DropDownList ID="ddlEmpleado" runat="server" AutoPostBack="true"  style="width:400px; margin-left:80px"  CssClass="form-control"></asp:DropDownList>
   <asp:DropDownList runat="server" ID="DDLIDEmpleado" AutoPostBack="true" visible="false"  style="width:400px; margin-left:320px">  </asp:DropDownList>     

   </div>
        </center>
   <br />
   <br />
      <div class="btn-group"  >
    <asp:Button ID="Aceptar" runat="server" ClientIDMode="Static" Width="150px" style="margin-left:500px" CssClass="form-control" OnClick="BtnAceptar_Click"  /> 
    <asp:Button ID="Cancelar" runat="server" ClientIDMode="Static" Width="150px" style="margin-left:100px" CssClass="form-control" OnClick="BtnCancelar_Click" />
                 </div>
  <br />  
    </div>

       </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
