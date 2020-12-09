using EcommerceHelper.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Label = System.Web.UI.WebControls.Label;

namespace EcommerceHelper.Presentacion
{
    public class IdiomaHelper
    {
      
        public static void Traducir(Control control)
        {
            if (control == null || control.ID == null)
                return;

            if (control.ID == "lbl")
            {
                LabelTexto ctr = (LabelTexto)control.Parent;
                ctr.Label = IdiomaBLL.getInstance().GetTexto(ctr.ID);
                return;
            }
            string tradu = IdiomaBLL.getInstance().GetTexto(control.ID);
            if (string.IsNullOrWhiteSpace(tradu))
                return;
            if (control is Label _lbl)
                _lbl.Text = tradu;
            if (control is HyperLink _link)
                _link.Text = tradu;
            if (control is LinkButton _link2)
                _link2.Text = tradu;
            if (control is Button _btn)
                _btn.Text = tradu;
        }
    }
}