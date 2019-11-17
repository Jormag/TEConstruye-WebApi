using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TEConstruye_API.Models
{
    public class CompraMateriales
    {
        public int IDCompraMateriales { get; set; }
        public Nullable<int> Factura { get; set; }
        public int IDMaterial { get; set; }
        public Nullable<int> Cantidad { get; set; }
        public Nullable<int> TotalPrecioMaterial { get; set; }
    }
}