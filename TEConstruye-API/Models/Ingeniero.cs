﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TEConstruye_API.Models
{
    public class Ingeniero
    {
        public int Cedula { get; set; }
        public string Nombre { get; set; }
        public string Apellido1 { get; set; }
        public string Apellido2 { get; set; }
        public int IDEspecialidad { get; set; }
        public int Telefono { get; set; }
        public int Codigo { get; set; }
    }
}