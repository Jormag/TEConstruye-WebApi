using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace TEConstruye_API.Controllers
{
    public class FacturaMaterialesController : ApiController
    {
        // GET api/FacturaMateriales
        public IEnumerable<FacturaMateriales> Get()
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.FacturaMateriales.ToList();
            }
        }
        // GET api/FacturaMateriales/?IDFactura?IDMaterial
        public FacturaMateriales Get(int IDFactura, int IDMaterial)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.FacturaMateriales.FirstOrDefault(controller => controller.IDFactura == IDFactura && controller.IDMaterial == IDMaterial);
            }
        }

        // POST api/FacturaMateriales
        public void Post([FromBody]FacturaMateriales FacturaMateriales)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.FacturaMateriales.Add(FacturaMateriales);
                entities.SaveChanges();
            }
        }


        // PUT api/FacturaMateriales/?IDFactura?IDMaterial
        public void Put(int IDFactura, int IDMaterial, [FromBody]FacturaMateriales FacturaMateriales)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                var entity = entities.FacturaMateriales.FirstOrDefault(controller => controller.IDFactura == IDFactura && controller.IDMaterial == IDMaterial);
                entity.Neto = FacturaMateriales.Neto;

                entities.SaveChanges();
            }
        }

        // DELETE api/FacturaMateriales/?IDFactura?IDMaterial
        public void Delete(int IDFactura, int IDProducto)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.FacturaMateriales.Remove(entities.FacturaMateriales.FirstOrDefault(controller => controller.IDFactura == IDFactura && controller.IDMaterial == IDMaterial));
                entities.SaveChanges();
            }
        }
    }
}
