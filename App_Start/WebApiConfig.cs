using Biblioteca1.Areas.HelpPage;
using System.Net.Http.Headers;
using System.Web.Http;
using System.Web.Http.Cors;

namespace Biblioteca1
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Configuração e serviços de API Web

            // Rotas de API Web
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
            // --- Configuração para forçar a saída JSON ---

            // Remove o formatador XML padrão
            config.Formatters.Remove(config.Formatters.XmlFormatter);

            // Opcional: Se quiser garantir que o JSON seja o formatador padrão para todos os tipos de mídia.
            config.Formatters.JsonFormatter.SupportedMediaTypes.Add(new MediaTypeHeaderValue("text/html"));
            // Esta linha acima faz com que o navegador (que geralmente pede text/html) receba JSON.

            // --- Fim da configuração JSON ---

            // --- Configuração CORS ---
            // Habilita CORS globalmente para todas as origens, cabeçalhos e métodos
            // CUIDADO: Em produção, você deve restringir as origens, cabeçalhos e métodos permitidos.
            var cors = new EnableCorsAttribute("*", "*", "*");
            config.EnableCors(cors);

            // Exemplo de configuração CORS mais específica (descomente e ajuste conforme necessário)
            // var corsSpecific = new EnableCorsAttribute("http://seu-dominio.com", "*", "GET,POST");
            // config.EnableCors(corsSpecific);
            // OU você pode aplicar o atributo [EnableCors] diretamente nos seus controllers ou métodos de ação.
            // --- Fim da configuração CORS ---
        }
    }
}
