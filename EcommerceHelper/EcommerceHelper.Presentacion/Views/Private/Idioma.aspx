<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/PaginaMaestraAdministracion.Master" AutoEventWireup="true" CodeBehind="Idioma.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Private.Idioma" %>

<%@ MasterType VirtualPath="~/Shared/PaginaMaestraAdministracion.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  
       
   
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <br />     
      <br />
      <br />     
     <br />     
      <br />
      <br /> 
     <h3  style="margin-left:50px">ABM Idioma</h3>
   
     
     <br />
     <br />     
     <br />
<div style="background-image:url('../../Content/Image/bannerIntranet.jpg'); width:100%; ">
   
   <br />
   <br />
   <br />

     <h3 style="margin-left:50px; color:aliceblue">Alta Idioma</h3>
    
    <br />
     <div style="align-content:center; margin-left:100px; width:700px"> <br />


             <asp:HiddenField ID="hid" runat="server" ></asp:HiddenField>

 
           <asp:Label ID="lbIdioma" runat="server" Text="Idioma"  style="color:aliceblue ; font-size: 20px; margin-left:30px; margin-right: 20px" ></asp:Label>
           <asp:TextBox ID="txtIdioma" runat="server"  style="width:400px;  margin-left:35px; margin-right:40px" placeholder="ingrese Idioma"></asp:TextBox> 
           &nbsp;&nbsp; 
           <asp:Button ID="BtnAltaIdioma" runat="server" Text="Alta" OnClick="BtnAltaIdioma_Click" class="btn btn-primary btn-lg" Width="167px" />
           &nbsp;
           <asp:Button ID="btnGuardarModificacion" runat="server"   Text=" Guardar Cambios " OnClick="btnGuardarModificacion_Click" class="btn btn-primary btn-lg" Width="178px" />
   
    


          <br />
          <br />


         <asp:GridView ID="GVGrilla" runat="server" AutoGenerateColumns="False" ViewStateMode="Enabled" OnRowCommand="GVGrilla_RowCommand" OnDataBound="GVGrilla_DataBound"  cssclass="table table-striped " Width="400px" >
            <Columns>
  
                  <asp:BoundField DataField="IdIdioma" HeaderText="IdIdioma"  ></asp:BoundField>
                  <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" HeaderStyle-CssClass="bg-primary" >  </asp:BoundField>
                  <asp:ButtonField CommandName="btnModificar" Text="Modificar" />
                  <asp:ButtonField CommandName="btnEliminar" Text="Eliminar" />
                                
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
   <br />
   <br />

   
 

</div>   
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
