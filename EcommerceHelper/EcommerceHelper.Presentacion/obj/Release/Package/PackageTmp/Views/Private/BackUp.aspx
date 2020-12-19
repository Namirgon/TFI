<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/PaginaMaestraAdministracion.Master" AutoEventWireup="true" CodeBehind="BackUp.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Private.BackUp" %>
<%@ MasterType VirtualPath="~/Shared/PaginaMaestraAdministracion.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
        
                <h2 style="margin-left:60px" > <asp:Label ID="BackUp2" runat="server" ClientIDMode="Static" > </asp:Label>
                </h2>
          
   <br />
   <br />     
   <br />
<div style="border:groove; background-image:url('../../Content/Image/bannerIntranet.jpg'); background-size:cover; height:400px">
   
   <br />
   <br />
   <br />     
   <br />
   
    <div class="container paddingPaginas">
        
        <div class="form-group">
            <div class="col-md-8 col-md-offset-2">
                 <div>
                     <br />
                     <br />     
                     <br />
                    <asp:Label Id="Nombre" ClientIDMode="Static" runat="server" style="color:aliceblue ; font-size: 20px; margin-left:100px; margin-right:20px" />
                     <asp:TextBox ID="txtNombreArchivo"  runat="server" placeholder=" Ingrese Nombre " Width="260px" ></asp:TextBox><br /><br />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtNombreArchivo"></asp:RequiredFieldValidator>
 
                    <%-- <asp:UpdatePanel ID="up1" runat="server">
                         <ContentTemplate>
                                                  --%>

                             <asp:Button ID="Aceptar" runat="server" Text="Backup " OnClick="btnUpload_Click1" class="btn btn-primary " style="margin-left:100px" Width="156px" />
                               <asp:Button ID="Cancelar" runat="server" ClientIDMode="Static" OnClick="Cancelar_Click1" style="margin-left:40px" class="btn btn-primary " Width="162px" CausesValidation="false" />
                          
                       <%--  </ContentTemplate>
                         <Triggers>
                             <asp:PostBackTrigger ControlID="Aceptar" />
                         </Triggers>
                     </asp:UpdatePanel>--%>
                 </div>
            </div>
        </div>
    </div>
</div>

   </div>
        </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
