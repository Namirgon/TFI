﻿<%@ Page Language="C#" MasterPageFile="~/Shared/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Presupuesto.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Public.Presupuesto" %>

<%@ MasterType VirtualPath="~/Shared/PaginaMaestra.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
     <link rel="stylesheet" href="../../Content/EstilosPermisos.css" />
    
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
   <h2  style="margin-left:30px"><asp:Label runat ="server" ID="Presupuesto2" ClientIDMode="Static"></asp:Label></h2>
   <br />
   <br />     
   <br />
    </div>
    </div>
    <div style="border:groove; background-image:url('../../Content/Image/banner2.jpg'); background-size:cover">
   <br />
   <br />
       
      <div style="width:1000px"> 
           <fieldset>
         
                 <legend>
           <asp:Label runat ="server" ID="Nombre" ClientIDMode="Static"></asp:Label> <input style=" width:250px" type="text"  id="txtnombre"  runat="server" class="input"  />
              
           <asp:Label runat ="server" ID="Apellido" ClientIDMode="Static"></asp:Label><input  style=" width:250px" type="text"  id="txtapellidos" runat="server"  class="input " /></legend>
    <legend>
             <asp:Label runat ="server" ID="EtiquetaEmail" ClientIDMode="Static"></asp:Label><input  style="margin-left:15px; width:400px" type="text"  id="txtemail" runat="server"  class="input " /></legend>
            <legend>
             <asp:Label runat ="server" ID="Calle" ClientIDMode="Static"></asp:Label> <input  id="txtcalle" runat="server"  style="width:300px; margin-left:20px"/>

         
             <asp:Label runat ="server" ID="Numero" ClientIDMode="Static"></asp:Label><input style="width:80px; margin-left:50px;" id="txtaltura" runat="server" />
              
             <asp:Label runat ="server" ID="Piso" ClientIDMode="Static"></asp:Label><input style="width:80px; margin-left:50px;" id="txtpiso" runat="server" /></legend>
    
         <br />
      
        <textarea style=" width: 800px; height: 150px;" rows="5" cols="50" id="txttexto" runat="server"></textarea>


       
               </fieldset>
 <br />
 <br />
        
   <asp:Button style="margin-left:350px " ID="Aceptar" runat="server" Text="Enviar"  Width="150px" onClick="Enviar_Click"/>
   <asp:Button style="margin-left:100px " ID="Cancelar" runat="server" Text="Cancelar" Width="150px"  OnClick="Cancelar_Click"/>
   <br />
   <br />
   <br />
   <br />
          </div>  
           
   </div>

</asp:Content>