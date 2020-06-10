<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/PaginaMaestraCliente.Master" AutoEventWireup="true" CodeBehind="MenuPrincipal.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Public.MenuPrincipal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <link rel="stylesheet" href="../../Content/css/font-awesome.min.css" />
     <link rel="stylesheet" href="../../Content/css/bootstrap.min.css" />
    <link href="../../Content/css/bootstrap.css" rel="stylesheet" type="text/css" />
     <script src="../../Content/Scripts/modernizr-2.6.2.js"></script>
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
   <br /> 

   <div  style="background-image:url('../../Content/Image/banner-curso-degrade.png')">
   <br />
   <br />     
   <h2  style="margin-left:30px; margin-top:30px">Nuestros Servicios</h2>
   <br />     
   <br />
   </div>
 <div class="tab-pane active" id="panel-810103">
 <div class="row">
    <asp:Repeater ID="InfoServicio" runat="server" ClientIDMode="Static">
        <HeaderTemplate>

      <%--  <ul> --%> 
        </HeaderTemplate>
        <ItemTemplate>
  
            <div  class="col-sm-4 col-lg-4 col-md-4">
                <div class="thumbnail" style="text-align: center;">
              <%--  <li>--%>
                   <div >
                       <br />
                       <br />
                       <br />
                       <div class="caption">
                      
                        <h2><%# Eval("Titulo")%></h2>

                          <a runat="server" href='<%#Eval("IdServicio")%>'><img src='/Content/Image/<%# Eval("URLImagen")%>' class="img-responsive col-md-12"/></a>
                    
                        <h3><%# Eval("Descripcion")%></h3>
                        <strong><p>$<span><%# Eval("Precio")%></span></strong></p>
                    </div>
                    <div class="item-toolbar">
                    <asp:Button ID="btncomprar" class="btn btn-primary" runat="server" Text="Comprar" />
                      </div>
</div>
                    </div>
            </div>
        
        </ItemTemplate>
        <FooterTemplate>

      <%--    </ul>--%>
        </FooterTemplate>

    </asp:Repeater>

     </div>

     </div>
     

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
