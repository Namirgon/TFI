﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/PaginaMaestraCliente.Master" AutoEventWireup="True" CodeBehind="MenuPrincipal.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Public.MenuPrincipal" %>

<%@ MasterType VirtualPath="~/Shared/PaginaMaestraCliente.Master" %>

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
       <asp:Label ID="LblNuestrosServicios" runat="server"  style="margin-left:30px; margin-top:30px" Text="<%$Resources:Global, NuestrosServicios %>"></asp:Label>
 
   <br />     
   <br />
   </div>

     <%--   <%--    ---------------------------------------------- carga de menu de servicios Version 1 ---------------------------------------------------%>
<div class="tab-pane active" id="panel-810103" >
  <div class="row" runat="server">
  
         <asp:Repeater ID="InfoServicio" runat="server" ClientIDMode="Static"  >
         <HeaderTemplate>
          
          </HeaderTemplate>
        <ItemTemplate>
            <div  class="col-sm-4 col-lg-4 col-md-4" runat="server">
                <div class="thumbnail" style="text-align: center;" runat="server">
              <%--  <li>--%>
                   <div >
                       <br />
                       <br />
                       <br />
                        <div class="caption" runat="server">     

                            <%--<h2><%# Eval("Titulo")%></h2>--%>
                            <asp:Label ID="lblTitulo" runat="server" Text='<%# Eval("Titulo")%> ' Font-Size="25px"></asp:Label>
                        
                            <br />
                            
                        <%--<a runat="server" href='<%#Eval("IdServicio")%>'><img src='/Content/Image/<%# Eval("URLImagen")%>' class="img-responsive col-md-12" id="IdServicio" /></a>--%>
                          <asp:Label ID="LblIdServicio" runat="server" Text='<%#Eval("IdServicio")%>' Visible="false"></asp:Label>
                            <a runat="server"><img src='/Content/Image/<%# Eval("URLImagen")%>' class="img-responsive col-md-12" /></a>
                           
                             <%--<h3><%# Eval("Descripcion")%></h3>--%>
                            <asp:Label ID="lblDescripcion" runat="server" Text='<%# Eval("Descripcion")%>' Font-Size="20px"></asp:Label>
                           
                        <%--<strong><p style="font-size:larger;">$<span><%# Eval("Precio")%></span></strong></p></div>--%>
                      <p style="font-size:larger;">$ <asp:Label ID="lblPrecio" runat="server" Text='<%# Eval("Precio")%>' Font-Size="25px"></asp:Label></p>

                        </div>
                         <div class="item-toolbar">
                             <asp:Button ID="BtnComprar" runat="server" Text="<%$Resources:Global, Comprar %>"  data-target="#mdl_servicio_agregado" data-toggle="modal" onclick="BtnComprar_Click"  class="btn btn-primary btn-lg" UseSubmitBehavior="false"/>

                            <%--<Button type="button" runat="server"  data-target="#mdl_servicio_agregado" data-toggle="modal"   class="btn btn-primary btn-lg "   ID="BtnComprar"  onclick="BtnComprar_Click"  >Comprar</Button>--%>
                           
                         </div>
                   </div>
                </div>
            </div>        
        </ItemTemplate>
            <FooterTemplate>
         
            </FooterTemplate>
             
    </asp:Repeater>
  </div>
</div>
   
        <%--    ---------------------------------------------- fin de carga de menu de servicios ---------------------------------------------------%>
      
        <%--        --------------------------------------------------- display de carrito de compra -------------------------------------------%>

     <div class="modal fade" id="mdl_servicio_agregado">    
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header text-center"> <%--encabezado de la ventana--%>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">&times;</button>
                        <h3 class="modal-title" style="color: #29ab29;">"Felicitaciones"</h3>
                    </div> <%--fin del encabezado de la ventana --%>
                    <div class="modal-body text-center"> <%--Cuerpo de la ventana--%>
                       
                        
                         <h4 style="color: black;"><asp:Label ID="Label2" runat="server"  Text="<%$Resources:Global, AgregadoAlCarrito %>"><%# Eval("Titulo")%></asp:Label></h4>
                   
                    </div>
                    <div class="modal-footer">
                        <div class="text-center">
                          
                         
                         <button type="button" ID="btnpedidos"  class="btn btn-warning" style="width: 200px;"><asp:Label ID="Label3" runat="server" Text="<%$Resources:Global, IrAPedidos %>">><a href="Pedido.aspx" style="text-decoration:none"></a></asp:Label></button>
                            <asp:Button ID="BtnSeguirComprando" runat="server"  Text="<%$Resources:Global, SeguirComprando %>"> class="btn" style="width: 200px; background-color: black; color: #fff;" data-dismiss="modal" />

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
