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
    public partial class Etapa
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Etapa()
        {
            this.EtapaProyecto = new HashSet<EtapaProyecto>();
            this.ObraMateriales = new HashSet<ObraMateriales>();
        }
        [DataMember]
        public int IDEtapa { get; set; }
        [DataMember]
        public int IDObra { get; set; }
        [DataMember]
        public string Descripcion { get; set; }
        [DataMember]
        public Nullable<int> TrabajoPreliminar { get; set; }
        [DataMember]
        public Nullable<int> Cimiento { get; set; }
        [DataMember]
        public Nullable<int> Paredes { get; set; }
        [DataMember]
        public Nullable<int> ConcretoReforzado { get; set; }
        [DataMember]
        public Nullable<int> Techos { get; set; }
        [DataMember]
        public Nullable<int> Cielos { get; set; }
        [DataMember]
        public Nullable<int> Repello { get; set; }
        [DataMember]
        public Nullable<int> Entrepisos { get; set; }
        [DataMember]
        public Nullable<int> Pisos { get; set; }
        [DataMember]
        public Nullable<int> Enchapes { get; set; }
        [DataMember]
        public Nullable<int> InstalacionPluvial { get; set; }
        [DataMember]
        public Nullable<int> InstalacionSanitaria { get; set; }
        [DataMember]
        public Nullable<int> InstalacionElectrica { get; set; }
        [DataMember]
        public Nullable<int> Puertas { get; set; }
        [DataMember]
        public Nullable<int> Cerrajeria { get; set; }
        [DataMember]
        public Nullable<int> Ventanas { get; set; }
        [DataMember]
        public Nullable<int> Closets { get; set; }
        [DataMember]
        public Nullable<int> MuebleCocina { get; set; }
        [DataMember]
        public Nullable<int> Pintura { get; set; }
        [DataMember]
        public Nullable<int> Escaleras { get; set; }
    
        public virtual Obra Obra { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EtapaProyecto> EtapaProyecto { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ObraMateriales> ObraMateriales { get; set; }
    }
}