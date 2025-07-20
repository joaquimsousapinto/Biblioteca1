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
using System.Reflection;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace Biblioteca1.Controllers
{
    public class EmprestimosController : Controller
    {
        private readonly Biblioteca1Entities db = new Biblioteca1Entities();

        // GET: Emprestimos
        public ActionResult Index(int? page, string q)
        {
            Stopwatch stopwatch = Stopwatch.StartNew();

            int pageSize = short.Parse(ConfigurationManager.AppSettings["ItemsPorPagina"]);
            int pageNumber = page ?? 1;
            IPagedList<Emprestimo> retVal = null;
            if (q != null)
            {
                retVal = db.Emprestimoes.AsNoTracking()
                    .Where(x => x.Utilizador.Nome.Contains(q))
                    .OrderBy(x => x.Id)
                    .ToPagedList(pageNumber, pageSize);
            }
            else
            {
                retVal = db.Emprestimoes.AsNoTracking()
                    .OrderBy(x => x.Id)
                    .ToPagedList(pageNumber, pageSize);
            }
            stopwatch.Stop();
            ViewBag.ElapsedMilliseconds = stopwatch.ElapsedMilliseconds;

            return View(retVal);
        }

        // GET: Emprestimos/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Emprestimo emprestimo = db.Emprestimoes.Find(id);
            List<int> emprestimoLivros = emprestimo.EmprestimoLivroes.Select(x => x.LivroId).ToList();
            ViewBag.Livros = new SelectList(db.Livroes.Where(a => !emprestimoLivros.Contains(a.Id)).OrderBy(x => x.Titulo).ToList(), "Id", "Titulo");

            if (emprestimo == null)
            {
                return HttpNotFound();
            }
            return View(emprestimo);
        }

        // GET: Emprestimos/Create
        public ActionResult Create()
        {
            ViewBag.UtilizadorId = new SelectList(db.Utilizadors, "Id", "Nome");
            ViewBag.EstadoId = new SelectList(db.EmprestimoEstadoes, "Id", "Nome");
            return View();
        }

        // POST: Emprestimos/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Id,UtilizadorId,DataEmprestimo,DataDevolucaoPrevista,DataDevolucaoReal,EstadoId")] Emprestimo emprestimo)
        {
            if (ModelState.IsValid)
            {
                db.Emprestimoes.Add(emprestimo);
                await db.SaveChangesAsync();
                TempData["Success"] = "Registo criado com sucesso.";
                return RedirectToAction("Index");
            }
            TempData["Fail"] = "Erro na criação do Registo.";
            ViewBag.UtilizadorId = new SelectList(db.Utilizadors, "Id", "Nome", emprestimo.UtilizadorId);
            ViewBag.EstadoId = new SelectList(db.EmprestimoEstadoes, "Id", "Nome", emprestimo.EstadoId);
            return View(emprestimo);
        }

        // GET: Emprestimos/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Emprestimo emprestimo = db.Emprestimoes.Find(id);
            if (emprestimo == null)
            {
                return HttpNotFound();
            }
            ViewBag.UtilizadorId = new SelectList(db.Utilizadors, "Id", "Nome", emprestimo.UtilizadorId);
            ViewBag.EstadoId = new SelectList(db.EmprestimoEstadoes, "Id", "Nome", emprestimo.EstadoId);
            return View(emprestimo);
        }

        // POST: Emprestimos/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Id,UtilizadorId,DataEmprestimo,DataDevolucaoPrevista,DataDevolucaoReal,EstadoId")] Emprestimo emprestimo)
        {
            if (ModelState.IsValid)
            {
                db.Entry(emprestimo).State = EntityState.Modified;
                await db.SaveChangesAsync();
                TempData["Success"] = "Registo editado com sucesso.";
                return RedirectToAction(nameof(Index));
            }
            TempData["Fail"] = "Erro na edição do registo.";
            ViewBag.UtilizadorId = new SelectList(db.Utilizadors, "Id", "Nome", emprestimo.UtilizadorId);
            ViewBag.EstadoId = new SelectList(db.EmprestimoEstadoes, "Id", "Nome", emprestimo.EstadoId);
            return View(emprestimo);
        }

        // GET: Emprestimos/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Emprestimo emprestimo = db.Emprestimoes.Find(id);
            if (emprestimo == null)
            {
                return HttpNotFound();
            }
            return View(emprestimo);
        }

        // POST: Emprestimos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Emprestimo emprestimo = db.Emprestimoes.Find(id);
            if (emprestimo != null)
            {
                db.Emprestimoes.Remove(emprestimo);
                await db.SaveChangesAsync();
                TempData["Success"] = "Registo apagado com sucesso.";
                return RedirectToAction(nameof(Index));
            }
            TempData["Fail"] = "Erro a apagar o registo.";
            return RedirectToAction("Index");
        }

        public async Task<ActionResult> AddLivroOnEmprestimo(int emprestimoId, int livroId, int quantidade)
        {
            Emprestimo emprestimo = db.Emprestimoes.Find(emprestimoId);
            Livro livro = db.Livroes.Find(livroId);
            if (emprestimo != null && livro != null)
            {
                emprestimo.EmprestimoLivroes.Add(new EmprestimoLivro
                {
                    EmprestimoId = emprestimoId,
                    LivroId = livroId,
                    Quantidade = quantidade
                });
                await db.SaveChangesAsync();
                TempData["Success"] = "Livro adicionado ao empréstimo.";
                return RedirectToAction("Details", new { Id = emprestimoId });
            }
            TempData["Fail"] = "Erro ao adicionar livro ao empréstimo.";
            return RedirectToAction("Details", new { Id = emprestimoId });
        }

        public async Task<ActionResult> DeleteLivroOnEmprestimo(int emprestimoId, int livroId) { 
            
            Emprestimo emprestimo = db.Emprestimoes.Find(emprestimoId);
            if (emprestimo != null)
            {
                EmprestimoLivro emprestimoLivro = emprestimo.EmprestimoLivroes.FirstOrDefault(x => x.LivroId == livroId);
                db.EmprestimoLivroes.Remove(emprestimoLivro);
                await db.SaveChangesAsync();
                TempData["Success"] = "Livro removido do empréstimo.";
                return RedirectToAction("Details", new { Id = emprestimoId });
            }
            TempData["Fail"] = "Erro ao remover livro ao empréstimo.";
            return RedirectToAction("Details", new { Id = emprestimoId }); 
        }
    }
}
