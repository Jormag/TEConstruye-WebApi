using DataBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace TEConstruye_API.Controllers
{
    public class UbicacionController : ApiController
    {
        // GET api/Ubicacion
        public IEnumerable<Ubicacion> Get()
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.Ubicacion.ToList();
            }
        }

        // GET api/Ubicacion/IDUbicacion
        public Ubicacion Get(int IDUbicacion)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.Ubicacion.FirstOrDefault(controller => controller.IDUbicacion == IDUbicacion);
            }
        }

        // POST api/Ubicacion
        public void Post([FromBody]Ubicacion Ubicacion)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.Ubicacion.Add(Ubicacion);
                entities.SaveChanges();
            }
        }


        // PUT api/Ubicacion/IDUbicacion
        public void Put(int IDUbicacion, [FromBody]Ubicacion Ubicacion)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                var entity = entities.Ubicacion.FirstOrDefault(controller => controller.IDUbicacion == IDUbicacion);
                entity.Provincia = Ubicacion.Provincia;
                entity.Canton = Ubicacion.Canton;
                entity.Distrito = Ubicacion.Distrito;

                entities.SaveChanges();
            }
        }

        // DELETE api/Ubicacion/IDUbicacion
        public void Delete(int IDUbicacion)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.Ubicacion.Remove(entities.Ubicacion.FirstOrDefault(controller => controller.IDUbicacion == IDUbicacion));
                entities.SaveChanges();
            }
        }
    }
}
