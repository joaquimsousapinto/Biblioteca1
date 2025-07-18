using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using System.Web.Http.Description;
using Biblioteca1.Models;

namespace Biblioteca1.Controllers.API
{
    public class AutoresController : ApiController
    {
        private readonly Biblioteca1Entities db = new Biblioteca1Entities();

        // GET: api/Autores
        public IQueryable<DTO_AutorIndex> GetAutors()
        {
            return db.Autors.Select(x => new DTO_AutorIndex()
            {
                Id = x.Id,
                Nome = x.Nome
            }).AsQueryable();
        }

        // GET: api/Autores/5
        [ResponseType(typeof(DTO_Autor))]
        public IHttpActionResult GetAutor(int id)
        {
            Autor autor = db.Autors.Find(id);
            if (autor == null)
            {
                return NotFound();
            }
            DTO_Autor dTO_Autor = new DTO_Autor()
            {
                Id = id,
                Nome = autor.Nome,
                Bibliografia = autor.Bibliografia,
                DataNascimento = autor.DataNascimento.HasValue ? autor.DataNascimento.Value.ToString("yyyy-MM-dd") : null,
                DataMorte = autor.DataMorte.HasValue ? autor.DataMorte.Value.ToString("yyyy-MM-dd") : null,
                Livros = autor.LivroAutors.Select(l => new DTO_LivroIndex()
                {
                    Id = l.Livro.Id,
                    Titulo = l.Livro.Titulo
                }).ToList()
            };
            return Ok(dTO_Autor);
        }
    }
    public class DTO_AutorIndex
    {
        public int Id { get; set; }
        public string Nome { get; set; }
    }
    public class DTO_Autor
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public string Bibliografia { get; set; }
        public string DataNascimento { get; set; }
        public string DataMorte { get; set; }
        public List<DTO_LivroIndex> Livros { get; set; }
    }

    public class DTO_LivroIndex
    {
        public int Id { get; set; }
        public string Titulo { get; set; }
    }
}