using Biblioteca1.Models;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace Biblioteca1.Controllers
{
    public class EstadosController : Controller
    {
        private readonly Biblioteca1Entities db = new Biblioteca1Entities();

        // GET: Estados
        public ActionResult Index()
        {
            return View(db.EmprestimoEstadoes.AsNoTracking().OrderBy(x => x.Nome).ToList());
        }

        // GET: Estados/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EmprestimoEstado emprestimoEstado = db.EmprestimoEstadoes.AsNoTracking().FirstOrDefault(x => x.Id == id);
            if (emprestimoEstado == null)
            {
                return HttpNotFound();
            }
            return View(emprestimoEstado);
        }

        // GET: Estados/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Estados/Create
        // Para proteger-se contra ataques de excesso de postagem, ative as propriedades específicas às quais deseja se associar. 
        // Para obter mais detalhes, confira https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Id,Nome")] EmprestimoEstado emprestimoEstado)
        {
            if (ModelState.IsValid)
            {
                db.EmprestimoEstadoes.Add(emprestimoEstado);
                await db.SaveChangesAsync();
                TempData["Success"] = "Registo criado com sucesso.";
                return RedirectToAction("Index");
            }
            TempData["Fail"] = "Erro na criação do Registo.";
            return View(emprestimoEstado);
        }

        // GET: Estados/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EmprestimoEstado emprestimoEstado = db.EmprestimoEstadoes.AsNoTracking().FirstOrDefault(x => x.Id == id);
            if (emprestimoEstado == null)
            {
                return HttpNotFound();
            }
            return View(emprestimoEstado);
        }

        // POST: Estados/Edit/5
        // Para proteger-se contra ataques de excesso de postagem, ative as propriedades específicas às quais deseja se associar. 
        // Para obter mais detalhes, confira https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Id,Nome")] EmprestimoEstado emprestimoEstado)
        {
            if (ModelState.IsValid)
            {
                db.Entry(emprestimoEstado).State = EntityState.Modified;
                await db.SaveChangesAsync();
                TempData["Success"] = "Registo editado com sucesso.";
                return RedirectToAction(nameof(Index));
            }
            TempData["Fail"] = "Erro na edição do registo.";
            return View(emprestimoEstado);
        }

        // GET: Estados/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EmprestimoEstado emprestimoEstado = db.EmprestimoEstadoes.AsNoTracking().FirstOrDefault(x => x.Id == id);
            if (emprestimoEstado == null)
            {
                return HttpNotFound();
            }
            return View(emprestimoEstado);
        }

        // POST: Estados/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            EmprestimoEstado emprestimoEstado = db.EmprestimoEstadoes.Find(id);
            if (emprestimoEstado != null)
            {
                db.EmprestimoEstadoes.Remove(emprestimoEstado);
                await db.SaveChangesAsync();
                TempData["Success"] = "Registo apagado com sucesso.";
                return RedirectToAction(nameof(Index));
            }
            TempData["Fail"] = "Erro a apagar o registo.";
            return RedirectToAction("Index");
        }
    }
}
