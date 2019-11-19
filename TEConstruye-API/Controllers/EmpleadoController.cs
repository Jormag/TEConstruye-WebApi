using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace TEConstruye_API.Controllers
{
    public class EmpleadoController : ApiController
    {
        // GET api/Empleado
        public IEnumerable<Empleado> Get()
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.Empleado.ToList();
            }
        }

        // GET api/Empleado/Cedula
        public Empleado Get(int Cedula)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.Empleado.FirstOrDefault(controller => controller.Cedula == Cedula);
            }
        }

        // POST api/Empleado
        public void Post([FromBody]Empleado empleado)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.Empleado.Add(empleado);
                entities.SaveChanges();
            }
        }


        // PUT api/Empleado/Cedula
        public void Put(int Cedula, [FromBody]Empleado empleado)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                var entity = entities.Empleado.FirstOrDefault(controller => controller.Cedula == Cedula);
                entity.Nombre = empleado.Nombre;
                entity.Apellido1 = empleado.Apellido1;
                entity.Apellido2 = empleado.Apellido2;
                entity.Telefono = empleado.Telefono;

                entities.SaveChanges();
            }
        }

        // DELETE api/Empleado/Cedula
        public void Delete(int Cedula)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.Empleado.Remove(entities.Empleado.FirstOrDefault(controller => controller.Cedula == Cedula));
                entities.SaveChanges();
            }
        }
    }
}
