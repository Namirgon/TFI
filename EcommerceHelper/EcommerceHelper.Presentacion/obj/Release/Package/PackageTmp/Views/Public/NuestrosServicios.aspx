<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="NuestrosServicios.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Public.NuestrosServicios" %>
<%@ MasterType VirtualPath="~/Shared/PaginaMaestra.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
     <link rel="stylesheet" href="../../Content/css/bootstrap.min.css" />
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <br />
   <br />  
    <br />
   <br />  
    
 <div  style="background-image:url('../../Content/Image/banner-curso-degrade.png')">
   <br />
   <br />     

    <asp:Label ID="NuestrosServicios2" runat="server"  style="margin-left:30px; margin-top:30px; font-size:24px"  ClientIDMode="Static"></asp:Label>
  
   <br />     
   <br />
     </div>
<div id="fila1" class="row"  >
 
    <div  class="col-md-4">
   <br />
   <br />     
        <h3 style="margin-left:15px "><asp:Label runat ="server" ID="FullPack" ClientIDMode="Static"></asp:Label> <br /> </h3>
        <p style="margin-left:15px " >
            <asp:Label runat ="server" ID="Contactanos2" ClientIDMode="Static"></asp:Label> <br /> 
            <asp:Label runat ="server" ID="Contactanos3" ClientIDMode="Static"></asp:Label> <br /> 
           <asp:Label runat ="server" ID="Contactanos5" ClientIDMode="Static"></asp:Label> <br /> 
          
        </p>  
        <p style="margin-left:15px "> 
          <asp:LinkButton ID="Comprar2" runat="server" class="btn btn-primary" href="IniciarSesion.aspx" ClientIDMode="Static"></asp:LinkButton></p>
     
        <img style="margin-left:15px " src="../../Content/Image/sravintage.jpg"/ >
       
         </div>
    <div class="col-md-4">
   <br />
   <br />     
        <h2 ><asp:Label runat ="server" ID="Contactanos11" ClientIDMode="Static"></asp:Label> </h2>
        <p> <asp:Label runat ="server" ID="Contactanos7" ClientIDMode="Static"></asp:Label> <br /> 
            <asp:Label runat ="server" ID="Contactanos8" ClientIDMode="Static"></asp:Label> <br /> 
           <asp:Label runat ="server" ID="Contactanos9" ClientIDMode="Static"></asp:Label> <br /> 
          <asp:Label runat ="server" ID="Contactanos10" ClientIDMode="Static"></asp:Label> <br /> 
           
         </p>
        
        <p> <asp:LinkButton ID="Comprar3" runat="server" class="btn btn-primary" href="IniciarSesion.aspx" ClientIDMode="Static"></asp:LinkButton></p>
        <img style="width:75%"  src="../../Content/Image/sillon.png"/>
        
        
     
    </div>
    <div class="col-md-4">
   <br />
   <br />     
        <h2><asp:Label runat ="server" ID="Contactanos12" ClientIDMode="Static"></asp:Label></h2>

        <p >
            <asp:Label runat ="server" ID="Contactanos13" ClientIDMode="Static"></asp:Label> <br /> 
            <asp:Label runat ="server" ID="Contactanos14" ClientIDMode="Static"></asp:Label> <br /> 
            <asp:Label runat ="server" ID="Contactanos15" ClientIDMode="Static"></asp:Label> <br /> 
            <asp:Label runat ="server" ID="Contactanos16" ClientIDMode="Static"></asp:Label> <br /> 
     </p>
          <p> <asp:LinkButton ID="Comprar4" runat="server" class="btn btn-primary" href="IniciarSesion.aspx" ClientIDMode="Static"></asp:LinkButton></p>
         <img  style="width:70%" src="../../Content/Image/Limpiezadecortinas.jpg" alt=""/>
      
        
    </div>
    </div>
      <br />
    <br />
    <div  id="fila2"class="row"  >

    
    <div  class="col-md-4">
         <h3 style="margin-left:15px ">  <asp:Label runat ="server" ID="Contactanos17" ClientIDMode="Static"></asp:Label>  </h3>
        <p style="margin-left:15px " >
            <asp:Label runat ="server" ID="Contactanos18" ClientIDMode="Static"></asp:Label> <br />
            <asp:Label runat ="server" ID="Contactanos19" ClientIDMode="Static"></asp:Label> <br />
            <asp:Label runat ="server" ID="Contactanos20" ClientIDMode="Static"></asp:Label> <br />
            <asp:Label runat ="server" ID="Contactanos6" ClientIDMode="Static"></asp:Label> <br />
      
          
         <br />
        
        </p>  
           <p style="margin-left:15px ">
             <asp:LinkButton ID="Comprar" runat="server" class="btn btn-primary" href="IniciarSesion.aspx" ClientIDMode="Static"></asp:LinkButton></p>
         <img style="width:60%; border: groove; margin-left:15px " alt=""  src="../../Content/Image/domestica2.png"/>
      
         </div>
    <div class="col-md-4">
        <h2 ><asp:Label runat ="server" ID="Contactanos21" ClientIDMode="Static"></asp:Label></h2>
        <p>  <asp:Label runat ="server" ID="Contactanos22" ClientIDMode="Static"></asp:Label> <br />
             <asp:Label runat ="server" ID="Contactanos23" ClientIDMode="Static"></asp:Label> <br />
             <asp:Label runat ="server" ID="Contactanos24" ClientIDMode="Static"></asp:Label> <br />
             <asp:Label runat ="server" ID="Contactanos25" ClientIDMode="Static"></asp:Label> <br />

         <br />
        
        </p>
          <p> <asp:LinkButton ID="Comprar5" runat="server" class="btn btn-primary" href="IniciarSesion.aspx" ClientIDMode="Static"></asp:LinkButton></p>
         <img  style="width:65%" src="../../Content/Image/pisoexteior.jpg" alt=""/>
      
      
        
     
    </div>
    <div class="col-md-4">
        <h2><asp:Label runat ="server" ID="Contactanos26" ClientIDMode="Static"></asp:Label></h2>

            <p >
                 <asp:Label runat ="server" ID="Contactanos27" ClientIDMode="Static"></asp:Label> <br />
                 <asp:Label runat ="server" ID="Contactanos28" ClientIDMode="Static"></asp:Label> <br />
                 <asp:Label runat ="server" ID="Contactanos29" ClientIDMode="Static"></asp:Label> <br />
                 <asp:Label runat ="server" ID="Contactanos30" ClientIDMode="Static"></asp:Label> <br />
                <br/>
                       
                 <br/></p>
             <p>  <asp:LinkButton ID="Presupuesto" runat="server" class="btn btn-primary" href="Presupuesto.aspx" ClientIDMode="Static"></asp:LinkButton></p>
             <img  alt="" style="width:75%" src="../../Content/Image/cocina2.jpg"/>
           
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

