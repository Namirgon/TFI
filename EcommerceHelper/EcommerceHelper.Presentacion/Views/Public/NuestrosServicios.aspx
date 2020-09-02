<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="NuestrosServicios.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Public.NuestrosServicios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
     <link rel="stylesheet" href="../../Content/css/font-awesome.min.css" />
     <link rel="stylesheet" href="../../Content/css/bootstrap.min.css" />
     <link rel="stylesheet" href="../../Content/css/bootstrap.css" />
     <script src="../../Content/Scripts/modernizr-2.6.2.js"></script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >

    
 <div  style="background-image:url('../../Content/Image/banner-curso-degrade.png')">
   <br />
   <br />     

    <asp:Label ID="LblNuestrosServicios" runat="server"  style="margin-left:30px; margin-top:30px" Text="<%$Resources:Global, NuestrosServicios %>"></asp:Label>
  
   <br />     
   <br />
     </div>
<div id="fila1" class="row"  >
 
    <div  class="col-md-4">
   <br />
   <br />     
        <h3 style="margin-left:15px ">Full Pack</h3>
        <p style="margin-left:15px " >
            Limpieza de interior <br /> 
            Limpieza Exterior <br />
            limpieza de alfombras y cortinas<br />
            Consulta planes a tu medida!
        </p>  
        <p style="margin-left:15px "><a class="btn btn-primary" href="IniciarSesion.aspx">Comprar</a></p>
     
        <img style="margin-left:15px " src="../../Content/Image/sravintage.jpg"/ >
       
         </div>
    <div class="col-md-4">
   <br />
   <br />     
        <h2 >Limpieza de Tapizados</h2>
        <p>Limpieza de sillas y sillones <br />
            en Cuero , cuerinas <br />
            Panas y telas<br />
            Recupera la vida de tus muebles! </p>
        
        <p><a class="btn btn-primary" href="IniciarSesion.aspx">Comprar</a></p>
        <img style="width:75%"  src="../../Content/Image/sillon.png"/>
        
        
     
    </div>
    <div class="col-md-4">
   <br />
   <br />     
        <h2>Limpieza de Cortinas</h2>

        <p >

                Cortinas Black-out <br/>
                Cortinas de Tela Tupida <br/>
                Estilos Señoriales y Bando<br/>
                Enrollables y mucho mas! <br/>

        </p>
          <p><a class="btn btn-primary" href="IniciarSesion.aspx">Comprar</a></p>
         <img  style="width:70%" src="../../Content/Image/Limpiezadecortinas.jpg"/>
      
        
    </div>
    </div>
      <br />
    <br />
    <div  id="fila2"class="row"  >

    
    <div  class="col-md-4">
         <h3 style="margin-left:15px ">Limpieza Interior</h3>
        <p style="margin-left:15px " >
            Limpieza dormitorios <br /> 
            Limpieza Baños <br />
            living, cocinas, playroom y mas..<br />
            Consulta planes a tu medida!
        </p>  
           <p style="margin-left:15px "><a class="btn btn-primary" href="IniciarSesion.aspx">Comprar</a></p>
         <img style="width:60%; border: groove; margin-left:15px "   src="../../Content/Image/domestica2.png"/>
      
         </div>
    <div class="col-md-4">
        <h2 >Limpieza Exterior</h2>
        <p>Quinchos, Jardines de invierno <br />
            Explanadas y veredas <br />
            Galerias, Glorietas <br />
            Galerias y mas!!

        </p>
          <p><a class="btn btn-primary" href="IniciarSesion.aspx">Comprar</a></p>
         <img  style="width:65%" src="../../Content/Image/pisoexteior.jpg"/>
      
      
        
     
    </div>
    <div class="col-md-4">
        <h2>Planes</h2>

            <p >

                Arma un plan a tu medida!! <br/>
                Programa tus servicios  <br/>
                Horas diarias, semanales, mensuales.<br/>
                Contamos con el mejor equipo de la zona! <br/></p>
             <p><a class="btn btn-primary" href="Presupuesto.aspx">Pedi tu Presupuesto! </a></p>
             <img  style="width:75%" src="../../Content/Image/cocina2.jpg"/>
           
    </div>

    </div>
     
    <br />
    <br />

    <div style="background-image:url('../../Content/Image/banner-curso-degrade.png')">
        <br />
      <a ><img  src="../../Content/Image/banner.jpg" style="width:95%; margin-left:30px"/></a>
        <br />
        <br />
    </div>

        
</asp:Content>

