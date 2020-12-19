using EcommerceHelper.BLL;
using EcommerceHelper.BLL.Managers;
using EcommerceHelper.BLL.Servicios;
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
    public partial class GestionDePermisos : System.Web.UI.Page, IObservador
    {

        FamiliaBLL ManagerFamilia = new FamiliaBLL();
        List<IFamPat> PermisosTodos = new List<IFamPat>();
        List<IFamPat> PermisosCbo = new List<IFamPat>();
        List<IFamPat> LisAuxAsig;
        List<IFamPat> LisAuxDisp;
        List<IFamPat> LisAuxAsigBKP = new List<IFamPat>();
        public HttpContext Current = HttpContext.Current;//xxxxx
        private List<object> ListaResultado = new List<object>(); //xxxxx
        List<MultiIdiomaEntidad> Traducciones; // xxxxx
        public GestionDePermisos() : base()
        {



            IObservable.AgregarObservador(this); //xxxxxxxx copiar en formularios xxxxxxx
        }
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
                //idioma = (IdiomaEntidad)Session["Idioma"];
                //if (idioma == null)
                //{
                //    idioma = new IdiomaEntidad();
                //    idioma.Descripcion = "es";
                //    Session["Idioma"] = idioma;
                //}

                Traducciones = new List<MultiIdiomaEntidad>();

                Traducciones = IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl;


            }
            else
            {
                // crear ddl de idioma en master page administracion 

                //idioma.Descripcion = Master.obtenerIdiomaCombo();
               // Session["Idioma"] = idioma;
            }

            //DropDownList lblIdioma = FindControlFromMaster<DropDownList>("ddlIdioma");
            //if (lblIdioma != null)
            //{
            //    lblIdioma.SelectedValue = idioma.Descripcion;
            //}
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
            string[] unosPermisosTest = new string[] { "GestionPermisos" };
            if (usuarioentidad == null || !this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("../Private/MenuAdministracion.aspx");
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

       

        protected void btnAltaFamilia_Click(object sender, EventArgs e)
        {

            IFamPat nuevaFamilia = new Familia();
            System.Text.StringBuilder sb = new System.Text.StringBuilder();

            if (string.IsNullOrWhiteSpace(txtName.Text))
            {
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("alert('Debe ingresar un nombre para la Familia a crear');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                           "AltaFaltaNom", sb.ToString(), false);
            }
            else
            {
                //Verificar que quede al menos un permiso asignado
                if (LisAuxAsig == null || LisAuxAsig.Count == 0)
                {
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("alert('Por favor revisar que la Familia posea al menos una patente asignada');");
                    sb.Append(@"</script>");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                               "AltaNoPatentes", sb.ToString(), false);
                }
                else
                {
                    if (LisAuxAsig != null && LisAuxAsig.Count == 1 && LisAuxAsig.First().CantHijos > 0)
                    {
                        sb.Append(@"<script type='text/javascript'>");
                        sb.Append("alert('La Familia a crear no puede contener solamente una familia');");
                        sb.Append(@"</script>");
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                                   "AltaUnaFamilia", sb.ToString(), false);
                    }
                    else
                    {
                        try
                        {
                            //FamiliaBuscar en BD lo reemplazo por una consulta en Linq
                            if (PermisosTodos.Any(X => X.NombreIFamPat.ToLower() == txtName.Text.ToLower()))
                            {
                                sb.Append(@"<script type='text/javascript'>");
                                sb.Append("alert('Ya existe una Familia con el nombre ingresado');");
                                sb.Append(@"</script>");
                                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                                           "ExisteNombreFamilia", sb.ToString(), false);
                            }
                            else
                            {
                                nuevaFamilia.NombreIFamPat = txtName.Text;
                                (nuevaFamilia as Familia).ElementosFamPat = LisAuxAsig;

                                if (ManagerFamilia.FamiliaCrear(nuevaFamilia))
                                {
                                   ServicioLog.CrearLogEventos("Crear Familia", "Familia " + txtName.Text + " creada correctamente", usuarioentidad.Apellido, usuarioentidad.IdUsuario.ToString());

                                    PermisosTodos = ManagerFamilia.PermisosTraerTodos();
                                    PermisosCbo = PermisosTodos.Where(X => X.CantHijos > 0).ToList();
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

                                    //ListarPermisos(PermisosTodos, treeTodos);
                                    txtName.Text = "";
                                    cboFamilia.SelectedIndex = (cboFamilia.Items.Count - 1);
                                    //treeTodos.CollapseAll();

                                    //sb.Append(@"<script type='text/javascript'>");
                                    //sb.Append("alert('Familia creada correctamente');");
                                    //sb.Append(@"</script>");
                                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                                    //           "CrearFamiliaOK", sb.ToString(), false);
                                }
                            }
                        }
                        catch (Exception es)
                        {
                            ServicioLog.CrearLog(es, "GestionPermisos - btnCrear_Click", usuarioentidad.Apellido, usuarioentidad.IdUsuario.ToString() );
                            Response.Redirect("../../Shared/Error.aspx");
                        }
                    }
                }
            }

        }

        protected void btnModificarFamilia_Click(object sender, EventArgs e)
        {
            IFamPat AModifFamilia = new Familia();
            List<IFamPat> FamQuitarMod = new List<IFamPat>();
            List<IFamPat> FamAgregarMod = new List<IFamPat>();
            System.Text.StringBuilder sb = new System.Text.StringBuilder();

            if (string.IsNullOrWhiteSpace(txtName.Text))
            {
                sb.Append(@"<script type='text/javascript'>");
             
                sb.Append("alert('Debe ingresar un nombre para la Familia a modificar');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                           "ModifFaltaNom", sb.ToString(), false);
            }
            else
            {
                //Verificar que quede al menos un permiso asignado
                if (LisAuxAsig.Count == 0)
                {
                    sb.Append(@"<script type='text/javascript'>");
                   
                    sb.Append("alert('Por favor revisar que la Familia posea al menos una patente asignada');");
                    sb.Append(@"</script>");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                               "ModifNoPatentes", sb.ToString(), false);
                }
                else
                {
                    if (LisAuxAsig.Count == 1 && LisAuxAsig.First().CantHijos > 0)
                    {
                        sb.Append(@"<script type='text/javascript'>");
                      
                        sb.Append("alert('La Familia no puede contener solamente una familia');");
                        sb.Append(@"</script>");
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                                   "ModifUnaFamilia", sb.ToString(), false);
                    }
                    else
                    {
                        try
                        {
                            //Verificar que no existe una Familia con el nombre ingresado en la modificacion
                            Familia FamAux2 = null;
                            if (cboFamilia.SelectedItem.Text != txtName.Text)
                                FamAux2 = ManagerFamilia.FamiliaBuscar(txtName.Text);
                            if (FamAux2 != null && FamAux2.IdIFamPat > 0)
                            {
                                sb.Append(@"<script type='text/javascript'>");
                   
                                sb.Append("alert('Ya existe una Familia con el nombre ingresado');");
                                sb.Append(@"</script>");
                                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                                           "ModifUnaFamilia", sb.ToString(), false);
                            }
                            else
                            {
                                AModifFamilia.IdIFamPat = Int32.Parse(cboFamilia.SelectedItem.Value);
                                AModifFamilia.NombreIFamPat = txtName.Text;

                                LisAuxAsigBKP = (List<IFamPat>)Current.Session["LisAuxAsigBKP"];
                                FamQuitarMod = LisAuxAsigBKP.Where(d => !LisAuxAsig.Any(a => a.NombreIFamPat == d.NombreIFamPat)).ToList();
                                FamAgregarMod = LisAuxAsig.Where(d => !LisAuxAsigBKP.Any(a => a.NombreIFamPat == d.NombreIFamPat)).ToList();

                                if (ManagerFamilia.FamiliaModificar(AModifFamilia, FamQuitarMod, FamAgregarMod))
                                {
                                    int Seleccionado = cboFamilia.SelectedIndex;
                                    PermisosTodos = ManagerFamilia.PermisosTraerTodos();
                                    PermisosCbo = PermisosTodos.Where(X => X.CantHijos > 0).ToList();
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

                                   
                                    cboFamilia.SelectedIndex = Seleccionado;
                                    LisAuxAsigBKP = LisAuxAsig.ToList();
                                    Current.Session["LisAuxAsigBKP"] = LisAuxAsigBKP;

                                    ServicioLog.CrearLogEventos("Modificar Familia", "Familia " + cboFamilia.SelectedItem.Text + " modificada correctamente", usuarioentidad.Apellido, usuarioentidad.IdUsuario.ToString());
                                   
                                    //sb.Append(@"<script type='text/javascript'>");
                                    //sb.Append("alert('Familia modificada correctamente');");
                                    //sb.Append(@"</script>");
                                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                                    //           "CrearOK", sb.ToString(), false);
                                }
                            }
                        }
                        catch (Exception es)
                        {
                            ServicioLog.CrearLog(es, "frmFamiliaGestion - btnModificar_Click", usuarioentidad.Apellido  , usuarioentidad.IdUsuario.ToString());
                            Response.Redirect("../../Shared/Error.aspx");
                        }
                    }
                }
            }
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
                                //sb.Append(@"<script type='text/javascript'>");
                               
                                //sb.Append("alert('Familia eliminada correctamente');");
                                //sb.Append(@"</script>");
                                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                                //           "EliminarOK", sb.ToString(), false);
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
                ServicioLog.CrearLog(es, "GestionPermisos - Eliminar Familia", usuarioentidad.Apellido, usuarioentidad.Nombre);
                Response.Redirect("../Shared/Error.aspx");
            }
        }
        void IObservador.Traducirme()
        {

            ListaResultado.Clear();
            RecorrerControles(this);



            Traducciones = IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl;

            try
            {

                foreach (Control Control in ListaResultado)
                {
                    //if (Control.ID == "CerrarSesion")
                    //    Control.ID = Control.ID;
                    //string tipo;
                    //tipo = Control.GetType().ToString();
                    foreach (var traduccion in Traducciones)
                    {



                        if (Equals(Control.ID, traduccion.NombreDelControl))
                        {
                            //string tipo;
                            //tipo = Control.GetType().ToString();
                            //ESTO SON LOS <a>
                            if (Control is Label lbltradu)
                            {

                                lbltradu.Text = traduccion.Texto;

                            }
                            //ESTOS SON LOS INPUT CON TYPE TEXT O PASSWORD
                            else if (Control is TextBox)
                            {

                                var mapeo = (TextBox)Control;
                                mapeo.Text = traduccion.Texto;
                            }
                            //ESTOS SON LOS <BUTTON>
                            else if (Control is IButtonControl)
                            {
                                var mapeo = (IButtonControl)Control;
                                mapeo.Text = traduccion.Texto;
                            }
                            //ESTOS SON LOS <INPUT> TYPE BUTTON O SUBMIT
                            else if ((Control) is LinkButton)
                            {
                                var mapeo = (LinkButton)Control;
                                mapeo.Text = traduccion.Texto;
                            }
                            else if (Control is Button)
                            {
                                var mapeo = (Button)Control;
                                mapeo.Text = traduccion.Texto;
                            }

                        }

                    }

                }

            }
            catch (Exception es)
            {
                throw;
            }

        }
        private void RecorrerControles(Control pObjetoContenedor)
        {
            foreach (Control Controlobj in pObjetoContenedor.Controls)
            {
                ListaResultado.Add(Controlobj);

                //if ((Controlobj) is System.Web.UI.WebControls.DropDownList)
                //{
                //    RecorrerDropDown(((System.Web.UI.WebControls.DropDownList)Controlobj));
                //}


                if (Controlobj.Controls.Count > 0)
                {
                    RecorrerControles(Controlobj);
                }

                ListaResultado.Add(Controlobj);
            }
        }

        private void RecorrerDropDown(System.Web.UI.WebControls.DropDownList pMenuStrip)
        {
            ListaResultado.Add(pMenuStrip);
            foreach (System.Web.UI.WebControls.ListItem item in pMenuStrip.Items)
            {
                ListaResultado.Add(item);
            }


        }
    }
}