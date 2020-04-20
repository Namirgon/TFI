<%@ Page Language="C#" MasterPageFile="~/Shared/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Presupuesto.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Public.Presupuesto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
     <link rel="stylesheet" href="../../Content/css/font-awesome.min.css" />
     <link rel="stylesheet" href="../../Content/css/bootstrap.min.css" />
     <link rel="stylesheet" href="../../Content/css/bootstrap.css" />
     <script src="../../Content/Scripts/modernizr-2.6.2.js"></script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
   <br />
   <br />     
   <br />
<div class="mibody" style="background-image:url('../../Content/Image/banner-curso-degrade.png')" >
   
   <div >
   <br />
   <br />     
   <br />
   <h2  style="margin-left:30px">Pedi tu presupuesto!</h2>
   <br />
   <br />     
   <br />
    </div>
    </div>
    <div style="border:groove; background-image:url('../../Content/Image/banner2.jpg'); background-size:cover">
   <br />
   <br />
   <div class="container">
   <label>DNI </label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input placeholder="Numero de DNI" style="width:300px">
   </div>
<div class="container">
           <label >Nombre: </label><input style=" width:250px" type="text" name="nombre" id="nombre" placeholder="Nombre" tabindex="1" class="input input-2" required>
           <label style="margin-left:30px">Apellidos: </label><input  style="margin-left:30px; width:250px"" type="text" name="apellidos" id="apellidos" placeholder="Apellidos" tabindex="2" class="input input-2" required>
</div>
<div class="container">
           <label >Email: </label><input  style="margin-left:195px; width:400px" type="text" name="email" id="email" placeholder="Email" tabindex="3" class="input input-1" required>
</div>
 <div class="container">     
         <label> Calle </label>  <input  placeholder="Calle" style="width:300px; margin-left:197px">

   <label> Numero  <input placeholder="Numero" style="width:80px; margin-left:50px"></label>
   
   <label> Piso<input placeholder="Piso" style="width:80px; margin-left:50px"/> </label> 
   <br />
</div>
 <div class="container">  

<input style=" width: 800px; height: 150px; margin-left: 100px"/>
         </div>
  <br />
 <br />
        
   <asp:Button style="margin-left:350px " ID="Button1" runat="server" Text="Enviar"  Width="150px" PostBackUrl ="url('~/Views/Public/Direccion.aspx')"/>
   <asp:Button style="margin-left:100px " ID="Button2" runat="server" Text="Cancelar" Width="150px" />
   <br />
   <br />
   <br />
   <br />
    </div>

</asp:Content>