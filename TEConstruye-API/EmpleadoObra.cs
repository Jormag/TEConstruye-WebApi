//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TEConstruye_API
{
    using System;
    using System.Collections.Generic;
    using System.Runtime.Serialization;

    [DataContract]
    public partial class EmpleadoObra
    {
        [DataMember]
        public int IDEmpleado { get; set; }
        [DataMember]
        public int IDObra { get; set; }
        [DataMember]
        public int Horas { get; set; }
        [DataMember]
        public System.DateTime Fecha { get; set; }
        [DataMember]
        public decimal PagoTrabajador { get; set; }

        public virtual Empleado Empleado { get; set; }
        public virtual Obra Obra { get; set; }
    }
}

