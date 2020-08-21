<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/PaginaMaestraAdministracion.Master" AutoEventWireup="true" CodeBehind="VerLogs.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Private.VerLogs" %>

<%@ MasterType VirtualPath="~/Shared/PaginaMaestraAdministracion.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       <br />
<div class="mibody2" >
   
   <div  >

   <br />     
   <br />
   <h3 style="margin-left:30px; margin-top:30px">Ver Logs</h3>
   <br />
  
       </div>
       <br />
    <div  style="border:groove; background-image:url('../../Content/Image/bannerIntranet.jpg'); background-size:cover; height:800px">
     <br />     
   <br />


         <div class="row">
            <div class="col-md-10 col-md-offset-2">
                <b>
                    <asp:Label ID="Label2" runat="server" Text=" Logs del sistema  "  ></asp:Label></b>
                <select id="idelTIpoLog" runat="server" class="browser-default custom-select form-control ">
                    <option value="Evento">Evento</option>
                    <option value="Error">Error</option>
                </select>
                <br />
                <br />
                <div class="form-inline">

                    <b>
                        <asp:Label ID="Label3" runat="server" Text=" Desde "> </asp:Label></b>

                    <input runat="server" type="date" name="nFechaInicio" id="elIdFechaInicio" class="hasDatepicker form-control " required="required" />

                    <b>
                        <asp:Label ID="Label4" runat="server" Text=" Hasta "> </asp:Label></b>

                    <input runat="server" type="date" name="nFechaFin" id="elIdFechaFin" class="hasDatepicker form-control " required="required" />
                    <asp:Button ID="btnFiltrarLogs" runat="server" Text=" Buscar " CssClass="form-control btn-success" OnClick="btnFiltrarLogs_Click" />

                </div>

            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-10 col-md-offset-2">
                <label for="grillaLogs"></label>
    <center>
      <asp:GridView ID="grillaLogs"  runat="server" AllowPaging="true" Width="800px" OnPageIndexChanging="grillaLogs_PageIndexChanging"  PageSize="10" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="IdBitacoraLog" HeaderText=" IdBitacora"  Visible="false" />
                        <asp:BoundField DataField="IdUsuario" HeaderText="IdUsuario" HeaderStyle-CssClass="bg-primary" />
                        <asp:BoundField DataField="NombreUsuario" HeaderText=" NombreUsuario " HeaderStyle-CssClass="bg-primary" />
                        <asp:BoundField DataField="Fecha" HeaderText="Fecha " HeaderStyle-CssClass="bg-primary" />
                        <asp:BoundField DataField="TipoLog" HeaderText="Tipo" HeaderStyle-CssClass="bg-primary" />
                        <asp:BoundField DataField="Accion" HeaderText=" Accion " HeaderStyle-CssClass="bg-primary" />
                        <asp:BoundField DataField="Mensaje" HeaderText=" Mensaje " HeaderStyle-CssClass="bg-primary" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>

                <br />


  </center>

    </div>

            </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src="../../Script/Shared/Validaciones.js"></script>

</asp:Content>
