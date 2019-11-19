using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace TEConstruye_API.Controllers
{
    public class CompraMaterialesController : ApiController
    {
        // GET api/CompraMateriales
        public IEnumerable<CompraMateriales> Get()
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.CompraMateriales.ToList();
            }
        }
        // GET api/CompraMateriales/Cedula
        public CompraMateriales Get(int IDCompraMateriales)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.CompraMateriales.FirstOrDefault(controller => controller.IDCompraMateriales == IDCompraMateriales);
            }
        }

        // POST api/CompraMateriales
        public void Post([FromBody]CompraMateriales compraMateriales)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.CompraMateriales.Add(compraMateriales);
                entities.SaveChanges();
            }
        }


        // PUT api/CompraMateriales/Cedula
        public void Put(int IDCompraMateriales, [FromBody]CompraMateriales compraMateriales)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                var entity = entities.CompraMateriales.FirstOrDefault(controller => controller.IDCompraMateriales == IDCompraMateriales);
                entity.Factura = compraMateriales.Factura;
                entity.IDMaterial = compraMateriales.IDMaterial;
                entity.Cantidad = compraMateriales.Cantidad;
                entity.TotalPrecioMaterial = compraMateriales.TotalPrecioMaterial;

                entities.SaveChanges();
            }
        }

        // DELETE api/CompraMateriales/Cedula
        public void Delete(int IDCompraMateriales)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.CompraMateriales.Remove(entities.CompraMateriales.FirstOrDefault(controller => controller.IDCompraMateriales == IDCompraMateriales));
                entities.SaveChanges();
            }
        }
    }
}
