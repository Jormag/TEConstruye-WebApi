using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace TEConstruye_API.Controllers
{
    public class ObraController : ApiController
    {
        // GET api/Obra
        public IEnumerable<Obra> Get()
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.Obra.ToList();
            }
        }

        // GET api/Obra/?IDObra
        public Obra Get(int IDObra)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.Obra.FirstOrDefault(controller => controller.IDObra == IDObra);
            }
        }

        // POST api/Obra
        public void Post([FromBody]Obra Obra)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.Obra.Add(Obra);
                entities.SaveChanges();
            }
        }


        // PUT api/Obra/?IDObra
        public void Put(int IDObra, [FromBody]Obra Obra)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                var entity = entities.Obra.FirstOrDefault(controller => controller.IDObra == IDObra);
                entity.Nombre = Obra.Nombre;
                entity.Ubicacion = Obra.Ubicacion;
                entity.Habitaciones = Obra.Habitaciones;
                entity.Banos = Obra.Banos;
                entity.Pisos = Obra.Pisos;
                entity.AreaConstruccion = Obra.AreaConstruccion;
                entity.AreaLote = Obra.AreaLote;
                entity.IDIngeniero1 = Obra.IDIngeniero1;
                entity.IDIngeniero2 = Obra.IDIngeniero2;
                entity.IDIngeniero3 = Obra.IDIngeniero3;
                entity.IDCliente = Obra.IDCliente;

                entities.SaveChanges();
            }
        }

        // DELETE api/Obra/?IDObra
        public void Delete(int IDObra)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.Obra.Remove(entities.Obra.FirstOrDefault(controller => controller.IDObra == IDObra));
                entities.SaveChanges();
            }
        }
    }
}
