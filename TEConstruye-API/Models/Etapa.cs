using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TEConstruye_API.Models
{
    public class Etapa
    {
        public int IDEtapa { get; set; }
        public int IDObra { get; set; }
        public string Descripcion { get; set; }
        public Nullable<int> TrabajoPreliminar { get; set; }
        public Nullable<int> Cimiento { get; set; }
        public Nullable<int> Paredes { get; set; }
        public Nullable<int> ConcretoReforzado { get; set; }
        public Nullable<int> Techos { get; set; }
        public Nullable<int> Cielos { get; set; }
        public Nullable<int> Repello { get; set; }
        public Nullable<int> Entrepisos { get; set; }
        public Nullable<int> Pisos { get; set; }
        public Nullable<int> Enchapes { get; set; }
        public Nullable<int> InstalacionPluvial { get; set; }
        public Nullable<int> InstalacionSanitaria { get; set; }
        public Nullable<int> InstalacionElectrica { get; set; }
        public Nullable<int> Puertas { get; set; }
        public Nullable<int> Cerrajeria { get; set; }
        public Nullable<int> Ventanas { get; set; }
        public Nullable<int> Closets { get; set; }
        public Nullable<int> MuebleCocina { get; set; }
        public Nullable<int> Pintura { get; set; }
        public Nullable<int> Escaleras { get; set; }
    }
}