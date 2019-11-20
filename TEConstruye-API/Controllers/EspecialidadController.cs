using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace TEConstruye_API.Controllers
{
    public class EspecialidadController : ApiController
    {
        // GET api/Especialidad
        public IEnumerable<Especialidad> Get()
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.Especialidad.ToList();
            }
        }

        // GET api/Especialidad/?IDEspecialidad
        public Especialidad Get(int IDEspecialidad)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.Especialidad.FirstOrDefault(controller => controller.IDEspecialidad == IDEspecialidad);
            }
        }

        // POST api/Especialidad
        public void Post([FromBody]Especialidad Especialidad)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.Especialidad.Add(Especialidad);
                entities.SaveChanges();
            }
        }


        // PUT api/Especialidad/?IDEspecialidad
        public void Put(int IDEspecialidad, [FromBody]Especialidad Especialidad)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                var entity = entities.Especialidad.FirstOrDefault(controller => controller.IDEspecialidad == IDEspecialidad);
                entity.TipoEspecialidad = Especialidad.TipoEspecialidad;

                entities.SaveChanges();
            }
        }

        // DELETE api/Especialidad/?IDEspecialidad
        public void Delete(int IDEspecialidad)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.Especialidad.Remove(entities.Especialidad.FirstOrDefault(controller => controller.IDEspecialidad == IDEspecialidad));
                entities.SaveChanges();
            }
        }
    }
}
