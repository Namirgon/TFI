using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EcommerceHelper.Presentacion.Helpers.DTO
{
    public class ListaServicio
    {
        public ServicioEntidad Titulo { get; set; }

        public ServicioEntidad Descripcion { get; set; }

        public ServicioEntidad Precio { get; set; }


    }
}