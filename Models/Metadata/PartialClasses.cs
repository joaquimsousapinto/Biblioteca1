using Biblioteca1.Models.Metadata;
using System.ComponentModel.DataAnnotations;
using System.Diagnostics.CodeAnalysis;


namespace Biblioteca1.Models
{
    [MetadataType(typeof(MetadataAutor))]
    public partial class Autor
    { }

    [MetadataType(typeof(MetadataCategoria))]
    public partial class Categoria
    { }

    [MetadataType(typeof(MetadataEditora))]
    public partial class Editora
    { }

    [MetadataType(typeof(MetadataEmprestimoEstado))]
    public partial class EmprestimoEstado
    { }

    [MetadataType(typeof(MetadataLivro))]
    public partial class Livro
    { }

    [MetadataType(typeof(MetadataUtilizador))]
    public partial class Utilizador
    { }
}