<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/PaginaMaestraCliente.Master" AutoEventWireup="true" CodeBehind="MenuPrincipal.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Public.MenuPrincipal" %>

<%@ MasterType VirtualPath="~/Shared/PaginaMaestraCliente.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
   <div  style="background-image:url('../../Content/Image/banner-curso-degrade.png')">
   <br />
   <br />     
   <h2  style="margin-left:30px; margin-top:30px">Nuestros Servicios</h2>
   <br />     
   <br />
   </div>

        <%--    ---------------------------------------------- carga de menu de servicios ---------------------------------------------------%>
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
                              <%--  <% if (this.Master.Autenticar("Desear"))
                                                    {%>
                         <asp:Button ID="btncomprar" class="btn btn-success btn-comprar" runat="server" Text="Comprar" onclick="onBtnAddClick(this)" />   {%> --%>
                          
                   <input type="button" value="Comprar " clientidmode="static" class="btn btn-success btn-comprar" runat="server" data-producto='<%#Eval("IdServicio")%>' />
                   
                                                <% if (this.Master.Autenticar("Desear"))
                                                    {%>
                                                <input type="button" class="btn btn-info" clientidmode="static" runat="server" data-producto='<%#Eval("IdServicio")%>' value= " Desear "  onclick="onBtnAddClick(this)" />
                                                <%}%>
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
     
        <%--    ---------------------------------------------- fin de carga de menu de servicios ---------------------------------------------------%>

        <%--        --------------------------------------------------- display de carrito de compra -------------------------------------------%>

     <div class="modal fade" tabindex="-1" role="dialog">
        <div id="mdl_servicio_agregado">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header text-center">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h3 class="modal-title" style="color: #29ab29;"><asp:Label ID="Label4" runat="server" Text="Felicitaciones"></asp:Label></h3>
                    </div>
                    <div class="modal-body text-center">
                        <h4 id="mdl_servicio_titulo" style="color: black;"><asp:Label ID="Label1" runat="server" Text="ElServicio"></asp:Label> <span id="servicio"></span><asp:Label ID="Label2" runat="server" Text="ServicioCorrectamenteAgregadoAlCarrito"></asp:Label></h4>
                    </div>
                    <div class="modal-footer">
                        <div class="text-center">
           
                            <button type="button" id="btn-pedidos" class="btn btn-warning" style="width: 200px;"><asp:Label ID="Label3" runat="server" Text="IrAPedidos"></asp:Label></button>
          
                            <asp:Button ID="Button1" runat="server" Text="SeguirComprando" class="btn" style="width: 200px; background-color: black; color: #fff;" data-dismiss="modal" />

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
           <%--        --------------------------------------------------- fin display de carrito de compra -------------------------------------------%>
</asp:Content>
<asp:Content ContentPlaceHolderID="ScriptSection" ID="Scripts"  runat="server">
     <script>
        OcultarBreadcrumb();

    </script>
</asp:Content>
