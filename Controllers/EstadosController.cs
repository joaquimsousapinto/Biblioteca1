using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Biblioteca1.Models;

namespace Biblioteca1.Controllers
{
    public class EstadosController : Controller
    {
        private Biblioteca1Entities db = new Biblioteca1Entities();

        // GET: Estados
        public ActionResult Index()
        {
            return View(db.EmprestimoEstadoes.ToList());
        }

        // GET: Estados/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EmprestimoEstado emprestimoEstado = db.EmprestimoEstadoes.Find(id);
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
        public ActionResult Create([Bind(Include = "Id,Nome")] EmprestimoEstado emprestimoEstado)
        {
            if (ModelState.IsValid)
            {
                db.EmprestimoEstadoes.Add(emprestimoEstado);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(emprestimoEstado);
        }

        // GET: Estados/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EmprestimoEstado emprestimoEstado = db.EmprestimoEstadoes.Find(id);
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
        public ActionResult Edit([Bind(Include = "Id,Nome")] EmprestimoEstado emprestimoEstado)
        {
            if (ModelState.IsValid)
            {
                db.Entry(emprestimoEstado).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(emprestimoEstado);
        }

        // GET: Estados/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EmprestimoEstado emprestimoEstado = db.EmprestimoEstadoes.Find(id);
            if (emprestimoEstado == null)
            {
                return HttpNotFound();
            }
            return View(emprestimoEstado);
        }

        // POST: Estados/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            EmprestimoEstado emprestimoEstado = db.EmprestimoEstadoes.Find(id);
            db.EmprestimoEstadoes.Remove(emprestimoEstado);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
