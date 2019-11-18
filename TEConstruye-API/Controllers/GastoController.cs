using DataBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace TEConstruye_API.Controllers
{
    public class GastoController : ApiController
    {
        // GET api/Gasto
        public IEnumerable<Gasto> Get()
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.Gasto.ToList();
            }
        }

        // GET api/Gasto/IDGasto
        public Gasto Get(int IDGasto)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.Gasto.FirstOrDefault(controller => controller.IDGasto == IDGasto);
            }
        }

        // POST api/Gasto
        public void Post([FromBody]Gasto Gasto)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.Gasto.Add(Gasto);
                entities.SaveChanges();
            }
        }


        // PUT api/Gasto/IDGasto
        public void Put(int IDGasto, [FromBody]Gasto Gasto)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                var entity = entities.Gasto.FirstOrDefault(controller => controller.IDGasto == IDGasto);
                entity.IDObra = Gasto.IDObra;
                entity.IDProveedor = Gasto.IDProveedor;
                entity.IDFactura = Gasto.IDFactura;
                entity.Foto = Gasto.Foto;

                entities.SaveChanges();
            }
        }

        // DELETE api/Gasto/IDGasto
        public void Delete(int IDGasto)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.Gasto.Remove(entities.Gasto.FirstOrDefault(controller => controller.IDGasto == IDGasto));
                entities.SaveChanges();
            }
        }
    }
}
