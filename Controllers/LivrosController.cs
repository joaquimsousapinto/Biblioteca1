using Biblioteca1.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Entity;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace Biblioteca1.Controllers
{
    public class LivrosController : Controller
    {
        private readonly Biblioteca1Entities db = new Biblioteca1Entities();

        // GET: Livros
        public ActionResult Index(int? page, string q)
        {
            Stopwatch stopwatch = Stopwatch.StartNew();

            int pageSize = short.Parse(ConfigurationManager.AppSettings["ItemsPorPagina"]);
            int pageNumber = page ?? 1;
            IPagedList<Livro> retVal = null;
            if (!string.IsNullOrEmpty(q))
            {
                retVal = db.Livroes.AsNoTracking()
                    .Where(x => x.Titulo.Contains(q))
                    .OrderBy(x => x.Titulo)
                    .ToPagedList(pageNumber, pageSize);
            }
            else
            {
                retVal = db.Livroes.AsNoTracking()
                    .OrderBy(x => x.Titulo)
                    .ToPagedList(pageNumber, pageSize);
            }
            stopwatch.Stop();
            ViewBag.ElapsedMilliseconds = stopwatch.ElapsedMilliseconds;

            return View(retVal);
        }

        // GET: Livros/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Livro livro = db.Livroes.AsNoTracking().FirstOrDefault(x => x.Id == id);
            if (livro == null)
            {
                return HttpNotFound();
            }
            List<int> livroAutores = db.LivroAutors.Where(x => x.LivroId == id).Select(x => x.AutorId).ToList();
            List<int> categorias = livro.Categorias.Select(x => x.Id).ToList();
            ViewBag.Autores = new SelectList(db.Autors.Where(a => !livroAutores.Contains(a.Id)).OrderBy(x => x.Nome).ToList(), "Id", "Nome");
            ViewBag.Categorias = new SelectList(db.Categorias.Where(a => !categorias.Contains(a.Id)).OrderBy(x => x.Nome).ToList(), "Id", "Nome");
            return View(livro);
        }

        // GET: Livros/Create
        public ActionResult Create()
        {
            ViewBag.EditoraId = new SelectList(db.Editoras.OrderBy(x => x.Nome), "Id", "Nome");
            return View();
        }

        // POST: Livros/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Id,Titulo,AnoPublicacao,EditoraId,AnoEdicao,Exemplares")] Livro livro)
        {
            if (ModelState.IsValid)
            {
                db.Livroes.Add(livro);
                await db.SaveChangesAsync();
                TempData["Success"] = "Registo criado com sucesso.";
                return RedirectToAction("Index");
            }
            TempData["Fail"] = "Erro na criação do Registo.";
            ViewBag.EditoraId = new SelectList(db.Editoras.OrderBy(x => x.Nome), "Id", "Nome", livro.EditoraId);
            return View(livro);
        }

        // GET: Livros/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Livro livro = db.Livroes.AsNoTracking().FirstOrDefault(x => x.Id == id);
            if (livro == null)
            {
                return HttpNotFound();
            }
            ViewBag.EditoraId = new SelectList(db.Editoras.OrderBy(x => x.Nome), "Id", "Nome", livro.EditoraId);
            return View(livro);
        }

        // POST: Livros/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Id,Titulo,AnoPublicacao,EditoraId,AnoEdicao,Exemplares")] Livro livro)
        {
            if (ModelState.IsValid)
            {
                db.Entry(livro).State = EntityState.Modified;
                await db.SaveChangesAsync();
                TempData["Success"] = "Registo editado com sucesso.";
                return RedirectToAction(nameof(Index));
            }
            TempData["Fail"] = "Erro na edição do registo.";
            ViewBag.EditoraId = new SelectList(db.Editoras, "Id", "Nome", livro.EditoraId);
            return View(livro);
        }

        // GET: Livros/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Livro livro = db.Livroes.AsNoTracking().FirstOrDefault(x => x.Id == id);
            if (livro == null)
            {
                return HttpNotFound();
            }
            return View(livro);
        }

        // POST: Livros/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Livro livro = db.Livroes.Find(id);
            if (livro != null)
            {
                db.Livroes.Remove(livro);
                await db.SaveChangesAsync();
                TempData["Success"] = "Registo apagado com sucesso.";
                return RedirectToAction(nameof(Index));
            }
            TempData["Fail"] = "Erro a apagar o registo.";
            return RedirectToAction("Index");
        }
    }
}
