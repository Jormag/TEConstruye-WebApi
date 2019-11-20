using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace TEConstruye_API.Controllers
{
    public class EtapaObraController : ApiController
    {
        // GET api/EtapaObra
        public IEnumerable<EtapaObra> Get()
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.EtapaObra.ToList();
            }
        }

        // GET api/EtapaObra/?IDObra?IDEtapa
        public EtapaObra Get(int IDObra, int IDEtapa)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.EtapaObra.FirstOrDefault(controller => controller.IDObra == IDObra && controller.IDEtapa == IDEtapa);
            }
        }

        // POST api/EtapaObra
        public void Post([FromBody]EtapaObra EtapaObra)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.EtapaObra.Add(EtapaObra);
                entities.SaveChanges();
            }
        }


        // PUT api/EtapaObra/IDEtapaProyecto
        public void Put(int IDObra, int IDEtapa, [FromBody]EtapaObra EtapaObra)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                var entity = entities.EtapaObra.FirstOrDefault(controller => controller.IDObra == IDObra && controller.IDEtapa == IDEtapa);
                entity.IDObra = EtapaObra.IDObra;
                entity.IDEtapa = EtapaObra.IDEtapa;
                entity.FechaInicio = EtapaObra.FechaInicio;
                entity.FechaFin = EtapaObra.FechaFin;
                entity.Presupuesto = EtapaObra.Presupuesto;

                entities.SaveChanges();
            }
        }

        // DELETE api/EtapaObra/IDEtapaProyecto
        public void Delete(int IDObra, int IDEtapa)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.EtapaObra.Remove(entities.EtapaObra.FirstOrDefault(controller => controller.IDObra == IDObra && controller.IDEtapa == IDEtapa));
                entities.SaveChanges();
            }
        }
    }
}
