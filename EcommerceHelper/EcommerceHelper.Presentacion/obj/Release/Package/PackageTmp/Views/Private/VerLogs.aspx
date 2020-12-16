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
    <br />     
   <br />
   <h2 style="margin-left:60px" > <asp:Label ID="Bitacora" runat="server" ClientIDMode="Static" > </asp:Label>
                </h2>
   <br />
  
       </div>
       <br />
    <div  style="border:groove; background-image:url('../../Content/Image/bannerIntranet.jpg'); background-size:cover; height:800px">
     <br />     
   <br />


         <div class="row">
            <div class="col-md-10 col-md-offset-2">
                <b>
                    <asp:Label ID="VerLog2" runat="server" ClientIDMode="Static" style="color:aliceblue ; font-size: 20px; margin-left:300px"  ></asp:Label></b>
                <select id="idelTIpoLog" runat="server"  class="browser-default custom-select form-control " style="width:200px; margin-left:30px;">
                    <option value="Evento">Evento</option>
                    <option value="Error">Error</option>
                </select>
                <br />
                <br />
                <div class="form-inline">

                    <b>
                        <asp:Label ID="Desde" runat="server" ClientIDMode="Static"  style="color:aliceblue ; font-size: 20px; margin-left:300px; margin-right: 20px" > </asp:Label></b>

                    <input runat="server" type="date" name="nFechaInicio" id="elIdFechaInicio" class="hasDatepicker form-control " required="required" />

                    <b>
                        <asp:Label ID="Hasta" runat="server" ClientIDMode="Static" style="color:aliceblue ; font-size: 20px; margin-left:30px; margin-right: 20px"> </asp:Label></b>

                    <input runat="server" type="date" name="nFechaFin" id="elIdFechaFin" class="hasDatepicker form-control " required="required" />
                    <asp:Button ID="Aceptar" runat="server" ClientIDMode="Static" class="btn btn-primary " OnClick="btnFiltrarLogs_Click" Width="163px" />

                </div>

            </div>
        </div>
        <br />
        <br />
        <br />
        <div class="row">
            <div class="col-md-10 col-md-offset-2">
                <label for="grillaLogs"></label>
    <center>
      <asp:GridView ID="grillaLogs"  cssclass="table table-striped " runat="server" AllowPaging="True" Width="800px" OnPageIndexChanging="grillaLogs_PageIndexChanging" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                    <Columns>
                        <asp:BoundField DataField="IdBitacoraLog" HeaderText=" IdBitacora"  Visible="false" />
                        <asp:BoundField DataField="IdUsuario" HeaderText="IdUsuario" HeaderStyle-CssClass="bg-primary" Visible="false" >
                        <HeaderStyle CssClass="bg-primary"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="NombreUsuario" HeaderText=" NombreUsuario " HeaderStyle-CssClass="bg-primary" >
                        <HeaderStyle CssClass="bg-primary"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Fecha" HeaderText="Fecha " HeaderStyle-CssClass="bg-primary" DataFormatString="{0:d}" >
                        <HeaderStyle CssClass="bg-primary"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="TipoLog" HeaderText="Tipo" HeaderStyle-CssClass="bg-primary" >
                        <HeaderStyle CssClass="bg-primary"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Accion" HeaderText=" Accion " HeaderStyle-CssClass="bg-primary" >
                        <HeaderStyle CssClass="bg-primary"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Mensaje" HeaderText=" Mensaje " HeaderStyle-CssClass="bg-primary" >
                        <HeaderStyle CssClass="bg-primary"></HeaderStyle>
                        </asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>

                <br />


  </center>

    </div>

            </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src="../../Script/Shared/Validaciones.js"></script>

</asp:Content>
