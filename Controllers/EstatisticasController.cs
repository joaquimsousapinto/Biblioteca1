using Biblioteca1.Models;
using Biblioteca1.Models.DTO;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace Biblioteca1.Controllers
{
    public class EstatisticasController : Controller
    {
        private readonly Biblioteca1Entities db = new Biblioteca1Entities();

        // GET: Estatisticas
        [ActionName("Utilizadores")]
        public ActionResult UtilizadoresAsync()
        {
            Stopwatch stopwatch = Stopwatch.StartNew();

            ObjectParameter executionTime = new ObjectParameter("ExecutionTime", typeof(DateTime));
            List<SP_Utilizadores_Sexo_FaixaEtaria_Result> retVal = db.SP_Utilizadores_Sexo_FaixaEtaria(executionTime).ToList();
            ViewBag.ExecutionTime = executionTime.Value;
            stopwatch.Stop();
            ViewBag.ElapsedMilliseconds = stopwatch.ElapsedMilliseconds;

            return View(retVal);
        }

        [ActionName("Categorias")]
        public ActionResult Categorias()
        {
            Stopwatch stopwatch = Stopwatch.StartNew();

            ObjectParameter executionTime = new ObjectParameter("ExecutionTime", typeof(DateTime));
            List<SP_Livros_Categoria_Result> retVal = db.SP_Livros_Categoria(executionTime).ToList();
            ViewBag.ExecutionTime = executionTime.Value;
            stopwatch.Stop();
            ViewBag.ElapsedMilliseconds = stopwatch.ElapsedMilliseconds;

            return View(retVal);
        }

        [ActionName("Emprestimos")]
        public ActionResult Emprestimos()
        {
            Stopwatch stopwatch = Stopwatch.StartNew();
            DTO_Emprestimos emprestimos = new DTO_Emprestimos
            {
                ConcluidosAtrasados = db.Emprestimoes.Where(x => x.DataDevolucaoReal > x.DataDevolucaoPrevista).Count(),
                ConcluidosNoPrazo = db.Emprestimoes.Where(x => x.DataDevolucaoReal <= x.DataDevolucaoPrevista).Count(),
                EmCursoAtrasados  = db.Emprestimoes.Where(x => x.DataDevolucaoPrevista <= DateTime.Today && x.DataDevolucaoReal == null).Count(),
                EmCursoNoPrazo = db.Emprestimoes.Where(x => x.DataDevolucaoPrevista > DateTime.Today && x.DataDevolucaoReal == null).Count()
            };

            List<DTO_EstadoDosLivros> estadoDosLivros = db.Emprestimoes
                .GroupBy(x => x.EmprestimoEstado.Nome)
                .Select(g => new DTO_EstadoDosLivros
                {
                    Estado = g.Key,
                    Total = g.Count()
                })
                .OrderBy(o => o.Estado)
                .ToList();

            ViewBag.EstadoDosLivros = estadoDosLivros;
            ViewBag.ElapsedMilliseconds = stopwatch.ElapsedMilliseconds;
            return View(emprestimos);
        }
    }




}