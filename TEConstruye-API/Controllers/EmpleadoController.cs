using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

using ClientDataAccess;

namespace TEConstruye_API.Controllers
{
    public class EmpleadoController : ApiController
    {
        // GET api/Usuario
        public IEnumerable<Cliente> Get()
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.Cliente.ToList();
            }
        }

        // GET api/Usuario/207710175
        public Cliente Get(int Cedula)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.Cliente.FirstOrDefault(client => client.Cedula == Cedula);
            }
        }

        // POST api/values
        public void Post([FromBody]Cliente cliente)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.Cliente.Add(cliente);
                entities.SaveChanges();
            }
        }


        // PUT api/values/5
        public void Put(int Cedula, [FromBody]Cliente cliente)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                var entity = entities.Cliente.FirstOrDefault(client => client.Cedula == Cedula);
                entity.Nombre = cliente.Nombre;
                entity.Apellido1 = cliente.Apellido1;
                entity.Apellido2 = cliente.Apellido2;
                entity.Telefono = cliente.Telefono;

                entities.SaveChanges();
            }
        }

        // DELETE api/values/5
        public void Delete(int Cedula)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.Cliente.Remove(entities.Cliente.FirstOrDefault(client => client.Cedula == Cedula));
                entities.SaveChanges();
            }
        }
    }
}
