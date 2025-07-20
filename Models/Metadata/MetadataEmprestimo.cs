using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Biblioteca1.Models.Metadata
{
    public class MetadataEmprestimo
    {
        [Display(Name = "N.º do Empréstimo")]
        public int Id { get; set; }
        [Display(Name = "Nome do Utilizador")]
        [Required(ErrorMessage = "O campo {0} é de preenchimento obrigatório.")]
        public int UtilizadorId { get; set; }
        [Display(Name = "Data  de Empréstimo")]
        [DataType(DataType.DateTime)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-dd}")]
        [Required(ErrorMessage = "O campo {0} é de preenchimento obrigatório.")]
        public System.DateTime DataEmprestimo { get; set; }
        [Display(Name = "Data de Entrega (P)")]
        [DataType(DataType.DateTime)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-dd}")]
        [Required(ErrorMessage = "O campo {0} é de preenchimento obrigatório.")]
        public Nullable<System.DateTime> DataDevolucaoPrevista { get; set; }
        [Display(Name = "Data de Entrega (R)")]
        [DataType(DataType.DateTime)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-dd}")]
        public Nullable<System.DateTime> DataDevolucaoReal { get; set; }
        [Display(Name = "Estado do Livro")]
        [Required(ErrorMessage = "O campo {0} é de preenchimento obrigatório.")]
        public int EstadoId { get; set; }

        [Display(Name = "Utilizador")]
        public virtual Utilizador Utilizador { get; set; }
        [Display(Name = "Estado do Livro")]
        public virtual EmprestimoEstado EmprestimoEstado { get; set; }
        [Display(Name = "Livro(s)")]
        public virtual ICollection<EmprestimoLivro> EmprestimoLivroes { get; set; }
    }
}