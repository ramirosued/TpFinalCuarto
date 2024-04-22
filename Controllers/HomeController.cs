using Microsoft.AspNetCore.Mvc;
using TP11.Models;
namespace TP11.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        return RedirectToAction ("Inicio", "Home");
    }
    
    public IActionResult Registro()
    {
        return View();
    }
    public IActionResult CambiarContraseña()
    {
        return View();
    }
    public IActionResult Perfil(int IdUsuario)
    {
        ViewBag.Datos=BD.mostrarDatos(IdUsuario);
        return View();
    }
    public IActionResult Inicio()
    {
        if (BD.user!=null) ViewBag.IdUsuario=BD.user.IdUsuario;
        ViewBag.PrimerosJugadores=BD.GetTENPlayers();
        return View();
        
        
    }
    
    public IActionResult Busqueda(string terminoBuscado)
    {
        if(BD.user != null){
        ViewBag.terminoBuscado=terminoBuscado;
        ViewBag.ListaResultados=BD.Busqueda(terminoBuscado);
        return View("Busqueda");
        }else{
        return RedirectToAction ("Index", "Home");
        }
        
    }
    
    public IActionResult InfoJugador(int IdJugador)
    {
        if(BD.user != null)
        {
            ViewBag.Jugador=BD.GetJugadorByID(IdJugador);
            ViewBag.TitulosJugador=BD.GetTitulosByJugador(IdJugador);
            ViewBag.ComentariosJugador=BD.GetComentarioByJugador(IdJugador);
            ViewBag.Usuario=BD.user;
        return View("InfoJugador");
        }else{
        return RedirectToAction ("Index", "Home");
        }

    }
    public IActionResult InfoEquipo(int IdEquipo)
    {
        ViewBag.Equipo=BD.GetEquipoByID(IdEquipo);
        ViewBag.TitulosEquipo=BD.GetTitulosByEquipo(IdEquipo);
        ViewBag.ListaJugadores=BD.GetJugadoresByEquipo(IdEquipo);
        return View();
    }

    public IActionResult Perfil(string username)
    {
        ViewBag.Perfil=BD.GetUsuarioByUsername(username);
        return View();
    }
    

    public IActionResult AgregarJugador()
    {
            if(BD.user != null){
            ViewBag.ListaPaises=BD.GetPaises();
            ViewBag.ListaEquipos=BD.GetEquipos();
        return View("AgregarJugador");
        }else{
        return RedirectToAction ("Index", "Home");
        }
    }

    public IActionResult GuardarJugador(Jugador jug)
    {
        BD.InsertarJugador(jug);
        return RedirectToAction ("Inicio", "Home");
    }

    public IActionResult AgregarTituloJugador()
    {
        ViewBag.ListaPaises=BD.GetPaises();
        ViewBag.ListaEquipos=BD.GetEquipos();
        return View();
    }

    public IActionResult AgregarComentario(Comentario com)
    {
        BD.InsertarComentario(com);
        return RedirectToAction ("InfoJugador",new{IdJugador=com.IdJugador});
    }
        int num=0;
  
    private bool sucedio = false;

    public object DarLike(int IdJugador, int IdUsuario)
    {
        if(BD.user != null)
        {
            int likesAntes =BD.ObtenerLikesPorJugador(IdJugador);
            int likesActualizados = BD.ModificarLikes(IdJugador,IdUsuario);
            bool likeDado=likesActualizados>likesAntes;
            return new {respuesta=likesActualizados, likeDado=likeDado};
        }else return new {respuesta = "NoLog"};
    }

    public object ComprobarInicio()
    {
        if(BD.user != null) return new {respuesta = "OK"};
        else return new {respuesta = "NoLog"};
    }
 public IActionResult EliminarJugador(int IdJugador)
    {
        BD.eliminarJugadorById(IdJugador);

        return RedirectToAction ("Inicio");
    }
    
}