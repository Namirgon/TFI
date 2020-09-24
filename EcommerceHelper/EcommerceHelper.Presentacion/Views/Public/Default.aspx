<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Public.Default" %>
<%@ Import Namespace="System.IO" %>
<%@ MasterType VirtualPath="~/Shared/PaginaMaestra.Master" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="../../Content/css/bootstrap.css "  />  
    <link rel="stylesheet" href="../../Content/css/bootstrap-grid.min.css" />
     <link rel="stylesheet" href="../../Content/css/font-awesome.min.css" />
    <script src="../../Content/Scripts/jquery-1.10.2.min.js"></script>
    <script src="../../Content/Scripts/bootstrap.min.js"></script>
    <script src="../../Content/Scripts/modernizr-2.6.2.js"></script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >

    <div class="jumbotron">
       

        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>
            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="../../Content/Image/Carrusel/slide.jpg" alt="First slide" style="width: 100%">
                </div>
                <div class="carousel-item">
                    <img src="../../Content/Image/Carrusel/slide1.jpg" style="width: 100%" alt="Second slide">
                </div>

                <div class="carousel-item">
                    <img src="../../Content/Image/Carrusel/slide2.jpg" style="width: 100%" alt="Third slide">
                </div>
            </div>

            <!-- Controls -->

            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">

                <span class="icon-prev"></span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="icon-prev"></span>
            </a>
        </div>

    </div>
    <div class="text-center">

       
                  <asp:Label ID="ldlDefaultCentroUno" runat="server"  Text="<%$Resources:Global, DefaultCentroUno %>"></asp:Label>
         
            <br />
                 <asp:Label ID="ldlDefaultCentroDos" runat="server"  Text="<%$Resources:Global, DefaultCentroDos %>"></asp:Label>
           
        

    </div>

    <br />
    <br />

    <div class="row" style="background-image: url('../../Content/Image/banner-curso-degrade.png')">
        <div class="col-md-4">
            <br />
                      
            <br />
            <asp:Label ID="lblServicios" style="margin-left: 15px; font-size:24px"  runat="server" Text="<%$Resources:Global, Servicios %>"></asp:Label>
            
            <br />

            <br />
            <p style="margin-left: 15px">
                 <asp:Label ID="LblServicios1" style="margin-left: 15px; font-size:16px"  runat="server" Text="<%$Resources:Global, Servicios1 %>"></asp:Label>
            
               
                <br />
                <asp:Label ID="lblServicios2" style="margin-left: 15px; font-size:16px"  runat="server" Text="<%$Resources:Global, Servicios2 %>"></asp:Label>
            
              
            </p>

            <p style="margin-left: 15px">
                  <asp:Label ID="lblServicios3" style="margin-left: 15px; font-size:16px"  runat="server" Text="<%$Resources:Global, Servicios3 %>"></asp:Label>
          
            </p>
        </div>

        <div class="col-md-4">
            <br />
            <br />
              <asp:Label ID="lblContactanos" style="margin-left: 15px; font-size:24px"  runat="server" Text="<%$Resources:Global, Contactanos %>"></asp:Label>
            <br />
              <asp:Label ID="lblContactanos1" style="margin-left: 15px; font-size:16px"  runat="server" Text="<%$Resources:Global, Contactanos1 %>"></asp:Label>
            
            <p>
              <asp:Label ID="lblContactanos2" style="margin-left: 15px; font-size:16px"  runat="server" Text="<%$Resources:Global, Contactanos2 %>"></asp:Label> <br />
                 <asp:Label ID="lblContactanos3" style="margin-left: 15px; font-size:16px"  runat="server" Text="<%$Resources:Global, Contactanos3 %>"></asp:Label> <br />
                 <asp:Label ID="lblContactanos4" style="margin-left: 15px; font-size:16px"  runat="server" Text="<%$Resources:Global, Contactanos4 %>"></asp:Label> <br />
                 <asp:Label ID="lblContactanos5" style="margin-left: 15px; font-size:16px"  runat="server" Text="<%$Resources:Global, Contactanos5 %>"></asp:Label> <br />
                 <asp:Label ID="lblContactanos6" style="margin-left: 15px; font-size:16px"  runat="server" Text="<%$Resources:Global, Contactanos6 %>"></asp:Label> <br />
              <br />
             <br />
          
            </p>
            <br />
            <asp:LinkButton ID="btnComprar" runat="server" CssClass="btn-group-lg" OnClick="btnComprar_Click" text="<%$Resources:Global, Comprar %>"></asp:LinkButton>
            <%--<p><a class="btn btn-secondary" href="NuestrosServicios.aspx" ></a></p>--%>
            <br />
            <br />

        </div>
        <div class="col-md-4">
            <br />
            <br />
                          <asp:Label ID="lblContacto" style="margin-left: 15px; font-size:24px"  runat="server" Text="<%$Resources:Global, Contacto %>"></asp:Label>
           
            <br />
            <p>
                      <asp:Label ID="lblContacto1" style="margin-left: 15px; font-size:16px"  runat="server" Text="<%$Resources:Global, Contacto1 %>"></asp:Label>
              
                <br />
                <asp:Label ID="lblContacto2" style="margin-left: 15px; font-size:16px"  runat="server" Text="<%$Resources:Global, Contacto2 %>"></asp:Label>
              
               
                <br />
                Email : contacto@helper.com
                <br />
                <img style="width: 4%" src="../../Content/Image/tweeter.png" />
                Twitter: Helper-Arg
                <br />
                <img style="width: 4%" src="../../Content/Image/instagram.png" />
                Instagram: Helper-Arg
                <br />
                <img style="width: 4%" src="../../Content/Image/facebook1.png" />
                Facebook: Helper-Arg
                <br />
            </p>
            <br />
            <br />
        </div>
        <br />
    </div>
    <br />
    <br />


</asp:Content>
