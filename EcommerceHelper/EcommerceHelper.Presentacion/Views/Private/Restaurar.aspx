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
       
                <h2 style="margin-left:60px" > <asp:Label ID="Restaurar2" runat="server" ClientIDMode="Static" > </asp:Label>
                </h2>
           
   <br />
   <br />     
   <br />
<div style="border:groove; background-image:url('../../Content/Image/bannerIntranet.jpg'); background-size:cover; height:400px">
     <br />
   <br />     
   <br />



      <div class="form-group col-md-8 col-md-offset-2">
            <asp:Label runat="server" ID="Nombre" ClientIDMode="Static" style="color:aliceblue ; font-size: 20px; margin-left:100px; margin-right:30px;"  ></asp:Label>
            <input id="txtNombreBD" name="txtNombreBD" type="text" Placeholder="Nombre Base de Datos" class="form-control " />

          <br />
          <br />
                 <div style="margin-left:100px">
                     <asp:UpdatePanel ID="up1" runat="server" >
                         <ContentTemplate>
                             <asp:FileUpload ID="fileUpload" runat="server" style="margin-left:30px; margin-right:30px" />
                             <br />
                             <br />
                           
                             <asp:Button ID="Aceptar" runat="server" ClientIDMode="Static"   OnClick="btnUpload_Click" class="btn btn-primary" style="margin-left:20px" Width="161px" />
                              <asp:Button ID="Cancelar" runat="server" ClientIDMode="Static" OnClick="btnCancelar_Click" style="margin-left:40px" class="btn btn-primary " Width="162px" CausesValidation="false" />
                             <br />
                             <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                         </ContentTemplate>
                         <Triggers>
                             <asp:PostBackTrigger ControlID="Aceptar" />
                         </Triggers>
                     </asp:UpdatePanel>
                 </div>
        </div>










    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
