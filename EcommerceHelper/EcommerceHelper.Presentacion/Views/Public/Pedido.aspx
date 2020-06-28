<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/PaginaMaestraCliente.Master" AutoEventWireup="true" CodeBehind="Pedido.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Public.Pedido1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script src="../../Script/Thirdparty/jquery-3.4.1.min.js"></script>
    <script src="../../Script/Thirdparty/bootstrap.min.js"></script>
   
    <link href="../../Content/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <br />
    <br />
     <div  style="background-image:url('../../Content/Image/banner-curso-degrade.png')">
   <br />
   <br />     
   <h2  style="margin-left:30px; margin-top:30px">Pedidos > </h2>
   <br />     
    <br />
         </div>
   
    <div class="container">
       <div class="btn-group">
           <asp:Button ID="btnSubmit" data-target="#myModal" data-toggle="modal" class="btn-info" runat="server" Text="Submit"          
           ></asp:Button>
       </div>
</div>


<%--Bootstrap Modal Dialog--%>
<div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
       <div class="modal-dialog">
           <div class="modal-content">
               <div class="modal-header">
                   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                   <h4 class="modal-title">Validation Errors List for HP7 Citation</h4>
               </div>
               <div class="modal-body">
               </div>
               <div class="modal-footer">
                   <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
               </div>
           </div>
       </div>
</div>
   <script>
$(document).ready(function(){
  $('[data-toggle="myModal"]').tooltip();
});
</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
