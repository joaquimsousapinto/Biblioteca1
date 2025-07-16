using Biblioteca1.Models.Metadata;
using System.ComponentModel.DataAnnotations;
using System.Diagnostics.CodeAnalysis;


namespace Biblioteca1.Models
{
    [MetadataType(typeof(MetadataCategoria))]
    public partial class Categoria
    { }

    [MetadataType(typeof(MetadataEditora))]
    public partial class Editora
    { }

    [MetadataType(typeof(MetadataEmprestimoEstado))]
    public partial class EmprestimoEstado
    { }
}