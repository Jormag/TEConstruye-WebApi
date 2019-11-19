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

        // GET api/Ingeniero/Cedula
        public Ingeniero Get(int Cedula)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.Ingeniero.FirstOrDefault(controller => controller.Cedula == Cedula);
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


        // PUT api/Ingeniero/Cedula
        public void Put(int Cedula, [FromBody]Ingeniero Ingeniero)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                var entity = entities.Ingeniero.FirstOrDefault(controller => controller.Cedula == Cedula);
                entity.Nombre = Ingeniero.Nombre;
                entity.Apellido1 = Ingeniero.Apellido1;
                entity.Apellido2 = Ingeniero.Apellido2;
                entity.IDEspecialidad = Ingeniero.IDEspecialidad;
                entity.Telefono = Ingeniero.Telefono;
                entity.Codigo = Ingeniero.Codigo;

                entities.SaveChanges();
            }
        }

        // DELETE api/Ingeniero/Cedula
        public void Delete(int Cedula)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.Ingeniero.Remove(entities.Ingeniero.FirstOrDefault(controller => controller.Cedula == Cedula));
                entities.SaveChanges();
            }
        }
    }
}
