<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/PaginaMaestraAdministracion.Master" AutoEventWireup="true" CodeBehind="NotaDeCredito.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Private.NotaDeCredito" %>

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
                
     <h2 style="margin-left:60px" > <asp:Label ID="NDC" runat="server" ClientIDMode="Static" > </asp:Label>
                </h2>
            </div>
        </div>
   <br />
   <br />     

       </div>

    <div style="border:groove; background-image:url('../../Content/Image/bannerIntranet.jpg'); background-size:cover">
        <br />
   <br />     
   <br />
<center>
  
    <asp:gridview runat="server" cssclass="table table-striped " Id="gvNotaDeCredito" OnRowCommand="gvNotaDeCredito_RowCommand"   Width="750px" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"  >
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="IdComprobante" HeaderText="Numero NC" />
            <asp:BoundField DataField="MiTipoComprobante.Descripcion" HeaderText="Tipo Comprobante" />
            <asp:BoundField DataField="MiSucursal.Descripcion" HeaderText="Sucursal" />

            <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:d}" />

                    <asp:ButtonField CommandName="btnVerDetalle" Text="Ver Detalle" ButtonType="Button " ControlStyle-BackColor="Green"  ControlStyle-ForeColor="White" >
<ControlStyle BackColor="Green" ForeColor="White"></ControlStyle>
            </asp:ButtonField>
             <asp:ButtonField CommandName="btnGenerarND" Text="Generar ND" ButtonType="Button " ControlStyle-BackColor="Red"  ControlStyle-ForeColor="White" >
<ControlStyle BackColor="Red" ForeColor="White"></ControlStyle>
            </asp:ButtonField>
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
        <asp:DetailsView ID="DetalleNC" runat="server" Height="50px" Width="325px" BackColor="White" AutoGenerateRows="False" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
            
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="IdItemOrdenDeTrabajo" HeaderText="IdItem" />
                <asp:BoundField DataField="MiServicio.Titulo" HeaderText="Titulo" />
                <asp:BoundField DataField="MiServicio.Descripcion" HeaderText="Descripcion" />
                <asp:BoundField DataField="MiServicio.Precio" HeaderText="Precio" />
           
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

    </div>


</div>

</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
