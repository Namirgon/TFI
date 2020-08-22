<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/PaginaMaestraAdministracion.Master" AutoEventWireup="true" CodeBehind="BackUp.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Private.BackUp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="mibody2" >
   
   <div  >
   <br />
   <br />     
   <br />
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <h2 class="page-header">
                    <asp:Label ID="Label1" runat="server" Text=" Backup "> </asp:Label>
                </h2>
            </div>
        </div>
   <br />
   <br />     
   <br />
<div style="border:groove; background-image:url('../../Content/Image/bannerIntranet.jpg'); background-size:cover; height:400px">
   
   <br />
    <div class="container paddingPaginas">
        
        <div class="form-group">
            <div class="col-md-8 col-md-offset-2">
                 <div>
                     <b>
                     <asp:Label Text=" Nombre " runat="server" style="color:aliceblue ; font-size: 20px; margin-left:30px" /></b> &nbsp&nbsp&nbsp
                     <asp:TextBox ID="txtNombreArchivo" CssClass="form-control input-md" runat="server" required="required" placeholder=" Nombre "></asp:TextBox><br /><br />

                     <asp:UpdatePanel ID="up1" runat="server">
                         <ContentTemplate>
                             <asp:Button ID="btnUpload" runat="server" Text="Backup " Mensaje=" EstaSeguro " OnClientClick='return confirm(this.getAttribute("Mensaje"))' OnClick="btnUpload_Click1" class="btn btn-primary col-md-2" style="margin-left:110px" />
                         </ContentTemplate>
                         <Triggers>
                             <asp:PostBackTrigger ControlID="btnUpload" />
                         </Triggers>
                     </asp:UpdatePanel>
                 </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
