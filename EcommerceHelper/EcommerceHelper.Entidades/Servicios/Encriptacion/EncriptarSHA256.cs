using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.Entidades.Servicios
{
   public class EncriptarSHA256: Encriptador
    {

        public EncriptarSHA256(string _valorInicial)
        {
            valorInicial = _valorInicial;
        }

        public override int IdDVV { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }

        public override string Hashear()
        {
            SHA512 SHA256 = SHA512Managed.Create();
            byte[] bytes = Encoding.UTF8.GetBytes(this.valorInicial);
            byte[] hash = SHA256.ComputeHash(bytes);
            StringBuilder stringBuilder = new StringBuilder();
            for (int i = 0; i <= hash.Length - 1; i++)
            {
                stringBuilder.Append(hash[i].ToString("X2"));
            }

            return stringBuilder.ToString();
        }
    }
}
