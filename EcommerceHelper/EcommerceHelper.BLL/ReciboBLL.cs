using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EcommerceHelper.Entidades;
using EcommerceHelper.DAL;

namespace EcommerceHelper.BLL
{
    public class ReciboBLL
    {

        public bool PagarOrdenDeTrabajo(string elNroTarjeta, int elCodSeg, decimal elMonto)
        {
            using (SWTarjeta .ServicioPagoClient unServicioPago = new SWTarjeta.ServicioPagoClient())
            {
                return unServicioPago.ProcesarPago(elNroTarjeta, elMonto);
            }

        }


        public int RegistrarPago(ReciboEntidad elPago)
        {
            try
            {

                ReciboDAL GestorPago = new ReciboDAL();
                GestorPago.Insert(elPago);

                return 0;
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
