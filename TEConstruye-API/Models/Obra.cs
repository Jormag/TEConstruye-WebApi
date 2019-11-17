using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TEConstruye_API.Models
{
    public class Obra
    {
        public int IDObra { get; set; }
        public string Nombre { get; set; }
        public int IDUbicacion { get; set; }
        public int Habitaciones { get; set; }
        public int Baños { get; set; }
        public int Pisos { get; set; }
        public int MetrosCuadradosConstruccion { get; set; }
        public int MetrosCuadradosLote { get; set; }
        public int IDIngeniero1 { get; set; }
        public Nullable<int> IDIngeniero2 { get; set; }
        public Nullable<int> IDIngeniero3 { get; set; }
        public int IDCliente { get; set; }
    }
}