<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/PaginaMaestraCliente.Master" AutoEventWireup="true" CodeBehind="ABMTarjetasDeCredito.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Public.ABMTarjetasDeCredito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div>
   <br />
   <br />     
   <br />
         <br />
   <h2  style="margin-left:30px">Mis Tarjetas</h2>
   <br />
 
 </div>   
<div  style="background-image:url('../../Content/Image/banner-curso-degrade.png')">
   
    
    <br />
    <h3 >  <asp:Label ID="ServicioPedido3" runat="server"  Font-Bold="true"   style="margin-left:30px; margin-top:30px" ></asp:Label> </h3> 
       <br />
    <br />             
   
 </div>
    <br />
    <br />
      <asp:Label ID="lblMensaje" runat="server" Visible="false" Text="Label"  style="color:black; font-size:20px; margin-left:500px" ></asp:Label> <br /><br />
   <br />
    <br /> 
    <br />
    <div>

           <div style="align-content:center; margin-left:100px; width:700px" class="form-group"> <br />

<fieldset>
             <asp:HiddenField ID="hid" runat="server" ></asp:HiddenField>

            <legend>
           <asp:Label ID="NombreTitular" runat="server" ClientIDMode="Static"  style=" font-size: 16px; margin-left:180px; margin-right: 20px" ></asp:Label>
           <asp:TextBox ID="txtNombreTitular" runat="server"  style="width:400px;  margin-left:150px; margin-right:40px" CssClass="form-control" placeholder="ingrese Titular de la Tarjeta"></asp:TextBox> 
          </legend>
               <br />
                <legend>
           <asp:Label ID="Numerotarjeta" runat="server" ClientIDMode="Static"  style=" font-size: 16px; margin-left:180px; margin-right: 20px" ></asp:Label>
           <asp:TextBox ID="txtNumeroTarjeta" runat="server"  style="width:400px;  margin-left:150px; margin-right:40px" CssClass="form-control" placeholder="ingrese Numero de la Tarjeta"></asp:TextBox> 
            </legend>
               <br />
            <legend>
           <asp:Label ID="FechaVencimiento" runat="server" ClientIDMode="Static" style=" font-size: 16px; margin-left:180px; margin-right: 20px" ></asp:Label>
           <input id="txtFecha" type="date" name="txtfecha"  style="width:400px;  margin-left:150px; margin-right:40px" class="form-control" runat="server"   />
         </legend>
                <br />
             <legend>
            <asp:Label ID="CodigodeSeguridad" runat="server" ClientIDMode="Static"  style=" font-size: 16px; margin-left:180px; margin-right: 20px" ></asp:Label>
                <asp:TextBox ID="txtcodseguridad" runat="server"  style="width:400px;  margin-left:150px; margin-right:40px" CssClass="form-control" placeholder="ingrese codigo de Seguridad"></asp:TextBox> 
                </legend> <br />
 <legend>
              <asp:Label ID="TipoTarjeta" runat="server" ClientIDMode="Static" style="margin-left:180px; font-size:16px"></asp:Label> 
                <asp:DropDownList runat="server" ID="ddlTipoTarjeta" AutoPostBack="true" CssClass="form-control" style="width:400px; margin-left:150px">  </asp:DropDownList>     
     </legend>
               <br />
               <br />

    </fieldset>
               <br />
<div style="margin-left:30PX">
           <asp:Button ID="AltaTarjeta" runat="server" ClientIDMode="Static" OnClick="btnAltaTarjeta_Click" class="btn btn-primary btn-lg" Width="167px" />
           &nbsp;
           <asp:Button ID="ModificarTarjeta" runat="server" ClientIDMode="Static" OnClick="BtnModificarTarjeta_Click" class="btn btn-primary btn-lg" Width="178px" />
                &nbsp;
          <asp:Button ID="VolverPago" runat="server" ClientIDMode="Static" CausesValidation="false" OnClick="VolverPago_Click" class="btn btn-primary btn-lg" Width="178px" />
   
    </div>


          <br />
          <br />


         <asp:GridView ID="GVTarjetas" runat="server" AutoGenerateColumns="False" ViewStateMode="Enabled" OnRowCommand="GVTarjetas_RowCommand" OnDataBound="GVTarjetas_DataBound"  cssclass="table table-striped " Width="400px" >
            <Columns>
  
                  <asp:BoundField DataField="IdTarjeta" HeaderText="IdTarjeta" />
                  <asp:BoundField DataField="NombreTitular" HeaderText="Titular" />
                  <asp:BoundField DataField="NumeroTarjeta" HeaderText="Numero" />
                  <asp:BoundField DataField="MiTipoTarjeta.Descripcion" HeaderText="Tipo Tarjeta"  >  
      
                  </asp:BoundField>
  
                  <asp:BoundField DataField="FechaVencimiento" HeaderText="Fecha de Vencimiento"  ></asp:BoundField>
                  <asp:BoundField DataField="CodigoSeguridad" HeaderText="Codigo de Seguridad" />
                  <asp:ButtonField CommandName="btnModificar" Text="Modificar" ButtonType="Button" ControlStyle-ForeColor="White"  ControlStyle-BackColor="Green" />
                  <asp:ButtonField CommandName="btnEliminar" Text="Eliminar" ButtonType="Button " ControlStyle-BackColor="Red"  ControlStyle-ForeColor="White" />
                                
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

    </div>
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
