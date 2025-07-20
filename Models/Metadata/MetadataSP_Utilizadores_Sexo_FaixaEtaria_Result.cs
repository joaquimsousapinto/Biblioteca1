using System;
using System.ComponentModel.DataAnnotations;

namespace Biblioteca1.Models.Metadata
{
    public class MetadataSP_Utilizadores_Sexo_FaixaEtaria_Result
    {
        [Key]
        public string Sexo { get; set; }
        [Key]
        [Display (Name ="Faixa Etária")]
        public string FaixaEtaria { get; set; }
        public Nullable<int> Total { get; set; }
    }
}