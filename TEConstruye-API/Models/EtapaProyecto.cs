using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TEConstruye_API.Models
{
    public class EtapaProyecto
    {
        public int IDEtapaProyecto { get; set; }
        public int IDObra { get; set; }
        public int IDEtapa { get; set; }
        public System.DateTime FechaInicio { get; set; }
        public Nullable<System.DateTime> FechaFin { get; set; }
        public Nullable<int> Presupuesto { get; set; }
    }
}