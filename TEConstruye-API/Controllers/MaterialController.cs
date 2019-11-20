using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace TEConstruye_API.Controllers
{
    public class MaterialController : ApiController
    {
        // GET api/Material
        public IEnumerable<Material> Get()
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.Material.ToList();
            }
        }

        // GET api/Material/?Codigo
        public Material Get(int Codigo)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.Material.FirstOrDefault(controller => controller.Codigo == Codigo);
            }
        }

        // POST api/Material
        public void Post([FromBody]Material Material)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.Material.Add(Material);
                entities.SaveChanges();
            }
        }


        // PUT api/Material/?Codigo
        public void Put(int Codigo, [FromBody]Material Material)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                var entity = entities.Material.FirstOrDefault(controller => controller.Codigo == Codigo);
                entity.Nombre = Material.Nombre;
                entity.PrecioUnitario = Material.PrecioUnitario;

                entities.SaveChanges();
            }
        }

        // DELETE api/Material/?Codigo
        public void Delete(int Codigo)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.Material.Remove(entities.Material.FirstOrDefault(controller => controller.Codigo == Codigo));
                entities.SaveChanges();
            }
        }
    }
}
