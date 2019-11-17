using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TEConstruye_API.Models
{
    public class EmpleadoProyecto
    {
        public int IDEmpleadoProyecto { get; set; }
        public int IDEmpleado { get; set; }
        public int IDObra { get; set; }
        public int Horas { get; set; }
    }
}