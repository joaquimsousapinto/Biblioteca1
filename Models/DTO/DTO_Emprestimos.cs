using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Biblioteca1.Models.DTO
{
    public class DTO_Emprestimos
    {
        public int Realizados() { return EmCursoNoPrazo + EmCursoAtrasados + ConcluidosAtrasados + ConcluidosNoPrazo; }
        public int Concluidos() { return ConcluidosAtrasados + ConcluidosNoPrazo; }
        public int ConcluidosNoPrazo { get; set; }
        public int ConcluidosAtrasados { get; set; }
        public int EmCurso() { return EmCursoNoPrazo + EmCursoAtrasados; }
        public int EmCursoNoPrazo { get; set; }
        public int EmCursoAtrasados { get; set; }

    }
}