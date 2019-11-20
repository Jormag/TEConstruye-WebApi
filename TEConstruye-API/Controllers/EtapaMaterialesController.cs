using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace TEConstruye_API.Controllers
{
    public class EtapaMaterialesController : ApiController
    {
        // GET api/EtapaMateriales
        public IEnumerable<EtapaMateriales> Get()
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.EtapaMateriales.ToList();
            }
        }

        // GET api/EtapaMateriales/?IDObra?IDEtapa?IDMaterial
        public EtapaMateriales Get(int IDObra, int IDEtapa, int IDMaterial)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.EtapaMateriales.FirstOrDefault(controller => controller.IDObra == IDObra && controller.IDEtapa == IDEtapa && controller.IDMaterial == IDMaterial);
            }
        }

        // POST api/EtapaMateriales
        public void Post([FromBody]EtapaMateriales EtapaMateriales)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.EtapaMateriales.Add(EtapaMateriales);
                entities.SaveChanges();
            }
        }


        // PUT api/EtapaMateriales/?IDObra?IDEtapa?IDMaterial
        public void Put(int IDObra, int IDEtapa, int IDMaterial, [FromBody]EtapaMateriales EtapaMateriales)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                var entity = entities.EtapaMateriales.FirstOrDefault(controller => controller.IDObra == IDObra && controller.IDEtapa == IDEtapa && controller.IDMaterial == IDMaterial);
                entity.IDObra = EtapaMateriales.IDObra;
                entity.IDEtapa = EtapaMateriales.IDEtapa;
                entity.IDMaterial = EtapaMateriales.IDMaterial;
                entity.Cantidad = EtapaMateriales.Cantidad;

                entities.SaveChanges();
            }
        }

        // DELETE api/EtapaMateriales/?IDObra?IDEtapa?IDMaterial
        public void Delete(int IDObra, int IDEtapa, int IDMaterial)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.EtapaMateriales.Remove(entities.EtapaMateriales.FirstOrDefault(controller => controller.IDObra == IDObra && controller.IDEtapa == IDEtapa && controller.IDMaterial == IDMaterial));
                entities.SaveChanges();
            }
        }
    }
}
