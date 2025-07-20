using Biblioteca1.Models;
using PagedList;
using System.Configuration;
using System.Data;
using System.Data.Entity;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace Biblioteca1.Controllers
{
    public class AutoresController : Controller
    {
        private readonly Biblioteca1Entities db = new Biblioteca1Entities();

        // GET: autores
        public ActionResult Index(int? page, string q)
        {
            Stopwatch stopwatch = Stopwatch.StartNew();

            int pageSize = short.Parse(ConfigurationManager.AppSettings["ItemsPorPagina"]);
            int pageNumber = page ?? 1;
            IPagedList<Autor> retVal = null;
            if (!string.IsNullOrEmpty(q))
            {
                retVal = db.Autors.AsNoTracking()
                    .Where(x => x.Nome.Contains(q))
                    .OrderBy(x => x.Nome)
                    .ToPagedList(pageNumber, pageSize);
            }
            else
            {
                retVal = db.Autors.AsNoTracking()
                    .OrderBy(x => x.Nome)
                    .ToPagedList(pageNumber, pageSize);
            }
            stopwatch.Stop();
            ViewBag.ElapsedMilliseconds = stopwatch.ElapsedMilliseconds;

            return View(retVal);
        }

        // GET: autores/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Autor autor = db.Autors.AsNoTracking().FirstOrDefault(x => x.Id == id);
            if (autor == null)
            {
                return HttpNotFound();
            }
            return View(autor);
        }

        // GET: autores/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: autores/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Id,Nome,Morada,Telefone,Email,DataNascimento,Sexo")] Autor autor)
        {
            if (ModelState.IsValid)
            {
                db.Autors.Add(autor);
                await db.SaveChangesAsync();
                TempData["Success"] = "Registo criado com sucesso.";
                return RedirectToAction("Index");
            }
            TempData["Fail"] = "Erro na criação do Registo.";
            return View(autor);
        }

        // GET: autores/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Autor autor = db.Autors.AsNoTracking().FirstOrDefault(x => x.Id == id);
            if (autor == null)
            {
                return HttpNotFound();
            }
            return View(autor);
        }

        // POST: autores/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Id,Nome,Morada,Telefone,Email,DataNascimento,Sexo")] Autor autor)
        {
            if (ModelState.IsValid)
            {
                db.Entry(autor).State = EntityState.Modified;
                await db.SaveChangesAsync();
                TempData["Success"] = "Registo editado com sucesso.";
                return RedirectToAction(nameof(Index));
            }
            TempData["Fail"] = "Erro na edição do registo.";
            return View(autor);
        }

        // GET: autores/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Autor autor = db.Autors.AsNoTracking().FirstOrDefault(x => x.Id == id);
            if (autor == null)
            {
                return HttpNotFound();
            }
            return View(autor);
        }

        // POST: autores/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Autor autor = await db.Autors.FindAsync(id);
            if (autor != null)
            {
                db.Autors.Remove(autor);
                await db.SaveChangesAsync();
                TempData["Success"] = "Registo apagado com sucesso.";
                return RedirectToAction(nameof(Index));
            }
            TempData["Fail"] = "Erro a apagar o registo.";
            return RedirectToAction("Index");
        }
    }
}
