<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Public.Default" %>
<%@ Import Namespace="System.IO" %>
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

       
                  <asp:Label ID="ldlDefaultCentroUno" runat="server" " Text="<%$Resources:Global, DefaultCentroUno %>"></asp:Label>
         
            <br />
              <asp:Label ID="ldlDefaultCentroDos" runat="server" " Text="<%$Resources:Global, DefaultCentroDos %>"></asp:Label>
           
        

    </div>

    <br />
    <br />

    <div class="row" style="background-image: url('../../Content/Image/banner-curso-degrade.png')">
        <div class="col-md-4">
            <br />
            <br />
            <h2 class="lead" style="margin-left: 15px">Servicios</h2>

            <br />
            <p style="margin-left: 15px">
                Somos una empresa de Servicio Domestico que quiere ayudarte a simplificarte la vida!
                <br />
                Contamos con peronal capacitado en multiples tareas, puntuales, de confianza y con amplia experiencia.
            </p>

            <p style="margin-left: 15px">
                En Helper ofrecemos diferentes servicios de limpieza domestica. Incluyendo servicios de interior como dormitorios, cocinas, comedores, living, playroom, etc. Exterior, quinchos, patios entre otros.
            limpieza de ventanales, alfombras, limpieza en seco.
            </p>
        </div>

        <div class="col-md-4">
            <br />
            <br />
            <h2 class="lead">Contratanos</h2>
            <br />
            <p>Quieres conocer nuestros servicios  y todo lo que Helper te puede ofrecer?   </p>

            <p>
                Limpieza Interior<br />
                Limpieza Exterior<br />
                Limpieza de Tapizados y Alfombras<br />
                Limpieza de Cortinas , Ventanales y mucho mas!<br />
                Arma un plan a tu medida<br />
            </p>
            <br />
            <p><a class="btn btn-secondary" href="NuestrosServicios.aspx">Comprar</a></p>
            <br />
            <br />

        </div>
        <div class="col-md-4">
            <br />
            <br />
            <h2 class="lead">Contacto</h2>
            <br />
            <p>
                Contacto 0237- 4641111
                <br />
                Direccion: Av. Siempreviva 742 - Sprinfield
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
