<%@ Page Language="C#"  MasterPageFile="~/Shared/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="TusServicios.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Public.Tus_Servicios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <link rel="stylesheet" href="../../Content/css/bootstrap.min.css" />
     <link rel="stylesheet" href="../../Content/css/bootstrap.css" />
    <link rel="stylesheet" href="../../Content/css/bootstrap-grid.css" />
     <link rel="stylesheet" href="../../Content/css/bootstrap.css" />



</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
 <div>
   <br />
   <br />     
   <br />
               <h2  style="margin-left:30px"> &nbsp;</h2>
     <h2  style="margin-left:30px">Tus Servicios</h2>
   <br />
   <br />     
   <br />
        <br />
     
<div style="border:groove; background-image:url('../../Content/Image/banner2.jpg'); background-size:cover">
   
   <br />
    <br />
    
        <header  style="background-color:lightgrey; font-size:large;  "> 

            <div  style="margin-left: 250px;" >
               
                <nav id="nav" >
                    <p ">
                    <a style="font-size:20px; align-content:center; color:black;  " href="../Public/IniciarSesion.aspx">Detalle Servicio > </a>
                    <a style="font-size:20px; color:black;" href="../Public/NuestrosServicios.aspx">Tus Servicios > </a>
                   <%-- <a style="font-size:20px; color:black;" href="../Private/IniciarSesionIntranet.aspx">Mi Direccion > </a>
                   <a style="font-size:20px; color:black;" href="../Private/IniciarSesionIntranet.aspx">Pago > </a>
                     <a style="font-size:20px; color:black;" href="../Private/IniciarSesionIntranet.aspx">Resumen</a>--%>
                    </p>
                </nav>
                   
            </div>
        </header>
     <div style="margin-left: 250px; margin-right:50px">
       <br />
       <br />
     <table class="table-bordered col-md-11" id="tlbPedido">
                <thead>
                    <tr>
                        <th class="text-center"><asp:Label runat="server" Font-Bold="true" class="control-label col-xs-2" Text="Servicio"></asp:Label></th>
                        <th class="text-center"><asp:Label runat="server" Font-Bold="true" class="control-label col-xs-2" Text=" Descripcion "></asp:Label></th>
                        <th class="text-center"><asp:Label runat="server" Font-Bold="true" class="control-label col-xs-2" Text="PrecioUnitario"></asp:Label></th>
                        <th class="text-center"><asp:Label runat="server" Font-Bold="true" class="control-label col-xs-2" Text=" Cantidad"></asp:Label></th>
                        <th class="text-center"><asp:Label runat="server" Font-Bold="true" class="control-label col-xs-2" Text="Sub-Total"></asp:Label></th>  
                    </tr>
                     <tr>
                        <th class="text-center">
                            <asp:Image ID="ImagenServicio" runat="server" /></th>
                        <th class="text-center"><p id="DetalleServicio"></p></th>
                        <th class="text-center"><p id="PrecioUnitario"></p></th>
                         <th class="text-center"><p id="Cantidad"></p></th>
                        <th class="text-center"><p id="Sub-Total"></p></th>
                      </tr>
                </thead>
         </table>
        <br />
       <br />
   <asp:Button style="margin-left:400px " ID="Button1" runat="server" Text="Aceptar"  Width="150px"  PostBackUrl ="~/Views/Public/MiDireccion.aspx" />
   <asp:Button style="margin-left:100px " ID="Button2" runat="server" Text="Cancelar" Width="150px"  PostBackUrl ="~/Views/Public/Default.aspx" />
   <br />
   <br />

       <br />
       <br />
         </div>
    
</div>
 </div>


     </asp:content>