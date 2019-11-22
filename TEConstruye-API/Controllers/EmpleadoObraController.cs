using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace TEConstruye_API.Controllers
{
    public class EmpleadoObraController : ApiController
    {
        // GET api/EmpleadoObra
        public IEnumerable<EmpleadoObra> Get()
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.EmpleadoObra.ToList();
            }
        }

        // GET api/EmpleadoObra/?IDEmpleado?IDObra
        public EmpleadoObra Get(int IDEmpleado, int IDObra)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.EmpleadoObra.FirstOrDefault(controller => controller.IDEmpleado == IDEmpleado && controller.IDObra == IDObra);
            }
        }

        // POST api/EmpleadoObra
        public void Post([FromBody]EmpleadoObra EmpleadoObra)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.EmpleadoObra.Add(EmpleadoObra);
                entities.SaveChanges();
            }
        }


        // PUT api/EmpleadoObra/?IDEmpleado?IDObra
        public void Put(int IDEmpleado, int IDObra, [FromBody]EmpleadoObra EmpleadoObra)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                var entity = entities.EmpleadoObra.FirstOrDefault(controller => controller.IDEmpleado == IDEmpleado && controller.IDObra == IDObra);
                entity.Horas = EmpleadoObra.Horas;
                entity.Fecha = EmpleadoObra.Fecha;
                entity.PagoTrabajador = EmpleadoObra.PagoTrabajador;

                entities.SaveChanges();
            }
        }

        // DELETE api/EmpleadoObra/?IDEmpleado?IDObra
        public void Delete(int IDEmpleado, int IDObra)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.EmpleadoObra.Remove(entities.EmpleadoObra.FirstOrDefault(controller => controller.IDEmpleado == IDEmpleado && controller.IDObra == IDObra));
                entities.SaveChanges();
            }
        }
    }
}
