using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Biblioteca1.Models.Metadata
{
    public class MetadataEmprestimoEstado
    {
        public int Id { get; set; }
        [Display(Name ="Nome do Estado")]
        [Required(ErrorMessage = "O campo {0} é de preenchimento obrigatório.")]
        [StringLength(256, MinimumLength = 4, ErrorMessage = "O campo {0} deve ter entre {2} e {1} carateres.")]
        public string Nome { get; set; }

    }
}