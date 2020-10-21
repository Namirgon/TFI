<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/PaginaMaestraAdministracion.Master" AutoEventWireup="true" CodeBehind="Restaurar.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Private.Restaurar" %>
<%@ MasterType VirtualPath="~/Shared/PaginaMaestraAdministracion.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div  >
   <br />
   <br />     
   <br />
   <br />     
   <br />
   <br />     
   <br />
        <div class="row">
            <div class="col-md-8 col-md-offset-2" style="margin-left:100px">
                <h2 class="page-header">
                    <asp:Label ID="Label1" runat="server" Text=" Restaurar "> </asp:Label>
                </h2>
            </div>
        </div>
   <br />
   <br />     
   <br />
<div style="border:groove; background-image:url('../../Content/Image/bannerIntranet.jpg'); background-size:cover; height:400px">
     <br />
   <br />     
   <br />



      <div class="form-group col-md-8 col-md-offset-2">
            <label class="control-label"  style="color:aliceblue ; font-size: 20px; margin-left:30px; margin-right:30px;"  >Nombre</label>
            <input id="txtNombreBD" name="txtNombreBD" type="text" Placeholder="Nombre Base de Datos" class="form-control " />

          <br />
          <br />
                 <div style="margin-left:100px">
                     <asp:UpdatePanel ID="up1" runat="server" >
                         <ContentTemplate>
                             <asp:FileUpload ID="fileUpload" runat="server" style="margin-left:30px; margin-right:30px" />
                             <br />
                             <br />
                           
                             <asp:Button ID="btnUpload" runat="server" Text=" Restaurar "  OnClick="btnUpload_Click" class="btn btn-primary" style="margin-left:60px" Width="161px" />
                              <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" style="margin-left:40px" class="btn btn-primary " Width="162px" />
                             <br />
                             <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                         </ContentTemplate>
                         <Triggers>
                             <asp:PostBackTrigger ControlID="btnUpload" />
                         </Triggers>
                     </asp:UpdatePanel>
                 </div>
        </div>










    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
