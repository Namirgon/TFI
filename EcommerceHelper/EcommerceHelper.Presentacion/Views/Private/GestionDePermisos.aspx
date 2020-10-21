<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/PaginaMaestraAdministracion.Master" AutoEventWireup="true" CodeBehind="GestionDePermisos.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Private.GestionDePermisos" %>

<%@ MasterType VirtualPath="~/Shared/PaginaMaestraAdministracion.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="../../Content/css/bootstrap.css" rel="stylesheet" />
 <link href="../../Content/EstilosPermisos.css" rel="Stylesheet" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       <br />
   <br />     
   <br />
<div class="mibody" >
   
   <div  >
       
   <br />     
   <br />
           <asp:Label ID="lblGestionDePermisos" runat="server" style="margin-left:30px; font-size:24px" Text="<%$Resources:Global, GestiondePermisos %>"></asp:Label>
    

   <br />
   <br />     
   <br />
<div style="background-color:gainsboro; ">
   
   <br />
   <br />
   <br />
     <div class="row">
            <div class="col-md-4" style="margin-left:180px">
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            
            <div class="col-md-4">
                <asp:DropDownList ID="cboFamilia" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cboFamilia_SelectedIndexChanged" CssClass="form-control"></asp:DropDownList>

            </div>

     </div>
    <br />
    <br />
          <div class="row">  
             <div class="col-md-4" style="margin-left:100px">
                  <asp:Label ID="lbldisponibles" class="miLabel"  runat="server" Text="<%$Resources:Global, Disponibles %>"></asp:Label> <br />
                <div style="margin-left:70px"> <br />
                <asp:UpdatePanel ID="upTreeDisp" runat="server" UpdateMode="Conditional" >
                    <ContentTemplate>
                        <asp:TreeView ID="treeDisponibles" runat="server" SelectedNodeStyle-CssClass="bg-success"></asp:TreeView>
                       
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnAgregar" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="btnQuitar" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                </div>
                 </div>
            <div class="col-md-2">
            </div>
            <div class="col-md-4">
            <asp:Label ID="lblasignados" class="page-header" runat="server" Text="<%$Resources:Global, Asignados %>"></asp:Label>

      
                <asp:UpdatePanel ID="uptreeAsig" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:TreeView ID="treeAsignados" runat="server" SelectedNodeStyle-CssClass="bg-success"></asp:TreeView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnAgregar" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="btnQuitar" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>

               </div>
           
              </div>
    <br />
      <div class="row">
   
            <div class="col-md-2"  style="margin-left:160px" >
            
                <asp:Button ID="btnAgregar" runat="server" Text="Agregar Patente" OnClick="btnAgregar_Click"   CssClass="btn btn-primary " />
           
            </div>
            <div class="col-md-4">
            </div>

            <div class="col-md-2"  >
           
                <asp:Button ID="btnQuitar" runat="server" Text="Quitar Patente" OnClick="btnQuitar_Click" style=" float:left;" CssClass="btn btn-primary " />
           
            </div>

        </div>


        <hr />
        <div class="row" style="align-content: center; margin-left:300px">
      
            <asp:Button ID="btnAltaFamilia" runat="server" Text="Crear Familia" OnClick="btnAltaFamilia_Click" CssClass="btn btn-primary btn-lg col-md-2" />
       
            <asp:Button ID="btnModificarFamilia" runat="server" Text="Modificar Familia" OnClick="btnModificarFamilia_Click" CssClass="btn btn-primary btn-lg col-md-2"  />
        
            <asp:Button ID="btnEliminarFamilia" runat="server" Text="Eliminar Familia" OnClick="btnEliminarFamilia_Click" CssClass="btn btn-primary btn-lg col-md-2" />
   
        </div>
        <hr />
    <br />
             
    </div>

      </div>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
