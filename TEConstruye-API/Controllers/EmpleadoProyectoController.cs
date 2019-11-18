using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DataBase;

namespace TEConstruye_API.Controllers
{
    public class EmpleadoProyectoController : ApiController
    {
        // GET api/EmpleadoProyectoProyecto
        public IEnumerable<EmpleadoProyecto> Get()
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.EmpleadoProyecto.ToList();
            }
        }

        // GET api/EmpleadoProyectoProyecto/IDEmpleadoProyecto
        public EmpleadoProyecto Get(int IDEmpleadoProyecto)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.EmpleadoProyecto.FirstOrDefault(employee => employee.IDEmpleadoProyecto == IDEmpleadoProyecto);
            }
        }

        // POST api/EmpleadoProyectoProyecto
        public void Post([FromBody]EmpleadoProyecto EmpleadoProyectoProyecto)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.EmpleadoProyecto.Add(EmpleadoProyectoProyecto);
                entities.SaveChanges();
            }
        }


        // PUT api/EmpleadoProyectoProyecto/IDEmpleadoProyecto
        public void Put(int IDEmpleadoProyecto, [FromBody]EmpleadoProyecto EmpleadoProyectoProyecto)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                var entity = entities.EmpleadoProyecto.FirstOrDefault(employee => employee.IDEmpleadoProyecto == IDEmpleadoProyecto);
                entity.IDEmpleado = EmpleadoProyectoProyecto.IDEmpleado;
                entity.IDObra = EmpleadoProyectoProyecto.IDObra;
                entity.Horas = EmpleadoProyectoProyecto.Horas;

                entities.SaveChanges();
            }
        }

        // DELETE api/EmpleadoProyectoProyecto/IDEmpleadoProyecto
        public void Delete(int IDEmpleadoProyecto)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.EmpleadoProyecto.Remove(entities.EmpleadoProyecto.FirstOrDefault(employee => employee.IDEmpleadoProyecto == IDEmpleadoProyecto));
                entities.SaveChanges();
            }
        }
    }
}
