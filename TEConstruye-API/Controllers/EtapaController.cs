using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace TEConstruye_API.Controllers
{
    public class EtapaController : ApiController
    {
        // GET api/Etapa
        public IEnumerable<Etapa> Get()
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.Etapa.ToList();
            }
        }

        // GET api/Etapa/?IDEtapa
        public Etapa Get(int IDEtapa)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.Etapa.FirstOrDefault(controller => controller.IDEtapa == IDEtapa);
            }
        }

        // POST api/Etapa
        public void Post([FromBody]Etapa Etapa)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.Etapa.Add(Etapa);
                entities.SaveChanges();
            }
        }


        // PUT api/Etapa/?IDEtapa
        public void Put(int IDEtapa, [FromBody]Etapa Etapa)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                var entity = entities.Etapa.FirstOrDefault(controller => controller.IDEtapa == IDEtapa);
                entity.Nombre = Etapa.Nombre;

                entities.SaveChanges();
            }
        }

        // DELETE api/Etapa/?IDEtapa
        public void Delete(int IDEtapa)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.Etapa.Remove(entities.Etapa.FirstOrDefault(controller => controller.IDEtapa == IDEtapa));
                entities.SaveChanges();
            }
        }
    }
}
