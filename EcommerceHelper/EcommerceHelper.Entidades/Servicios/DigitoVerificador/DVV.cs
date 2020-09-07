using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.Entidades.Servicios
{
   public class DVV : BaseEntidad
    {
        public override int Id { get; set; }
        public string dvv { get; set; }
        public string tabla { get; set; }
    }
}
