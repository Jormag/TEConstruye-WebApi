using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace TEConstruye_API.Controllers
{
    public class FacturaController : ApiController
    {
        // GET api/Factura
        public IEnumerable<Factura> Get()
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.Factura.ToList();
            }
        }
        // GET api/Factura/?IDFactura
        public Factura Get(int IDFactura)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                return entities.Factura.FirstOrDefault(controller => controller.IDFactura == IDFactura);
            }
        }

        // POST api/Factura
        public void Post([FromBody]Factura Factura)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.Factura.Add(Factura);
                entities.SaveChanges();
            }
        }


        // PUT api/Factura/?IDFactura
        public void Put(int IDFactura, [FromBody]Factura Factura)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                var entity = entities.Factura.FirstOrDefault(controller => controller.IDFactura == IDFactura);
                entity.IDObra = Factura.IDObra;
                entity.IDEtapa = Factura.IDEtapa;
                entity.Fecha = Factura.Fecha;

                entities.SaveChanges();
            }
        }

        // DELETE api/Factura/?IDFactura
        public void Delete(int IDFactura)
        {
            using (TEConstruyeEntities entities = new TEConstruyeEntities())
            {
                entities.Factura.Remove(entities.Factura.FirstOrDefault(controller => controller.IDFactura == IDFactura));
                entities.SaveChanges();
            }
        }
    }
}
