using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace TEConstruye_API.Controllers
{
    public class ProveedorController : ApiController
    {
        // GET api/Proveedor
        public IEnumerable<Proveedor> Get()
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.Proveedor.ToList();
            }
        }
        // GET api/Proveedor/?IDProveedor
        public Proveedor Get(int IDProveedor)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.Proveedor.FirstOrDefault(controller => controller.IDProveedor == IDProveedor);
            }
        }

        // POST api/Proveedor
        public void Post([FromBody]Proveedor Proveedor)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.Proveedor.Add(Proveedor);
                entities.SaveChanges();
            }
        }


        // PUT api/Proveedor/?IDProveedor
        public void Put(int IDProveedor, [FromBody]Proveedor Proveedor)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                var entity = entities.Proveedor.FirstOrDefault(controller => controller.IDProveedor == IDProveedor);
                entity.Nombre = Proveedor.Nombre;

                entities.SaveChanges();
            }
        }

        // DELETE api/Proveedor/?IDProveedor
        public void Delete(int IDProveedor)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.Proveedor.Remove(entities.Proveedor.FirstOrDefault(controller => controller.IDProveedor == IDProveedor));
                entities.SaveChanges();
            }
        }
    }
}
