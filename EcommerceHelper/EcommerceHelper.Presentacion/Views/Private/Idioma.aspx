<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/PaginaMaestraAdministracion.Master" AutoEventWireup="true" CodeBehind="Idioma.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Private.Idioma" %>

<%@ MasterType VirtualPath="~/Shared/PaginaMaestraAdministracion.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  
       
   
  
    <style type="text/css">
        .table-striped {}
    </style>
  
       
   
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <br />     
      <br />
      <br />     
     <br />     
      <br />
      <br /> 

     <h2 style="margin-left:60px" > <asp:Label ID="Idioma3" runat="server" ClientIDMode="Static" > </asp:Label>
                </h2>
   
   
     
     <br />
     <br />     
     <br />
<div style="background-image:url('../../Content/Image/bannerIntranet.jpg'); width:100%; ">
   
   <br />
   <br />
   <br />

    <h2 style="margin-left:60px" > <asp:Label ID="AltaIdioma" runat="server" ClientIDMode="Static" > </asp:Label>
                </h2>
   
    
    <br />
     <div style="align-content:center; margin-left:100px; width:90%"> <br />

          <div style="font-size:18px; color:aliceblue; margin-left: 300px">
                                            <br />
               <asp:Label ID="LbMensaje" runat="server"   Visible="false"></asp:Label>
                                            </div>

         <div style="width:600px">
            <fieldset>
             <asp:HiddenField ID="hid" runat="server" ></asp:HiddenField>
            <legend>
           <asp:Label ID="Idioma2" runat="server"  style="color:aliceblue ; font-size: 20px; margin-left:180px;"></asp:Label>
           <asp:DropDownList ID="ddlIdioma" runat="server" CssClass="dropdownlist" style=" margin-left:150px" ></asp:DropDownList><br /></legend>
                <br />

           <legend>
           <asp:Label ID="NombreDelControl" runat="server"   style="color:aliceblue ; font-size: 20px; margin-left:180px;" ></asp:Label>   
           <asp:TextBox ID="TXTNombreDelControl" runat="server"  style="width:400px;  margin-left:150px;" placeholder="ingrese Idioma"></asp:TextBox> </legend>


            <br />
                <legend>
          <asp:Label ID="Texto" runat="server"   style="color:aliceblue ; font-size: 20px; margin-left:180px;" ></asp:Label>
           <asp:TextBox ID="TxtTextoControl" runat="server"  style="width:400px;  margin-left:150px; " placeholder="ingrese Idioma"></asp:TextBox> </legend>
         <br />
             </fieldset>
           <asp:Button ID="BtnAltaIdioma" runat="server" Text="Alta" OnClick="BtnAltaIdioma_Click" class="btn btn-primary btn-lg" Width="167px" />
           &nbsp;
           <asp:Button ID="btnGuardarModificacion" runat="server"   Text=" Guardar Cambios " OnClick="btnGuardarModificacion_Click" class="btn btn-primary btn-lg" Width="178px" />
   
    
         </div>

          <br />
          <br />


         <asp:GridView ID="GVGrilla" runat="server" AutoGenerateColumns="False" ViewStateMode="Enabled" AllowPaging="true"   OnPageIndexChanging="GVGrilla_PageIndexChanging" OnRowCommand="GVGrilla_RowCommand" OnDataBound="GVGrilla_DataBound"  cssclass="table table-striped " Width="1015px" OnSelectedIndexChanged="GVGrilla_SelectedIndexChanged" >
            <Columns>
                   <asp:BoundField DataField="IdMultiIdioma" HeaderText="IdMultiIdioma"  >
                  <HeaderStyle Width="50px" />
                  <ItemStyle Width="50px" />
                  </asp:BoundField>
                  <asp:BoundField DataField="MiIdioma.IdIdioma" HeaderText="IdIdioma"  >
                  <HeaderStyle Width="50px" />
                  <ItemStyle Width="50px" />
                  </asp:BoundField>
                  <asp:BoundField DataField="NombreDelControl" HeaderText="Nombre del Control" HeaderStyle-CssClass="bg-primary" >  
<HeaderStyle CssClass="bg-primary" Width="200px"></HeaderStyle>
                  <ItemStyle Width="200px" />
                  </asp:BoundField>
                  <asp:BoundField DataField="Texto" HeaderText="Texto" >
                  <HeaderStyle Width="400px" />
                  <ItemStyle Width="400px" />
                  </asp:BoundField>
                  <asp:ButtonField CommandName="btnModificar" Text="Modificar" ControlStyle-ForeColor="White"  ControlStyle-BackColor="Green" >
<ControlStyle BackColor="Green" ForeColor="White"></ControlStyle>
                  <HeaderStyle Width="70px" />
                  <ItemStyle Width="70px" />
                  </asp:ButtonField>
                  <asp:ButtonField CommandName="btnEliminar" Text="Eliminar" ControlStyle-BackColor="Red"  ControlStyle-ForeColor="White" >
                                
<ControlStyle BackColor="Red" ForeColor="White"></ControlStyle>
                  <HeaderStyle Width="70px" />
                  <ItemStyle Width="70px" />
                  </asp:ButtonField>
                                
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
