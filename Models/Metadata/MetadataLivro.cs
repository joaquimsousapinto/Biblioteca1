using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Biblioteca1.Models.Metadata
{
    public class MetadataLivro
    {
        public int Id { get; set; }
        [Display(Name = "Título")]
        [Required(ErrorMessage = "O campo {0} é de preenchimento obrigatório.")]
        [StringLength(256, MinimumLength = 4, ErrorMessage = "O campo {0} deve ter entre {2} e {1} carateres.")]
        public string Titulo { get; set; }
        [Display(Name = "Ano de publicação")]
        [Required(ErrorMessage = "O campo {0} é de preenchimento obrigatório.")]
        public int AnoPublicacao { get; set; }
        [Display(Name = "Editora")]
        [Required(ErrorMessage = "O campo {0} é de preenchimento obrigatório.")]
        public int EditoraId { get; set; }
        [Display(Name = "Ano de edição")]
        [Required(ErrorMessage = "O campo {0} é de preenchimento obrigatório.")]
        public int AnoEdicao { get; set; }
        public Nullable<int> Exemplares { get; set; }

        [Display(Name = "Editora(s)")]
        public virtual Editora Editora { get; set; }
        [Display(Name = "Emprétimo(s)")]
        public virtual ICollection<EmprestimoLivro> EmprestimoLivroes { get; set; }
        [Display(Name = "Autor(es)")]
        public virtual ICollection<LivroAutor> LivroAutors { get; set; }
        [Display(Name = "Categoria(s)")]
        public virtual ICollection<Categoria> Categorias { get; set; }
    }
}