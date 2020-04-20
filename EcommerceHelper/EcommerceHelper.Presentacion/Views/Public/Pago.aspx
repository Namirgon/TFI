<%@ Page Language="C#" MasterPageFile="~/Shared/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Pago.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Private.Pago" %>

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
     <h2  style="margin-left:30px">Pago</h2>
   <br />
   <br />     
   <br />
        <br />
 </div>   
<div style="border:groove; background-image:url('../../Content/Image/banner2.jpg'); background-size:cover">
   
   <br />
    <br />
    
        <header  style="background-color:lightgrey; font-size:large;  "> 

            <div  style="margin-left: 250px;" >
               
                <nav id="nav" >
                    <p ">
                    <a style="font-size:20px; align-content:center; color:black;  " href="../Public/IniciarSesion.aspx">Detalle Servicio > </a>
                    <a style="font-size:20px; color:black;" href="../Public/NuestrosServicios.aspx">Tus Servicios > </a>
                    <a style="font-size:20px; color:black;" href="../Private/IniciarSesionIntranet.aspx">Mi Direccion > </a>
                   <a style="font-size:20px; color:black;" href="../Private/IniciarSesionIntranet.aspx">Pago > </a>
                   <%--  <a style="font-size:20px; color:black;" href="../Private/IniciarSesionIntranet.aspx">Resumen</a>--%>
                    </p>
                </nav>
                   
            </div>
        </header>
 </div>
     </asp:content>