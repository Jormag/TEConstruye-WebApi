using DataBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace TEConstruye_API.Controllers
{
    public class ObraMaterialesController : ApiController
    {
        // GET api/ObraMateriales
        public IEnumerable<ObraMateriales> Get()
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.ObraMateriales.ToList();
            }
        }

        // GET api/ObraMateriales/IDObraMateriales
        public ObraMateriales Get(int IDObraMateriales)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.ObraMateriales.FirstOrDefault(controller => controller.IDObraMateriales == IDObraMateriales);
            }
        }

        // POST api/ObraMateriales
        public void Post([FromBody]ObraMateriales ObraMateriales)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.ObraMateriales.Add(ObraMateriales);
                entities.SaveChanges();
            }
        }


        // PUT api/ObraMateriales/IDObraMateriales
        public void Put(int IDObraMateriales, [FromBody]ObraMateriales ObraMateriales)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                var entity = entities.ObraMateriales.FirstOrDefault(controller => controller.IDObraMateriales == IDObraMateriales);
                entity.IDObra = ObraMateriales.IDObra;
                entity.IDEtapa = ObraMateriales.IDEtapa;
                entity.IDMaterial = ObraMateriales.IDMaterial;
                entity.Cantidad = ObraMateriales.Cantidad;

                entities.SaveChanges();
            }
        }

        // DELETE api/ObraMateriales/IDObraMateriales
        public void Delete(int IDObraMateriales)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.ObraMateriales.Remove(entities.ObraMateriales.FirstOrDefault(controller => controller.IDObraMateriales == IDObraMateriales));
                entities.SaveChanges();
            }
        }
    }
}
