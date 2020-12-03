<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/PaginaMaestraAdministracion.Master" AutoEventWireup="true" CodeBehind="ReporteDeVentas.aspx.cs" Inherits="EcommerceHelper.Presentacion.Views.Private.ReporteDeVentas" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>



<%@ MasterType VirtualPath="~/Shared/PaginaMaestraAdministracion.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       <br />
   <br />     
   <br />
<div class="mibody" >
   
             <div  >

               <br />  
               <br />
               <br />
               <h2  style="margin-left:30px">Reporte de Ventas</h2>
               <br />
               <br />     
               <br />
                                    <div style="background-image:url('../../Content/Image/bannerIntranet.jpg'); width:auto">
   
                                   <br />
                                   <br />
                                        <div style="font-size:18px; color:aliceblue; margin-left: 300px">
                                            <br />
                                     <asp:Label ID="LbMensaje" runat="server"   Visible="false"></asp:Label>
                                            </div>
                                   <br />
                                    <div class="form-group " style="font-size:16px; color:aliceblue; margin-left:20px; margin-right:20px" >
                                        <asp:label runat="server" text="Fecha de Inicio" ></asp:label>

                                        <asp:textbox runat="server" type="date" ID="FechaInicio" ></asp:textbox>
                                    </div>
                                   
                                     <div class="form-group ">
                                        <asp:label runat="server" text="Fecha Fin" style="font-size:16px; color:aliceblue ; margin-left: 20px; margin-right:20px"></asp:label>

                                        <asp:textbox runat="server" id="FechaFin" type="date" ></asp:textbox>

                                    &nbsp;

                                    </div>
                                        <div class="group-button " style="padding-left:20px; padding-right:20px">
                                         &nbsp;&nbsp;&nbsp;&nbsp;
                                         <asp:Button ID="BtnAceptar" runat="server" Text="Ver Reporte" OnClick="BtnAceptar_Click"  />

                                         <asp:Button ID="BtnPdf" runat="server" Text="Exportar PDF" OnClick="BtnPdf_Click" />

                                        <asp:Button  ID="BtnExcel" runat="server" Text="Exportar a Excel " OnClick="BtnExcel_Click" />

                                            </div>
                                   <br />
                                   <br />
                                   <br />

                                        <center>
                                        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="75%" cssclass="table table-striped " ></rsweb:ReportViewer>

                                            </center>
                                    </div>
            </div>
       
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
