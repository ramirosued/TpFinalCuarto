using Dapper;
using System.Data.SqlClient;
using System.Data;
namespace TP11.Models;

public static class BD
{
    public static Usuario user = null;


    public static string _connectionString = @"Server=DESKTOP-K5G1LDU\SQLEXPRESS;DataBase=FuthubBD;Trusted_Connection=True;";

    public static void CrearUsuario(Usuario us)
    {
        using (SqlConnection BD = new SqlConnection(_connectionString))
        {
            string sql = "INSERT INTO Usuario([username],[contraseña],[email]) VALUES(@Username,@Contraseña,@mail)";
            BD.Execute(sql, new { username = us.username, contraseña = us.contraseña, mail = us.mail });
        }
    }

    public static void CambiarContraseña(string Username, string nuevaContraseña)
    {
        using (SqlConnection BD = new SqlConnection(_connectionString))
        {
            string sql = "UPDATE Usuario SET contraseña=@NuevaContraseña where username= @username";
            BD.Execute(sql, new { NuevaContraseña = nuevaContraseña, username = Username });
        }
    }

    public static Usuario mostrarDatos(int IdUsuario)
    {
        Usuario us = null;
        using (SqlConnection BD = new SqlConnection(_connectionString))
        {
            string sql = "SELECT username, nombre, email from Usuario where idUsuario=@IDusuario";
            us = BD.QueryFirstOrDefault<Usuario>(sql, new { IdUsuario = IdUsuario });
        }
        return us;
    }

    public static string GetContraseñaPorUsername(string username)
    {
        string contraseña = null;
        using (SqlConnection BD = new SqlConnection(_connectionString))
        {
            string sql = "SELECT contraseña FROM Usuario WHERE username=@Username";
            contraseña = BD.QueryFirstOrDefault<string>(sql, new { Username = username });
        }
        return contraseña;
    }


    public static Jugador GetJugadorByID(int idjug)
    {
        Jugador UnJugador = null;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "GetJugadorByID";
            UnJugador = db.QueryFirstOrDefault<Jugador>(sp, new { IdJugador = idjug }, commandType: CommandType.StoredProcedure);
        }
        return UnJugador;
    }
    public static Equipo GetEquipoByID(int idteam)
    {
        Equipo UnEquipo = null;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "GetEquipoByID";
            UnEquipo = db.QueryFirstOrDefault<Equipo>(sp, new { IdEquipo = idteam }, commandType: CommandType.StoredProcedure);
        }
        return UnEquipo;
    }
    public static Usuario GetUsuarioByUsername(string username)
    {
        Usuario us = null;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "GetUsuarioByUsername";
            us = db.QueryFirstOrDefault<Usuario>(sp, new { Username = username }, commandType: CommandType.StoredProcedure);
        }
        return us;
    }

    public static List<Jugador> GetJugadoresByEquipo(int idteam)
    {
        List<Jugador> ListaJugadores = null;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "GetJugadoresByEquipo";
            ListaJugadores = db.Query<Jugador>(sp, new { IdEquipo = idteam }, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaJugadores;
    }
    public static List<Jugador> GetJugadoresByPais(int idPais)
    {
        List<Jugador> ListaJugadores = null;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "GetJugadoresByEquipo";
            ListaJugadores = db.Query<Jugador>(sp, new { IdPais = idPais }, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaJugadores;
    }
    public static List<Comentario> GetComentarioByJugador(int idJugador)
    {
        List<Comentario> ListaComentarios = null;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "GetComentarioByJugador";
            ListaComentarios = db.Query<Comentario>(sp, new { IdJugador = idJugador }, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaComentarios;
    }
    public static List<Equipo> GetEquiposByPais(int idPais)
    {
        List<Equipo> ListaEquipos = null;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "GetEquiposByPais";
            ListaEquipos = db.Query<Equipo>(sp, new { IdPais = idPais }, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaEquipos;
    }
    public static List<TituloXEquipo> GetTitulosByEquipo(int idEquipo)
    {
        List<TituloXEquipo> ListaTitulos = null;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "GetTitulosByEquipo";
            ListaTitulos = db.Query<TituloXEquipo>(sp, new { IdEquipo = idEquipo }, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaTitulos;
    }
    public static List<Jugador> GetTENPlayers()
    {
        List<Jugador> ListaPlayers = null;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "GetTENPlayers";
            ListaPlayers = db.Query<Jugador>(sp, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaPlayers;
    }
    public static List<TituloXJugador> GetTitulosByJugador(int idJugador)
    {
        List<TituloXJugador> ListaTitulos = null;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "GetTitulosByJugador";
            ListaTitulos = db.Query<TituloXJugador>(sp, new { idJugador = idJugador }, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaTitulos;
    }

    public static void InsertarJugador(Jugador jug)
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "InsertarJugador";
            db.Execute(sp, new
            {
                IdPais = jug.IdPais,
                IdEquipo = jug.IdEquipo,
                Nombre = jug.Nombre,
                Imagen = jug.ImagenJugador,
                Edad = jug.Edad,
                Descripcion = jug.Descripcion,
                Posicion = jug.Posicion,
                PartidosJugados = jug.PartidosJugados,
                Goles = jug.Goles,
                Likes = 0,
                Dislikes = 0
            }, commandType: CommandType.StoredProcedure);

        }
    }

    public static List<ResultadoBusqueda> Busqueda(string buscado)
    {
        List<ResultadoBusqueda> ListaResultados = null;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "Busqueda";
            ListaResultados = db.Query<ResultadoBusqueda>(sp, new { terminoBuscado = buscado }, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaResultados;
    }

    public static List<Pais> GetPaises()
    {
        List<Pais> ListaPaises = null;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "GetPaises";
            ListaPaises = db.Query<Pais>(sp, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaPaises;
    }

    public static List<Equipo> GetEquipos()
    {
        List<Equipo> ListaEquipos = null;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "GetEquipos";
            ListaEquipos = db.Query<Equipo>(sp, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaEquipos;
    }

    public static void InsertarComentario(Comentario com)
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "InsertarComentario";
            db.Execute(sp, new { idUsuario = com.IdUsuario, nombreUsuario = com.NombreUsuario, idJugador = com.IdJugador, Contenido = com.Contenido, Likes = 0 }, commandType: CommandType.StoredProcedure);
        }
    }

    public static int ModificarLikes(int IdJugador, int IdUsuario)
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "ModificarLikes";
            db.Execute(sp, new { idJugador = IdJugador, idUsuario = IdUsuario }, commandType: CommandType.StoredProcedure);
            string query = "SELECT Likes FROM Jugador WHERE IdJugador = @idJugador";
            return db.QueryFirstOrDefault<int>(query, new { idJugador = IdJugador });
        }

    }

    public static int ObtenerLikesPorJugador(int idJugador)
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "ObtenerLikesPorJugador";
            return db.QueryFirstOrDefault<int>(sp, new { idJugador }, commandType: CommandType.StoredProcedure);
        }
    }


   public static void eliminarJugadorById(int IdJugador)
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "EliminarJugador";
            db.Execute(sp, new { IdJugador }, commandType: CommandType.StoredProcedure);
        }
    }


}