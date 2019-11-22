using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace TEConstruye_API.Controllers
{
    public class IngenieroController : ApiController
    {
        // GET api/Ingeniero
        public IEnumerable<Ingeniero> Get()
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.Ingeniero.ToList();
            }
        }

        // GET api/Ingeniero/?Codigo
        public Ingeniero Get(int Codigo)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.Ingeniero.FirstOrDefault(controller => controller.Codigo == Codigo);
            }
        }

        // POST api/Ingeniero
        public void Post([FromBody]Ingeniero Ingeniero)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.Ingeniero.Add(Ingeniero);
                entities.SaveChanges();
            }
        }


        // PUT api/Ingeniero/?Codigo
        public void Put(int Codigo, [FromBody]Ingeniero Ingeniero)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                var entity = entities.Ingeniero.FirstOrDefault(controller => controller.Codigo == Codigo);
                entity.Nombre = Ingeniero.Nombre;
                entity.Especialidad = Ingeniero.Especialidad;
                entity.Telefono = Ingeniero.Telefono;
                entity.Codigo = Ingeniero.Codigo;

                entities.SaveChanges();
            }
        }

        // DELETE api/Ingeniero/?Codigo
        public void Delete(int Codigo)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.Ingeniero.Remove(entities.Ingeniero.FirstOrDefault(controller => controller.Codigo == Codigo));
                entities.SaveChanges();
            }
        }
    }
}
