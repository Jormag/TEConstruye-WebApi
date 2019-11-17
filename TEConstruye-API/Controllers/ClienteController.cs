using DataBase;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace TEConstruye_API.Controllers
{
    public class ClienteController : ApiController
    {

        // GET api/Cliente
        public IEnumerable<Cliente> Get()
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.Cliente.ToList();
            }
        }
        // GET api/Cliente/Cedula
        public Cliente Get(int Cedula)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.Cliente.FirstOrDefault(client => client.Cedula == Cedula);
            }
        }

        // POST api/Cliente
        public void Post([FromBody]Cliente cliente)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.Cliente.Add(cliente);
                entities.SaveChanges();
            }
        }


        // PUT api/Cliente/Cedula
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

        // DELETE api/Cliente/Cedula
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
