using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace TEConstruye_API.Controllers
{
    public class EmpleadoProyectoController : ApiController
    {
        // GET api/EmpleadoProyecto
        public IEnumerable<EmpleadoProyecto> Get()
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.EmpleadoProyecto.ToList();
            }
        }

        // GET api/EmpleadoProyecto/IDEmpleadoProyecto
        public EmpleadoProyecto Get(int IDEmpleadoProyecto)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.EmpleadoProyecto.FirstOrDefault(controller => controller.IDEmpleadoProyecto == IDEmpleadoProyecto);
            }
        }

        // POST api/EmpleadoProyecto
        public void Post([FromBody]EmpleadoProyecto EmpleadoProyecto)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.EmpleadoProyecto.Add(EmpleadoProyecto);
                entities.SaveChanges();
            }
        }


        // PUT api/EmpleadoProyecto/IDEmpleadoProyecto
        public void Put(int IDEmpleadoProyecto, [FromBody]EmpleadoProyecto EmpleadoProyecto)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                var entity = entities.EmpleadoProyecto.FirstOrDefault(controller => controller.IDEmpleadoProyecto == IDEmpleadoProyecto);
                entity.IDEmpleado = EmpleadoProyecto.IDEmpleado;
                entity.IDObra = EmpleadoProyecto.IDObra;
                entity.Horas = EmpleadoProyecto.Horas;

                entities.SaveChanges();
            }
        }

        // DELETE api/EmpleadoProyectoP/IDEmpleadoProyecto
        public void Delete(int IDEmpleadoProyecto)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.EmpleadoProyecto.Remove(entities.EmpleadoProyecto.FirstOrDefault(controller => controller.IDEmpleadoProyecto == IDEmpleadoProyecto));
                entities.SaveChanges();
            }
        }
    }
}
