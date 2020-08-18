using System.Configuration;
using System.Runtime.Serialization;

namespace EcommerceHelper.BLL.Helpers
{
   public  class ConfigSection: ConfigurationSection

    {
        [IgnoreDataMember()]
        public static ConfigSection Default
        {
            get { return (ConfigSection)ConfigurationManager.GetSection("EcommerceHelper/BLL"); }
        }

        [ConfigurationProperty("site")]
        public SiteConfigurationElement Site
        {
            get { return (SiteConfigurationElement)this["site"]; }
            set { this["site"] = value; }
        }

       
        [DataContract()]
        public class SiteConfigurationElement : ConfigurationElement
        {
            [DataMember()]
            [ConfigurationProperty("NumeroDocumento", IsRequired = true)]
            public string NumeroDocumento
            {
                get { return (string)this["NumeroDocumento"]; }
                set { this["NumeroDocumento"] = value; }
            }
        }
       

       
        
    }
}
