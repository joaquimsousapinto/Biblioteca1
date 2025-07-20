using Biblioteca1.Models;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace Biblioteca1.Controllers
{
    public class CategoriasController : Controller
    {
        private readonly Biblioteca1Entities db = new Biblioteca1Entities();

        // GET: Categorias
        public ActionResult Index()
        {
            return View(db.Categorias.AsNoTracking().OrderBy(x => x.Nome).ToList());
        }

        // GET: Categorias/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Categoria categoria = db.Categorias.AsNoTracking().FirstOrDefault(x => x.Id == id);
            if (categoria == null)
            {
                return HttpNotFound();
            }
            return View(categoria);
        }

        // GET: Categorias/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Categorias/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Id,Nome,Descricao")] Categoria categoria)
        {
            if (ModelState.IsValid)
            {
                db.Categorias.Add(categoria);
                await db.SaveChangesAsync();
                TempData["Success"] = "Registo criado com sucesso.";
                return RedirectToAction("Index");
            }
            TempData["Fail"] = "Erro na criação do Registo.";
            return View(categoria);
        }

        // GET: Categorias/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Categoria categoria = db.Categorias.AsNoTracking().FirstOrDefault(x => x.Id == id);
            if (categoria == null)
            {
                return HttpNotFound();
            }
            return View(categoria);
        }

        // POST: Categorias/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Id,Nome,Descricao")] Categoria categoria)
        {
            if (ModelState.IsValid)
            {
                db.Entry(categoria).State = EntityState.Modified;
                await db.SaveChangesAsync();
                TempData["Success"] = "Registo editado com sucesso.";
                return RedirectToAction(nameof(Index));
            }
            TempData["Fail"] = "Erro na edição do registo.";
            return View(categoria);
        }

        // GET: Categorias/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Categoria categoria = db.Categorias.AsNoTracking().FirstOrDefault(x => x.Id == id);
            if (categoria == null)
            {
                return HttpNotFound();
            }
            return View(categoria);
        }

        // POST: Categorias/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Categoria categoria = db.Categorias.Find(id);
            if (categoria != null)
            {
                db.Categorias.Remove(categoria);
                await db.SaveChangesAsync();
                TempData["Success"] = "Registo apagado com sucesso.";
                return RedirectToAction(nameof(Index));
            }
            TempData["Fail"] = "Erro a apagar o registo.";
            return RedirectToAction(nameof(Index));
        }
    }
}
