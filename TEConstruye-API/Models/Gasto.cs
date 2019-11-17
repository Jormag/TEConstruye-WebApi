using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TEConstruye_API.Models
{
    public class Gasto
    {
        public int IDGasto { get; set; }
        public int IDObra { get; set; }
        public Nullable<int> IDProveedor { get; set; }
        public Nullable<int> IDFactura { get; set; }
        public byte[] Foto { get; set; }
    }
}