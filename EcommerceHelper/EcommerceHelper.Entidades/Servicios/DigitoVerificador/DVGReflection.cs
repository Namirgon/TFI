using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.Entidades.Servicios
{
   public  class DVGReflection: BaseEntidad 
    {

        public override int IdDVV { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }

        public static string GetDVH(object entity)

        {


            string dvh = string.Empty;
            Type t = entity.GetType();

            System.Reflection.PropertyInfo[] properties = t.GetProperties();

            foreach (System.Reflection.PropertyInfo p in properties)
            {

                //Console.WriteLine(p);
                if (p.PropertyType.FullName.Equals(typeof(DateTime).FullName))
                {
                    DateTime date = (DateTime)p.GetValue(entity);
                    dvh += date.ToString("ddMMyyyy");
                }
                else
                {



                    dvh += p.GetValue(entity);
                }
            }


            return dvh;
        }
    }
}
