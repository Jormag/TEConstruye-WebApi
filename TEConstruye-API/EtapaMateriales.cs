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
    public partial class EtapaMateriales
    {
        [DataMember]
        public int IDObra { get; set; }
        [DataMember]
        public int IDEtapa { get; set; }
        [DataMember]
        public int IDMaterial { get; set; }
        [DataMember]
        public int Cantidad { get; set; }
        [DataMember]
        public decimal PrecioTotal { get; set; }
    
        public virtual Material Material { get; set; }
        public virtual Etapa Etapa { get; set; }
        public virtual Obra Obra { get; set; }
    }
}
