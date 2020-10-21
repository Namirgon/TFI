<%@ Page Language="C#" MasterPageFile="~/Shared/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Presupuesto.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Public.Presupuesto" %>

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
   <h2  style="margin-left:30px">Pedi tu presupuesto!</h2>
   <br />
   <br />     
   <br />
    </div>
    </div>
    <div style="border:groove; background-image:url('../../Content/Image/banner2.jpg'); background-size:cover">
   <br />
   <br />
           
           <div class="container" >
           <label >Nombre: </label><input style=" width:250px" type="text"  id="txtnombre"  runat="server" class="input"  />
           <label style="margin-left:30px">Apellidos: </label><input  style=" width:250px" type="text"  id="txtapellidos" runat="server"  class="input " />
            </div>
        <div class="container">
           <label >Email: </label><input  style="margin-left:15px; width:400px" type="text"  id="txtemail" runat="server"  class="input " />
        </div>
         <div class="container">     
         <label> Calle </label>  <input  id="txtcalle" runat="server"  style="width:300px; margin-left:20px"/>

          <label> Numero  <input style="width:80px; margin-left:50px;" id="txtaltura" runat="server" /></label>
             <label> Piso  <input style="width:80px; margin-left:50px;" id="txtpiso" runat="server" /></label>
    
         <br />
        </div>
         <div class="container"> 
        <textarea style=" width: 800px; height: 150px;" rows="5" cols="50" id="txttexto" runat="server"></textarea>


         </div>
 <br />
 <br />
        
   <asp:Button style="margin-left:350px " ID="Enviar" runat="server" Text="Enviar"  Width="150px" onClick="Enviar_Click"/>
   <asp:Button style="margin-left:100px " ID="Cancelar" runat="server" Text="Cancelar" Width="150px"  OnClick="Cancelar_Click"/>
   <br />
   <br />
   <br />
   <br />
   </div>

</asp:Content>