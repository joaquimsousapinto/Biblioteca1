using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Biblioteca1.Models.Metadata
{
    public class MetadataUtilizador
    {
        public int Id { get; set; }
        [Display(Name = "Nome")]
        [Required(ErrorMessage = "O campo {0} é de preenchimento obrigatório.")]
        [StringLength(256, MinimumLength = 4, ErrorMessage = "O campo {0} deve ter entre {2} e {1} carateres.")]
        public string Nome { get; set; }
        [Display(Name = "Morada")]
        [DataType(DataType.MultilineText)]
        [StringLength(1024, ErrorMessage = "O campo {0} deve ter no máximo e {1} carateres.")]
        public string Morada { get; set; }
        [StringLength(64, ErrorMessage = "O campo {0} deve ter no máximo e {1} carateres.")]
        public string Telefone { get; set; }
        [StringLength(128, ErrorMessage = "O campo {0} deve ter no máximo e {1} carateres.")]
        public string Email { get; set; }
        [Display(Name = "Data de Nascimento")]
        [DataType(DataType.DateTime)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-dd}")]
        public Nullable<System.DateTime> DataNascimento { get; set; }
        public string Sexo { get; set; }

        [Display(Name = "Empréstimo(s)")]
        public virtual ICollection<Emprestimo> Emprestimoes { get; set; }
    }
}