using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace TEConstruye_API.Controllers
{
    public class EtapaProyectoController : ApiController
    {
        // GET api/EtapaProyecto
        public IEnumerable<EtapaProyecto> Get()
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.EtapaProyecto.ToList();
            }
        }

        // GET api/EtapaProyecto/IDEtapaProyecto
        public EtapaProyecto Get(int IDEtapaProyecto)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.EtapaProyecto.FirstOrDefault(controller => controller.IDEtapaProyecto == IDEtapaProyecto);
            }
        }

        // POST api/EtapaProyecto
        public void Post([FromBody]EtapaProyecto EtapaProyecto)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.EtapaProyecto.Add(EtapaProyecto);
                entities.SaveChanges();
            }
        }


        // PUT api/EtapaProyecto/IDEtapaProyecto
        public void Put(int IDEtapaProyecto, [FromBody]EtapaProyecto EtapaProyecto)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                var entity = entities.EtapaProyecto.FirstOrDefault(controller => controller.IDEtapaProyecto == IDEtapaProyecto);
                entity.IDObra = EtapaProyecto.IDObra;
                entity.IDEtapa = EtapaProyecto.IDEtapa;
                entity.FechaInicio = EtapaProyecto.FechaInicio;
                entity.FechaFin = EtapaProyecto.FechaFin;
                entity.Presupuesto = EtapaProyecto.Presupuesto;

                entities.SaveChanges();
            }
        }

        // DELETE api/EtapaProyecto/IDEtapaProyecto
        public void Delete(int IDEtapaProyecto)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.EtapaProyecto.Remove(entities.EtapaProyecto.FirstOrDefault(controller => controller.IDEtapaProyecto == IDEtapaProyecto));
                entities.SaveChanges();
            }
        }
    }
}
