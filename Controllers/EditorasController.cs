using Biblioteca1.Models;
using PagedList;
using System.Configuration;
using System.Data.Entity;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace Biblioteca1.Controllers
{
    public class EditorasController : Controller
    {
        private readonly Biblioteca1Entities db = new Biblioteca1Entities();

        // GET: Editoras
        public ActionResult Index(int? page, string q)
        {
            Stopwatch stopwatch = Stopwatch.StartNew();

            int pageSize = short.Parse(ConfigurationManager.AppSettings["ItemsPorPagina"]);
            int pageNumber = page ?? 1;
            IPagedList<Editora> retVal = null;
            if (!string.IsNullOrEmpty(q))
            {
                retVal = db.Editoras.AsNoTracking()
                    .Where(x => x.Nome.Contains(q))
                    .OrderBy(x => x.Nome)
                    .ToPagedList(pageNumber, pageSize);
            }
            else
            {
                retVal = db.Editoras.AsNoTracking()
                    .OrderBy(x => x.Nome)
                    .ToPagedList(pageNumber, pageSize);
            }
            stopwatch.Stop();
            ViewBag.ElapsedMilliseconds = stopwatch.ElapsedMilliseconds;

            return View(retVal);
        }

        // GET: Editoras/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Editora editora = db.Editoras.AsNoTracking().FirstOrDefault(x => x.Id == id);
            if (editora == null)
            {
                return HttpNotFound();
            }
            return View(editora);
        }

        // GET: Editoras/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Editoras/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Id,Nome,Morada")] Editora editora)
        {
            if (ModelState.IsValid)
            {
                db.Editoras.Add(editora);
                await db.SaveChangesAsync();
                TempData["Success"] = "Registo criado com sucesso.";
                return RedirectToAction("Index");
            }
            TempData["Fail"] = "Erro na criação do Registo.";
            return View(editora);
        }

        // GET: Editoras/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Editora editora = db.Editoras.AsNoTracking().FirstOrDefault(x => x.Id == id);
            if (editora == null)
            {
                return HttpNotFound();
            }
            return View(editora);
        }

        // POST: Editoras/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Id,Nome,Morada")] Editora editora)
        {
            if (ModelState.IsValid)
            {
                db.Entry(editora).State = EntityState.Modified;
                await db.SaveChangesAsync();
                TempData["Success"] = "Registo editado com sucesso.";
                return RedirectToAction(nameof(Index));
            }
            TempData["Fail"] = "Erro na edição do registo.";
            return View(editora);
        }

        // GET: Editoras/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Editora editora = db.Editoras.AsNoTracking().FirstOrDefault(x => x.Id == id);
            if (editora == null)
            {
                return HttpNotFound();
            }
            return View(editora);
        }

        // POST: Editoras/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Editora editora = db.Editoras.Find(id);
            if (editora != null)
            {
                db.Editoras.Remove(editora);
                await db.SaveChangesAsync();
                TempData["Success"] = "Registo apagado com sucesso.";
                return RedirectToAction(nameof(Index));
            }
            TempData["Fail"] = "Erro a apagar o registo.";
            return RedirectToAction("Index");
        }
    }
}
