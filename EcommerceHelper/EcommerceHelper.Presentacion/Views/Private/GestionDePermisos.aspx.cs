using EcommerceHelper.BLL;
using EcommerceHelper.BLL.Managers;
using EcommerceHelper.Entidades;
using EcommerceHelper.Funciones.Seguridad;
using Entidades.Servicios.Permisos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceHelper.Presentacion.Views.Private
{
    public partial class GestionDePermisos : BasePage
    {

        FamiliaBLL ManagerFamilia = new FamiliaBLL();
        List<IFamPat> PermisosTodos = new List<IFamPat>();
        List<IFamPat> PermisosCbo = new List<IFamPat>();
        List<IFamPat> LisAuxAsig;
        List<IFamPat> LisAuxDisp;
        List<IFamPat> LisAuxAsigBKP = new List<IFamPat>();
        HttpContext Current = HttpContext.Current;

        private UsuarioEntidad usuarioentidad = new UsuarioEntidad();

        private IdiomaEntidad idioma;


        protected T FindControlFromMaster<T>(string name) where T : Control
        {
            MasterPage master = this.Master;
            while (master != null)
            {
                T control = master.FindControl(name) as T;
                if (control != null)
                    return control;

                master = master.Master;
            }
            return null;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            idioma = new IdiomaEntidad();
            if (!IsPostBack)
            {
                idioma = (IdiomaEntidad)Session["Idioma"];
                if (idioma == null)
                {
                    idioma = new IdiomaEntidad();
                    idioma.Descripcion = "es";
                    Session["Idioma"] = idioma;
                }
            }
            else
            {
                // crear ddl de idioma en master page administracion 

                idioma.Descripcion = Master.obtenerIdiomaCombo();
                Session["Idioma"] = idioma;
            }

            DropDownList lblIdioma = FindControlFromMaster<DropDownList>("ddlIdioma");
            if (lblIdioma != null)
            {
                lblIdioma.SelectedValue = idioma.Descripcion;
            }
            usuarioentidad = (UsuarioEntidad)Session["Usuario"];

            // DropDownList de permisos
            PermisosTodos = ManagerFamilia.PermisosTraerTodos();
            PermisosCbo= PermisosTodos.Where(X => X.CantHijos > 0).ToList();
            Familia FamAux = new Familia();
            FamAux.IdIFamPat = -1;
            FamAux.NombreIFamPat = "";
            PermisosCbo.Insert(0, FamAux);
            if (!IsPostBack)
            {
                cboFamilia.Items.Clear();
                cboFamilia.DataSource = null;
                cboFamilia.DataSource = PermisosCbo;
                cboFamilia.DataTextField = "NombreIFamPat";
                cboFamilia.DataValueField = "IdIFamPat";
                cboFamilia.DataBind();
                LisAuxDisp = PermisosTodos.ToList();
                LisAuxAsig = new List<IFamPat>();
             
                ListarPermisos(LisAuxDisp, treeDisponibles);
                treeDisponibles.CollapseAll();
                Current.Session["PermisosDisp"] = LisAuxDisp;
                Current.Session["PermisosAsig"] = LisAuxAsig;
            }
            else
            {
                LisAuxDisp = (List<IFamPat>)Current.Session["PermisosDisp"];
                LisAuxAsig = new List<IFamPat>();
                LisAuxAsig = (List<IFamPat>)Current.Session["PermisosAsig"];
            }

        }

        public void ListarPermisos(List<IFamPat> PermisosVer, TreeView treePermisos)
        {
            treePermisos.Nodes.Clear();
            foreach (IFamPat item in PermisosVer)
            {
                TreeNode Padre = new TreeNode();
                Padre.Text = item.GetType().Name.ToString() + ": " + item.NombreIFamPat;
                Padre.Value = item.NombreIFamPat;
                Padre.Expand();
                treePermisos.Nodes.Add(Padre);
                if (item.CantHijos > 0)
                    ListarYAgregarSubPermisos((item as Familia).ElementosFamPat, Padre);
            }
        }


        public void ListarYAgregarSubPermisos(List<IFamPat> PermisosVer, TreeNode elNodo = null)
        {
            int I = 0;

            do
            {
                TreeNode NodoHijo = null;
                if (elNodo == null)
                {
                    elNodo = new TreeNode();
                    elNodo.Text = PermisosVer[I].GetType().Name.ToString() + ": " + PermisosVer[I].NombreIFamPat;
                    elNodo.Value = PermisosVer[I].NombreIFamPat;
                }
                else
                {
                    NodoHijo = new TreeNode(PermisosVer[I].GetType().Name.ToString() + ": " + PermisosVer[I].NombreIFamPat);
                    NodoHijo.Collapse();
                    elNodo.ChildNodes.Add(NodoHijo);
                }
                if (PermisosVer[I].CantHijos > 0)
                    ListarYAgregarSubPermisos((PermisosVer[I] as Familia).ElementosFamPat, NodoHijo);
                I++;
            } while (I < PermisosVer.Count);
        }


        protected void cboFamilia_SelectedIndexChanged(object sender, EventArgs e)
        {
            LisAuxAsig = new List<IFamPat>();
            int IdFamiliaCbo = Int32.Parse(cboFamilia.SelectedValue);
            LisAuxAsig = (PermisosCbo.First(X => X.IdIFamPat == IdFamiliaCbo) as Familia).ElementosFamPat.Where(x => x.IdIFamPat > 0).ToList();
            LisAuxAsigBKP = LisAuxAsig.ToList();
            Current.Session["LisAuxAsigBKP"] = LisAuxAsigBKP;
            LisAuxDisp = new List<IFamPat>();
            LisAuxDisp = PermisosTodos.ToList();
            FiltrarDisponibles(ref LisAuxDisp, LisAuxAsig);
            LisAuxDisp.RemoveAll(X => X.IdIFamPat == IdFamiliaCbo);
            Current.Session["PermisosDisp"] = LisAuxDisp;
            Current.Session["PermisosAsig"] = LisAuxAsig;
            ListarPermisos(LisAuxAsig, treeAsignados);
            ListarPermisos(LisAuxDisp, treeDisponibles);
            if (IdFamiliaCbo > 0)
            {
                btnAltaFamilia.Enabled = false;
                btnModificarFamilia.Enabled = true;
                btnEliminarFamilia.Enabled = true;
                txtName.Text = cboFamilia.SelectedItem.Text;
                txtName.ReadOnly = false;
                btnAgregar.Enabled = true;
                btnQuitar.Enabled = true;
            }
            else
            {
                btnAltaFamilia.Enabled = true;
                btnModificarFamilia.Enabled = false;
                btnEliminarFamilia.Enabled = false;
                txtName.Text = "";
                txtName.ReadOnly = true;
                btnAgregar.Enabled = false;
                btnQuitar.Enabled = false;
            }
            treeDisponibles.CollapseAll();
            treeAsignados.CollapseAll();

        }

        public void FiltrarDisponibles(ref List<IFamPat> PerDisp, List<IFamPat> PerAsig)
        {
            PerDisp = PerDisp.Where(d => !PerAsig.Any(a => a.NombreIFamPat == d.NombreIFamPat)).ToList();

            foreach (IFamPat item in PerAsig)
            {
                if (item.CantHijos > 0)
                    FiltrarSubpermisos(item as Familia, ref PerDisp);
            }
        }


        public void FiltrarSubpermisos(Familia fam, ref List<IFamPat> disp)
        {
            disp = disp.Where(d => !fam.ElementosFamPat.Any(a => a.NombreIFamPat == d.NombreIFamPat)).ToList();
            foreach (IFamPat item in fam.ElementosFamPat)
            {
                if (item.CantHijos > 0)
                    FiltrarSubpermisos(item as Familia, ref disp);
            }
        }


        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();

            if (treeDisponibles.SelectedNode == null || treeDisponibles.SelectedNode.Parent != null)
            {
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("alert('Por favor seleccione la Familia que contiene el permiso seleccionado o la patente requerida en forma directa');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                           "AgregarClickMsj1", sb.ToString(), false);
            }
            else
            {
                //Verificar que no se esté agregando una referencia circular
                IFamPat unPerAux = LisAuxDisp.FirstOrDefault(X => X.NombreIFamPat == treeDisponibles.SelectedNode.Value && treeDisponibles.SelectedNode.Parent != null);
                if (unPerAux != null && unPerAux.CantHijos > 0)
                {
                    if ((LisAuxDisp.Where(X => X.NombreIFamPat == treeDisponibles.SelectedNode.Value) as Familia).ElementosFamPat.Any(X => X.NombreIFamPat == (cboFamilia.SelectedItem.Text)))
                    {
                        sb.Append(@"<script type='text/javascript'>");
                        sb.Append("alert('No se puede agregar una referencia circular de Permisos');");
                        sb.Append(@"</script>");
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                                   "AgregarClickMsj2", sb.ToString(), false);
                    }
                }
                else
                {
                    LisAuxAsig.Add(LisAuxDisp.First(X => X.NombreIFamPat == treeDisponibles.SelectedNode.Value));

                    LisAuxDisp = PermisosTodos.ToList();
                    FiltrarDisponibles(ref LisAuxDisp, LisAuxAsig);
                    int IdFamiliaCboAux = Int32.Parse(cboFamilia.SelectedValue);
                    LisAuxDisp.RemoveAll(X => X.IdIFamPat == IdFamiliaCboAux);
                    ListarPermisos(LisAuxAsig, treeAsignados);
                    ListarPermisos(LisAuxDisp, treeDisponibles);
                    Current.Session["PermisosDisp"] = LisAuxDisp;
                    Current.Session["PermisosAsig"] = LisAuxAsig;
                    treeAsignados.CollapseAll();
                    treeDisponibles.CollapseAll();
                }
            }
        }

        protected void btnQuitar_Click(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();

            if (treeAsignados.SelectedNode == null || treeAsignados.SelectedNode.Parent != null)
            {
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("alert('Por favor seleccione la Familia que contiene el permiso seleccionado o la patente requerida en forma directa');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                           "QuitarClickMsj1", sb.ToString(), false);
            }
            else
            {
                LisAuxAsig.Remove(LisAuxAsig.First(X => X.NombreIFamPat == treeAsignados.SelectedNode.Value));
                LisAuxDisp = PermisosTodos.ToList();
                FiltrarDisponibles(ref LisAuxDisp, LisAuxAsig);
                int IdFamiliaCboAux = Int32.Parse(cboFamilia.SelectedValue);
                LisAuxDisp.RemoveAll(X => X.IdIFamPat == IdFamiliaCboAux);
                ListarPermisos(LisAuxAsig, treeAsignados);
                ListarPermisos(LisAuxDisp, treeDisponibles);
                Current.Session["PermisosDisp"] = LisAuxDisp;
                Current.Session["PermisosAsig"] = LisAuxAsig;
                treeAsignados.CollapseAll();
                treeDisponibles.CollapseAll();
            }
        }

        protected void treeTodos_SelectedNodeChanged(object sender, EventArgs e)
        {

        }

        protected void btnAltaFamilia_Click(object sender, EventArgs e)
        {

        }

        protected void btnModificarFamilia_Click(object sender, EventArgs e)
        {

        }

        protected void btnEliminarFamilia_Click(object sender, EventArgs e)
        {
            UsuarioBLL ManagerUsuario = new UsuarioBLL();
            List<UsuarioEntidad> UsuariosComprometidos = new List<UsuarioEntidad>();
            List<UsuarioEntidad> UsuariosConFamiliaAEliminar = new List<UsuarioEntidad>();
            List<IFamPat> PerAgregar = new List<IFamPat>();
            List<IFamPat> PerQuitar = new List<IFamPat>();
            System.Text.StringBuilder sb = new System.Text.StringBuilder();

            try
            {
                if (Int32.Parse(cboFamilia.SelectedValue) > 0)
                {
                    if (cboFamilia.SelectedItem.Text == "Cliente" | cboFamilia.SelectedItem.Text == "Empleado" | cboFamilia.SelectedItem.Text == "Admin")
                    {
                        sb.Append(@"<script type='text/javascript'>");
                        sb.Append("alert('No pueden eliminarse las familias por defecto Cliente, Empleado o Admin');");
                        sb.Append(@"</script>");
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                                   "EliminarDefecto", sb.ToString(), false);
                    }
                    else
                    {
                        UsuariosConFamiliaAEliminar = ManagerFamilia.FamiliaUsuariosAsociados(Int32.Parse(cboFamilia.SelectedValue));
                        UsuariosComprometidos = ManagerFamilia.FamiliaUsuariosComprometidos(Int32.Parse(cboFamilia.SelectedValue));
                        if (UsuariosComprometidos.Count > 0)
                        {
                            List<string> LisUs = new List<string>();
                            foreach (UsuarioEntidad unUs in UsuariosComprometidos)
                            {
                                LisUs.Add(unUs.Email);
                            }
                            string UsuariosCompString = string.Join(Environment.NewLine, LisUs);

                            // Agregar msj de que no se puede eliminar la Familia porque los usuarios "UsuariosCompString", la tienen asignada como único permiso
                            sb.Append(@"<script type='text/javascript'>");
                            sb.Append("alert('No se puede eliminar la familia porque los siguientes usuarios la poseen asignada como único permiso: ");
                            sb.Append(UsuariosCompString + "');");
                            sb.Append(@"</script>");
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                                       "EliminarClickMsj2", sb.ToString(), false);
                        }
                        else
                        {
                            PerQuitar.Add(PermisosCbo.Where(X => X.IdIFamPat == Int32.Parse(cboFamilia.SelectedValue)).First());

                            //Modifico los permisos de los usuarios que no están comprometidos
                            PerAgregar.Clear(); //Limpio para que no agregue permisos a los usuarios no comprometidos
                            foreach (UsuarioEntidad unUs in UsuariosConFamiliaAEliminar.Where(x => !UsuariosComprometidos.Any(y => y.IdUsuario == x.IdUsuario)).ToList())
                            {
                                ManagerUsuario.UsuarioModificarPermisos(PerAgregar, PerQuitar, unUs.Email);
                            }

                            if (ManagerFamilia.FamiliaEliminar(Int32.Parse(cboFamilia.SelectedValue)))
                            {
                                //Resguardo el nombre de la familia eliminada para el log
                                string FamiliaLog = cboFamilia.Text;

                                PermisosTodos = ManagerFamilia.PermisosTraerTodos();
                                PermisosCbo = PermisosTodos.Where(X => X.CantHijos > 0).ToList();
                                txtName.Text = "";
                                Familia FamAux = new Familia();
                                FamAux.IdIFamPat = -1;
                                FamAux.NombreIFamPat = "";
                                PermisosCbo.Insert(0, FamAux);
                                cboFamilia.Items.Clear();
                                cboFamilia.DataSource = null;
                                cboFamilia.DataSource = PermisosCbo;
                                cboFamilia.DataTextField = "NombreIFamPat";
                                cboFamilia.DataValueField = "IdIFamPat";
                                cboFamilia.DataBind();

                                LisAuxDisp = PermisosTodos.ToList();
                                LisAuxAsig = new List<IFamPat>();
                                LisAuxAsigBKP = new List<IFamPat>();
                         
                                ListarPermisos(LisAuxDisp, treeDisponibles);
                                ListarPermisos(LisAuxAsig, treeAsignados);
                                ServicioLog.CrearLogEventos("Eliminar Familia", "Familia " + FamiliaLog + " eliminada correctamente", usuarioentidad.Apellido, usuarioentidad.IdUsuario.ToString());
                                treeAsignados.CollapseAll();
                                treeDisponibles.CollapseAll();
                                sb.Append(@"<script type='text/javascript'>");
                               
                                sb.Append("alert('Familia eliminada correctamente');");
                                sb.Append(@"</script>");
                                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                                           "EliminarOK", sb.ToString(), false);
                            }
                        }
                    }
                }
                else
                {
                    sb.Append(@"<script type='text/javascript'>");
                  
                    sb.Append("alert('Debe seleccionar una Familia para eliminarla');");
                    sb.Append(@"</script>");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                               "EliminarSeleccionar", sb.ToString(), false);
                }

            }
            catch (Exception es)
            {
                ServicioLog.CrearLog(es, "GestionPermisos - Eliminar Familia", usuarioentidad.Apellido, usuarioentidad.IdUsuario.ToString());
                Response.Redirect("../Shared/Error.aspx");
            }
        }
    }
}