using DataBase;
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

        // GET api/Obra/IDObra
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


        // PUT api/Obra/IDObra
        public void Put(int IDObra, [FromBody]Obra Obra)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                var entity = entities.Obra.FirstOrDefault(controller => controller.IDObra == IDObra);
                entity.Nombre = Obra.Nombre;
                entity.IDUbicacion = Obra.IDUbicacion;
                entity.Habitaciones = Obra.Habitaciones;
                entity.Baños = Obra.Baños;
                entity.Pisos = Obra.Pisos;
                entity.MetrosCuadradosConstruccion = Obra.MetrosCuadradosConstruccion;
                entity.MetrosCuadradosLote = Obra.MetrosCuadradosLote;
                entity.IDIngeniero1 = Obra.IDIngeniero1;
                entity.IDIngeniero2 = Obra.IDIngeniero2;
                entity.IDIngeniero3 = Obra.IDIngeniero3;

                entities.SaveChanges();
            }
        }

        // DELETE api/Obra/IDObra
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
