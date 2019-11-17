using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TEConstruye_API.Models
{
    public class ObraMateriales
    {
        public int IDObraMateriales { get; set; }
        public int IDObra { get; set; }
        public int IDEtapa { get; set; }
        public int IDMaterial { get; set; }
        public Nullable<int> Cantidad { get; set; }
    }
}