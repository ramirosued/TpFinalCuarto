USE [master]
GO
/****** Object:  Database [FuthubBD]    Script Date: 22/4/2024 20:07:05 ******/
CREATE DATABASE [FuthubBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FuthubBD', FILENAME = N'D:\Programas\MSSQL14.SQLEXPRESS\MSSQL\DATA\FuthubBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FuthubBD_log', FILENAME = N'D:\Programas\MSSQL14.SQLEXPRESS\MSSQL\DATA\FuthubBD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FuthubBD] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FuthubBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FuthubBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FuthubBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FuthubBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FuthubBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FuthubBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [FuthubBD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FuthubBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FuthubBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FuthubBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FuthubBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FuthubBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FuthubBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FuthubBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FuthubBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FuthubBD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FuthubBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FuthubBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FuthubBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FuthubBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FuthubBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FuthubBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FuthubBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FuthubBD] SET RECOVERY FULL 
GO
ALTER DATABASE [FuthubBD] SET  MULTI_USER 
GO
ALTER DATABASE [FuthubBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FuthubBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FuthubBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FuthubBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FuthubBD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FuthubBD] SET QUERY_STORE = OFF
GO
USE [FuthubBD]
GO
/****** Object:  Table [dbo].[Comentario]    Script Date: 22/4/2024 20:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentario](
	[IdComentario] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdJugador] [int] NOT NULL,
	[Contenido] [varchar](500) NOT NULL,
	[Likes] [int] NOT NULL,
	[NombreUsuario] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Comentario] PRIMARY KEY CLUSTERED 
(
	[IdComentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipo]    Script Date: 22/4/2024 20:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipo](
	[IdEquipo] [int] IDENTITY(1,1) NOT NULL,
	[IdPais] [int] NOT NULL,
	[Imagen] [varchar](500) NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Equipo] PRIMARY KEY CLUSTERED 
(
	[IdEquipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jugador]    Script Date: 22/4/2024 20:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jugador](
	[IdJugador] [int] IDENTITY(1,1) NOT NULL,
	[IdPais] [int] NOT NULL,
	[IdEquipo] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[ImagenJugador] [varchar](5000) NULL,
	[Edad] [int] NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
	[Posicion] [varchar](40) NOT NULL,
	[PartidosJugados] [int] NOT NULL,
	[Goles] [int] NOT NULL,
	[Likes] [int] NOT NULL,
	[Dislikes] [int] NOT NULL,
 CONSTRAINT [PK_Jugador] PRIMARY KEY CLUSTERED 
(
	[IdJugador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Like]    Script Date: 22/4/2024 20:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Like](
	[IdLike] [int] IDENTITY(1,1) NOT NULL,
	[IdJugador] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Like] PRIMARY KEY CLUSTERED 
(
	[IdLike] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 22/4/2024 20:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[IdPais] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Imagen] [varchar](5000) NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[IdPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Titulos]    Script Date: 22/4/2024 20:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Titulos](
	[IdTitulo] [int] IDENTITY(1,1) NOT NULL,
	[IdPais] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Imagen] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Titulos] PRIMARY KEY CLUSTERED 
(
	[IdTitulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TituloXEquipo]    Script Date: 22/4/2024 20:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TituloXEquipo](
	[IdTituloXEquipo] [int] IDENTITY(1,1) NOT NULL,
	[IdEquipo] [int] NOT NULL,
	[IdTitulo] [int] NOT NULL,
	[Año] [int] NOT NULL,
 CONSTRAINT [PK_TituloXEquipo] PRIMARY KEY CLUSTERED 
(
	[IdTituloXEquipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TituloXJugador]    Script Date: 22/4/2024 20:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TituloXJugador](
	[IdTituloGanado] [int] IDENTITY(1,1) NOT NULL,
	[IdJugador] [int] NOT NULL,
	[IdTitulo] [int] NOT NULL,
	[Año] [int] NOT NULL,
 CONSTRAINT [PK_TituloXJugador] PRIMARY KEY CLUSTERED 
(
	[IdTituloGanado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 22/4/2024 20:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[contraseña] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NULL,
	[administrador] [bit] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Comentario] ON 

INSERT [dbo].[Comentario] ([IdComentario], [IdUsuario], [IdJugador], [Contenido], [Likes], [NombreUsuario]) VALUES (3, 2, 8, N'chanchita', 0, N'ramiro')
INSERT [dbo].[Comentario] ([IdComentario], [IdUsuario], [IdJugador], [Contenido], [Likes], [NombreUsuario]) VALUES (4, 2, 9, N'grande roger', 0, N'ramiro')
INSERT [dbo].[Comentario] ([IdComentario], [IdUsuario], [IdJugador], [Contenido], [Likes], [NombreUsuario]) VALUES (5, 2, 10, N'hhhh', 0, N'ramiro')
SET IDENTITY_INSERT [dbo].[Comentario] OFF
GO
SET IDENTITY_INSERT [dbo].[Equipo] ON 

INSERT [dbo].[Equipo] ([IdEquipo], [IdPais], [Imagen], [Nombre], [Descripcion]) VALUES (2, 1, N'https://tmssl.akamaized.net/images/wappen/head/209.png?lm=1645539487', N'River Plate', N'El Club Atlético River Plate, fundado en 1901 en La Boca, Argentina, es una entidad polideportiva destacada por su éxito en el fútbol. Con 70 títulos, incluyendo 38 en la Primera División, River Plate es el club más exitoso de Argentina. Disputa sus partidos en el estadio Monumental, el de mayor capacidad en Sudamérica. Además, ostenta récords en copas nacionales y es el club más ganador del fútbol argentino desde su profesionalización en 1931, acumulando 67 títulos oficiales.')
INSERT [dbo].[Equipo] ([IdEquipo], [IdPais], [Imagen], [Nombre], [Descripcion]) VALUES (3, 1, N'https://tmssl.akamaized.net/images/wappen/head/189.png?lm=1511621129', N'Boca Juniors', N'Boca es un equipo de Argentina, es uno de los 5 denominados "Equipos grandes". Tiene una gran historia y para muchos es considerado el mas grande de su pais.')
INSERT [dbo].[Equipo] ([IdEquipo], [IdPais], [Imagen], [Nombre], [Descripcion]) VALUES (4, 1, N'https://tmssl.akamaized.net/images/wappen/head/1444.png?lm=1412762689', N'Racing Club de Avellaneda', N'Racing es un equipo argentino, es uno de los 5 denominados "Equipos grandes". Fue el primer argentino en ganar la Copa Intercontinental tras vencer al Celtic.')
INSERT [dbo].[Equipo] ([IdEquipo], [IdPais], [Imagen], [Nombre], [Descripcion]) VALUES (5, 1, N'https://tmssl.akamaized.net/images/wappen/head/1234.png?lm=1489920510', N'Independiente', N'Independiente es un equipo argentino, es uno de los 5 denominados "Equipos grandes". Es el equipo argentino con mas libertadores en su vitrina, con 7.')
INSERT [dbo].[Equipo] ([IdEquipo], [IdPais], [Imagen], [Nombre], [Descripcion]) VALUES (6, 2, N'https://tmssl.akamaized.net/images/wappen/head/418.png?lm=1697726166', N'Real Madrid', N'Real Madrid es un equipo español. Es el equipo con mas champions leagues conquistadas, con 14.')
INSERT [dbo].[Equipo] ([IdEquipo], [IdPais], [Imagen], [Nombre], [Descripcion]) VALUES (7, 2, N'https://tmssl.akamaized.net/images/wappen/head/13.png?lm=1519120744', N'Atletico Madrid', N'Atletico Madrid es un equipo español. Es un equipo popularmente considerado grande dentro de españa gracias a su gran prestigio tanto nacional como internacional. Es el derby del Real Madrid')
INSERT [dbo].[Equipo] ([IdEquipo], [IdPais], [Imagen], [Nombre], [Descripcion]) VALUES (8, 2, N'https://tmssl.akamaized.net/images/wappen/head/131.png?lm=1406739548', N'Barcelona FC', N'Barcelona es un equipo de Cataluña. Considerado grande por casi todo el mundo. Siempre jugando bajo su lema "Mas que un club".')
INSERT [dbo].[Equipo] ([IdEquipo], [IdPais], [Imagen], [Nombre], [Descripcion]) VALUES (9, 3, N'https://tmssl.akamaized.net/images/wappen/head/31.png?lm=1456567819', N'Liverpool', N'Liverpool es un equipo ingles.')
INSERT [dbo].[Equipo] ([IdEquipo], [IdPais], [Imagen], [Nombre], [Descripcion]) VALUES (10, 3, N'https://tmssl.akamaized.net/images/wappen/head/281.png?lm=1467356331', N'Manchester City', N'Manchester City es un equipo ingles.')
INSERT [dbo].[Equipo] ([IdEquipo], [IdPais], [Imagen], [Nombre], [Descripcion]) VALUES (11, 3, N'https://tmssl.akamaized.net/images/wappen/head/985.png?lm=1457975903', N'Manchester United', N'Manchester United es un equipo ingles.')
INSERT [dbo].[Equipo] ([IdEquipo], [IdPais], [Imagen], [Nombre], [Descripcion]) VALUES (12, 3, N'https://tmssl.akamaized.net/images/wappen/head/11.png?lm=1489787850', N'Arsenal', N'Arsenal es un equipo ingles.')
INSERT [dbo].[Equipo] ([IdEquipo], [IdPais], [Imagen], [Nombre], [Descripcion]) VALUES (13, 1, N'https://tmssl.akamaized.net/images/wappen/head/8057.png?lm=1673614143', N'Atlanta', N'Atlanta es un equipo argentino.')
INSERT [dbo].[Equipo] ([IdEquipo], [IdPais], [Imagen], [Nombre], [Descripcion]) VALUES (14, 3, NULL, N'Chelsea', N'Chelsea es un equipo ingles.')
SET IDENTITY_INSERT [dbo].[Equipo] OFF
GO
SET IDENTITY_INSERT [dbo].[Jugador] ON 

INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [IdEquipo], [Nombre], [ImagenJugador], [Edad], [Descripcion], [Posicion], [PartidosJugados], [Goles], [Likes], [Dislikes]) VALUES (1, 1, 2, N'Nicolas De la Cruz', N'https://img.a.transfermarkt.technology/portrait/big/397458-1625771741.png?lm=1', 26, N'Diego Nicolás de la Cruz Arcosa es un futbolista uruguayo. Juega como centrocampista y su actual equipo es el C. A. River Plate de la Primera División de Argentina. Es internacional absoluto con la selección de Uruguay', N'Centrocampista', 100, 50, 7, 1)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [IdEquipo], [Nombre], [ImagenJugador], [Edad], [Descripcion], [Posicion], [PartidosJugados], [Goles], [Likes], [Dislikes]) VALUES (4, 1, 3, N'Sergio Romero', N'https://img.a.transfermarkt.technology/portrait/big/30690-1596803710.jpg?lm=1', 36, N'Sergio Germán Romero ? es un futbolista profesional argentino. Actualmente se desempeña como arquero en el Club Atlético Boca Juniors de la Liga Profesional de Fútbol de Argentina. Fue internacional con la selección de fútbol de Argentina, siendo el arquero con más presencias en la historia con 96 partidos.', N'Arquero', 310, 0, 51, 5)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [IdEquipo], [Nombre], [ImagenJugador], [Edad], [Descripcion], [Posicion], [PartidosJugados], [Goles], [Likes], [Dislikes]) VALUES (5, 16, 3, N'Luis Advincula', N'https://img.a.transfermarkt.technology/portrait/big/103890-1689009563.jpg?lm=1', 33, N'Luis Jan Piers Advíncula Castrillón es un futbolista profesional peruano. Juega como lateral derecho, extremo derecho o volante y su equipo actual es el C. A. Boca Juniors de la Liga Profesional del Fútbol Argentino. Es internacional con la selección peruana desde el año 2010.', N'Defensor derecho', 200, 20, 34, 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [IdEquipo], [Nombre], [ImagenJugador], [Edad], [Descripcion], [Posicion], [PartidosJugados], [Goles], [Likes], [Dislikes]) VALUES (6, 1, 3, N'Nicolas Valentini', N'https://img.a.transfermarkt.technology/portrait/big/860992-1652278200.JPG?lm=1', 22, N'Nicolás Valentini, ? es un futbolista profesional argentino que se desempeña como defensor central. Su equipo actual es Club Atlético Boca Juniors de la Primera División de Argentina.', N'Defensor central', 50, 10, 11, 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [IdEquipo], [Nombre], [ImagenJugador], [Edad], [Descripcion], [Posicion], [PartidosJugados], [Goles], [Likes], [Dislikes]) VALUES (8, 12, 4, N'Juan Fernando Quintero', N'https://img.a.transfermarkt.technology/portrait/big/122582-1644877928.png?lm=1', 30, N'Juan Fernando Quintero Paniagua, conocido también como Juanfer Quintero, es un futbolista colombiano. Juega como centrocampista y actualmente milita en Racing Club de la Primera División de Argentina. Campeón de la Copa Libertadores 2018 con River Plate, marcó el gol de la victoria en la final contra el Boca Juniors.', N'Delantero', 270, 100, 31, 5)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [IdEquipo], [Nombre], [ImagenJugador], [Edad], [Descripcion], [Posicion], [PartidosJugados], [Goles], [Likes], [Dislikes]) VALUES (9, 12, 4, N'Roger Martinez', N'https://img.a.transfermarkt.technology/portrait/big/285771-1694003905.JPG?lm=1', 29, N'Roger Beyker Martínez es un futbolista colombiano que juega como delantero actualmente se encuentra en Racing Club de Avellaneda de la Primera División de Argentina.?Ha tenido participación en la selección de fútbol de Colombia en sus categorías sub-23 y absoluta. ', N'Delantero', 150, 50, 45, 7)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [IdEquipo], [Nombre], [ImagenJugador], [Edad], [Descripcion], [Posicion], [PartidosJugados], [Goles], [Likes], [Dislikes]) VALUES (10, 1, 5, N'Federico Mancuello', N'https://img.a.transfermarkt.technology/portrait/big/96313-1636330654.JPG?lm=1', 34, N'Federico Andrés Mancuello es un futbolista argentino. Juega como mediocentro ofensivo en Independiente de la Primera División de Argentina', N'Delantero', 100, 120, 79, 21)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [IdEquipo], [Nombre], [ImagenJugador], [Edad], [Descripcion], [Posicion], [PartidosJugados], [Goles], [Likes], [Dislikes]) VALUES (11, 1, 5, N'Santiago Toloza', N'https://img.a.transfermarkt.technology/portrait/big/995585-1662913657.png?lm=1', 21, N'Santiago Federico Toloza ? es un jugador de futbol que actualmente se encuentra jugando en el Club Atlético Independiente de la Primera División de Argentina y cumple las labores de un centrocampista ofensivo. ', N'Centrocampista', 50, 10, 20, 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [IdEquipo], [Nombre], [ImagenJugador], [Edad], [Descripcion], [Posicion], [PartidosJugados], [Goles], [Likes], [Dislikes]) VALUES (12, 1, 2, N'Enzo Perez', N'https://img.a.transfermarkt.technology/portrait/big/56066-1625771376.png?lm=1', 37, N'Enzo Nicolás Pérez es un futbolista argentino. Juega de mediocampista en el C. A. River Plate de la Primera División de Argentina, donde es capitán del equipo. Como jugador del Estudiantes de La Plata, ganó la Copa Libertadores 2009', N'Mediocampista', 200, 30, 88, 12)
SET IDENTITY_INSERT [dbo].[Jugador] OFF
GO
SET IDENTITY_INSERT [dbo].[Like] ON 

INSERT [dbo].[Like] ([IdLike], [IdJugador], [IdUsuario]) VALUES (53, 11, 2)
INSERT [dbo].[Like] ([IdLike], [IdJugador], [IdUsuario]) VALUES (1080, 6, 2)
INSERT [dbo].[Like] ([IdLike], [IdJugador], [IdUsuario]) VALUES (1089, 5, 2)
INSERT [dbo].[Like] ([IdLike], [IdJugador], [IdUsuario]) VALUES (1100, 4, 2)
INSERT [dbo].[Like] ([IdLike], [IdJugador], [IdUsuario]) VALUES (1101, 8, 2)
INSERT [dbo].[Like] ([IdLike], [IdJugador], [IdUsuario]) VALUES (1106, 10, 2)
INSERT [dbo].[Like] ([IdLike], [IdJugador], [IdUsuario]) VALUES (1107, 9, 2)
SET IDENTITY_INSERT [dbo].[Like] OFF
GO
SET IDENTITY_INSERT [dbo].[Pais] ON 

INSERT [dbo].[Pais] ([IdPais], [Nombre], [Imagen]) VALUES (1, N'Argentina', N'https://tmssl.akamaized.net/images/flagge/head/9.png?lm=1520611569')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Imagen]) VALUES (2, N'España', N'https://tmssl.akamaized.net/images/flagge/head/157.png?lm=1520611569')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Imagen]) VALUES (3, N'Inglaterra', N'https://tmssl.akamaized.net/images/flagge/head/189.png?lm=1520611569')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Imagen]) VALUES (4, N'Francia', N'https://tmssl.akamaized.net/images/flagge/head/50.png?lm=1520611569')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Imagen]) VALUES (5, N'Brasil', N'https://tmssl.akamaized.net/images/flagge/head/26.png?lm=1520611569')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Imagen]) VALUES (6, N'Alemania', N'https://tmssl.akamaized.net/images/flagge/head/40.png?lm=1520612525')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Imagen]) VALUES (7, N'Italia', N'https://tmssl.akamaized.net/images/flagge/head/75.png?lm=1520611569')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Imagen]) VALUES (8, N'Portugal', N'https://tmssl.akamaized.net/images/flagge/head/136.png?lm=1520611569')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Imagen]) VALUES (9, N'Holanda', N'https://tmssl.akamaized.net/images/flagge/head/122.png?lm=1520611569')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Imagen]) VALUES (10, N'Uruguay', N'https://tmssl.akamaized.net/images/flagge/head/179.png?lm=1520611569')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Imagen]) VALUES (11, N'México', N'https://tmssl.akamaized.net/images/flagge/head/110.png?lm=1520611569')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Imagen]) VALUES (12, N'Colombia', N'https://tmssl.akamaized.net/images/flagge/head/83.png?lm=1520611569')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Imagen]) VALUES (13, N'Nigeria', N'https://tmssl.akamaized.net/images/flagge/head/124.png?lm=1520611569')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Imagen]) VALUES (14, N'Japón', N'https://tmssl.akamaized.net/images/flagge/head/77.png?lm=1520611569')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Imagen]) VALUES (15, N'Corea del Sur', N'https://tmssl.akamaized.net/images/flagge/head/87.png?lm=1520611569')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Imagen]) VALUES (16, N'Peru', N'https://tmssl.akamaized.net/images/flagge/head/133.png?lm=1520611569')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Imagen]) VALUES (17, N'Chile', N'https://tmssl.akamaized.net/images/flagge/head/33.png?lm=1520611569')
SET IDENTITY_INSERT [dbo].[Pais] OFF
GO
SET IDENTITY_INSERT [dbo].[Titulos] ON 

INSERT [dbo].[Titulos] ([IdTitulo], [IdPais], [Nombre], [Imagen]) VALUES (1, 1, N'Copa Argentina', N'https://tmssl.akamaized.net/images/erfolge/medium/642.png?lm=1686235146')
INSERT [dbo].[Titulos] ([IdTitulo], [IdPais], [Nombre], [Imagen]) VALUES (2, 1, N'Copa LPF', N'https://upload.wikimedia.org/wikipedia/commons/1/16/Copa_de_la_Liga_Profesional_de_F%C3%BAtbol.png')
INSERT [dbo].[Titulos] ([IdTitulo], [IdPais], [Nombre], [Imagen]) VALUES (3, 1, N'Copa Libertadores', N'https://media.tycsports.com/files/2020/12/04/159478/copa-libertadores.jpg')
INSERT [dbo].[Titulos] ([IdTitulo], [IdPais], [Nombre], [Imagen]) VALUES (4, 2, N'Copa del Rey', N'https://cadenaser.com/resizer/8FLkzK_MKEkZS2d3c80nUP1vLKg=/1200x1200/filters:format(jpg):quality(70)/cloudfront-eu-central-1.images.arcpublishing.com/prisaradio/DH6B5CFHWREKXB3XOIUURZFXBQ.jpg')
INSERT [dbo].[Titulos] ([IdTitulo], [IdPais], [Nombre], [Imagen]) VALUES (5, 2, N'Supercopa de España', N'https://phantom-marca.unidadeditorial.es/fa7820ef06c673346aac4ec315509bcc/resize/1200/f/webp/assets/multimedia/imagenes/2023/01/15/16737733261470.jpg')
INSERT [dbo].[Titulos] ([IdTitulo], [IdPais], [Nombre], [Imagen]) VALUES (6, 2, N'Copa de la Liga', N'https://preview.free3d.com/img/2015/07/2704953147293435772/cnalrniu.jpg')
INSERT [dbo].[Titulos] ([IdTitulo], [IdPais], [Nombre], [Imagen]) VALUES (7, 3, N'Premier League', N'https://media.ambito.com/p/fb50a700b0cd71fc1030fcb4c05d3134/adjuntos/239/imagenes/037/635/0037635603/1200x675/smart/premier-league.png')
INSERT [dbo].[Titulos] ([IdTitulo], [IdPais], [Nombre], [Imagen]) VALUES (8, 3, N'Champions League', N'https://phantom-marca.unidadeditorial.es/594875c462f467b67a75c45a524c0184/resize/828/f/jpg/assets/multimedia/imagenes/2023/03/13/16787259352864.jpg')
INSERT [dbo].[Titulos] ([IdTitulo], [IdPais], [Nombre], [Imagen]) VALUES (9, 3, N'Europa League', N'https://tmssl.akamaized.net/images/erfolge/medium/264.png?lm=1520606999')
INSERT [dbo].[Titulos] ([IdTitulo], [IdPais], [Nombre], [Imagen]) VALUES (10, 3, N'Copa FA CUP', N'https://footballpredictions.net/storage/76/1301426.png')
INSERT [dbo].[Titulos] ([IdTitulo], [IdPais], [Nombre], [Imagen]) VALUES (11, 16, N'Copa Peru', N'https://sortitoutsi.b-cdn.net/uploads/trophy/5290552.png')
INSERT [dbo].[Titulos] ([IdTitulo], [IdPais], [Nombre], [Imagen]) VALUES (12, 1, N'Supercopa Argentina', N'https://tmssl.akamaized.net/images/erfolge/verybigquad/970.png?lm=1686235805')
INSERT [dbo].[Titulos] ([IdTitulo], [IdPais], [Nombre], [Imagen]) VALUES (13, 1, N'Trofeo de Campeones', N'https://tmssl.akamaized.net/images/erfolge/medium/971.png?lm=1686235548')
INSERT [dbo].[Titulos] ([IdTitulo], [IdPais], [Nombre], [Imagen]) VALUES (14, 1, N'Recopa sudamericana', N'https://tmssl.akamaized.net/images/erfolge/medium/338.png?lm=1461847499')
INSERT [dbo].[Titulos] ([IdTitulo], [IdPais], [Nombre], [Imagen]) VALUES (15, 8, N'Portugiesischer superpokalsieger', N'https://tmssl.akamaized.net/images/erfolge/medium/337.png?lm=1520606999')
INSERT [dbo].[Titulos] ([IdTitulo], [IdPais], [Nombre], [Imagen]) VALUES (16, 11, N'Campeones de mexico', N'https://tmssl.akamaized.net/images/erfolge/medium/577.png?lm=1653896973')
INSERT [dbo].[Titulos] ([IdTitulo], [IdPais], [Nombre], [Imagen]) VALUES (17, 11, N'Apertura de mexico', N'https://tmssl.akamaized.net/images/erfolge/medium/495.png?lm=1653897239')
INSERT [dbo].[Titulos] ([IdTitulo], [IdPais], [Nombre], [Imagen]) VALUES (19, 11, N'Copa mexico clausura', N'https://tmssl.akamaized.net/images/erfolge/medium/497.png?lm=1654154846')
INSERT [dbo].[Titulos] ([IdTitulo], [IdPais], [Nombre], [Imagen]) VALUES (20, 5, N'Copa de brasil', N'https://tmssl.akamaized.net/images/erfolge/medium/263.png?lm=1461847499')
INSERT [dbo].[Titulos] ([IdTitulo], [IdPais], [Nombre], [Imagen]) VALUES (21, 1, N'Copa sudamericana', N'https://tmssl.akamaized.net/images/erfolge/medium/154.png?lm=1520606999')
INSERT [dbo].[Titulos] ([IdTitulo], [IdPais], [Nombre], [Imagen]) VALUES (22, 8, N'Copa de Portugal', N'https://tmssl.akamaized.net/images/erfolge/medium/100.png?lm=1520606996')
INSERT [dbo].[Titulos] ([IdTitulo], [IdPais], [Nombre], [Imagen]) VALUES (23, 8, N'Primera liga', N'https://tmssl.akamaized.net/images/erfolge/medium/15.png?lm=1520606999')
INSERT [dbo].[Titulos] ([IdTitulo], [IdPais], [Nombre], [Imagen]) VALUES (25, 8, N'Copa de la liga de portugal', N'https://tmssl.akamaized.net/images/erfolge/medium/246.png?lm=1520606999')
INSERT [dbo].[Titulos] ([IdTitulo], [IdPais], [Nombre], [Imagen]) VALUES (26, 1, N'Mundial sub-20', N'https://tmssl.akamaized.net/images/erfolge/medium/160.png?lm=1684831910')
INSERT [dbo].[Titulos] ([IdTitulo], [IdPais], [Nombre], [Imagen]) VALUES (27, 3, N'Copa de la liga de Inglaterra', N'https://tmssl.akamaized.net/images/erfolge/medium/47.png?lm=1520606999')
INSERT [dbo].[Titulos] ([IdTitulo], [IdPais], [Nombre], [Imagen]) VALUES (28, 1, N'Juegos olimpicos', N'https://tmssl.akamaized.net/images/erfolge/medium/451.png?lm=1466588353+')
SET IDENTITY_INSERT [dbo].[Titulos] OFF
GO
SET IDENTITY_INSERT [dbo].[TituloXEquipo] ON 

INSERT [dbo].[TituloXEquipo] ([IdTituloXEquipo], [IdEquipo], [IdTitulo], [Año]) VALUES (1, 2, 1, 2019)
INSERT [dbo].[TituloXEquipo] ([IdTituloXEquipo], [IdEquipo], [IdTitulo], [Año]) VALUES (2, 2, 1, 2020)
INSERT [dbo].[TituloXEquipo] ([IdTituloXEquipo], [IdEquipo], [IdTitulo], [Año]) VALUES (3, 2, 2, 123)
INSERT [dbo].[TituloXEquipo] ([IdTituloXEquipo], [IdEquipo], [IdTitulo], [Año]) VALUES (4, 2, 3, 312312)
INSERT [dbo].[TituloXEquipo] ([IdTituloXEquipo], [IdEquipo], [IdTitulo], [Año]) VALUES (5, 2, 4, 312)
INSERT [dbo].[TituloXEquipo] ([IdTituloXEquipo], [IdEquipo], [IdTitulo], [Año]) VALUES (6, 2, 1, 2019)
INSERT [dbo].[TituloXEquipo] ([IdTituloXEquipo], [IdEquipo], [IdTitulo], [Año]) VALUES (7, 2, 1, 2019)
SET IDENTITY_INSERT [dbo].[TituloXEquipo] OFF
GO
SET IDENTITY_INSERT [dbo].[TituloXJugador] ON 

INSERT [dbo].[TituloXJugador] ([IdTituloGanado], [IdJugador], [IdTitulo], [Año]) VALUES (14, 6, 12, 2021)
INSERT [dbo].[TituloXJugador] ([IdTituloGanado], [IdJugador], [IdTitulo], [Año]) VALUES (18, 8, 3, 2018)
INSERT [dbo].[TituloXJugador] ([IdTituloGanado], [IdJugador], [IdTitulo], [Año]) VALUES (19, 8, 14, 2019)
INSERT [dbo].[TituloXJugador] ([IdTituloGanado], [IdJugador], [IdTitulo], [Año]) VALUES (20, 8, 1, 2019)
INSERT [dbo].[TituloXJugador] ([IdTituloGanado], [IdJugador], [IdTitulo], [Año]) VALUES (21, 8, 12, 2018)
INSERT [dbo].[TituloXJugador] ([IdTituloGanado], [IdJugador], [IdTitulo], [Año]) VALUES (22, 8, 15, 2014)
INSERT [dbo].[TituloXJugador] ([IdTituloGanado], [IdJugador], [IdTitulo], [Año]) VALUES (23, 9, 16, 2019)
INSERT [dbo].[TituloXJugador] ([IdTituloGanado], [IdJugador], [IdTitulo], [Año]) VALUES (24, 9, 17, 2019)
INSERT [dbo].[TituloXJugador] ([IdTituloGanado], [IdJugador], [IdTitulo], [Año]) VALUES (25, 9, 19, 2019)
INSERT [dbo].[TituloXJugador] ([IdTituloGanado], [IdJugador], [IdTitulo], [Año]) VALUES (26, 10, 20, 2018)
INSERT [dbo].[TituloXJugador] ([IdTituloGanado], [IdJugador], [IdTitulo], [Año]) VALUES (27, 10, 21, 2010)
INSERT [dbo].[TituloXJugador] ([IdTituloGanado], [IdJugador], [IdTitulo], [Año]) VALUES (28, 12, 23, 2015)
INSERT [dbo].[TituloXJugador] ([IdTituloGanado], [IdJugador], [IdTitulo], [Año]) VALUES (29, 12, 23, 2014)
INSERT [dbo].[TituloXJugador] ([IdTituloGanado], [IdJugador], [IdTitulo], [Año]) VALUES (30, 12, 22, 2014)
INSERT [dbo].[TituloXJugador] ([IdTituloGanado], [IdJugador], [IdTitulo], [Año]) VALUES (31, 12, 25, 2014)
INSERT [dbo].[TituloXJugador] ([IdTituloGanado], [IdJugador], [IdTitulo], [Año]) VALUES (33, 12, 25, 2012)
INSERT [dbo].[TituloXJugador] ([IdTituloGanado], [IdJugador], [IdTitulo], [Año]) VALUES (34, 12, 3, 2018)
INSERT [dbo].[TituloXJugador] ([IdTituloGanado], [IdJugador], [IdTitulo], [Año]) VALUES (35, 12, 3, 2009)
INSERT [dbo].[TituloXJugador] ([IdTituloGanado], [IdJugador], [IdTitulo], [Año]) VALUES (36, 12, 14, 2019)
INSERT [dbo].[TituloXJugador] ([IdTituloGanado], [IdJugador], [IdTitulo], [Año]) VALUES (37, 12, 1, 2019)
INSERT [dbo].[TituloXJugador] ([IdTituloGanado], [IdJugador], [IdTitulo], [Año]) VALUES (38, 12, 1, 2017)
INSERT [dbo].[TituloXJugador] ([IdTituloGanado], [IdJugador], [IdTitulo], [Año]) VALUES (39, 12, 12, 2020)
INSERT [dbo].[TituloXJugador] ([IdTituloGanado], [IdJugador], [IdTitulo], [Año]) VALUES (40, 12, 12, 2018)
INSERT [dbo].[TituloXJugador] ([IdTituloGanado], [IdJugador], [IdTitulo], [Año]) VALUES (41, 12, 15, 2015)
SET IDENTITY_INSERT [dbo].[TituloXJugador] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [username], [email], [contraseña], [nombre], [administrador]) VALUES (2, N'ramiro', N'dddddd', N'22222222', NULL, 1)
INSERT [dbo].[Usuario] ([IdUsuario], [username], [email], [contraseña], [nombre], [administrador]) VALUES (3, N'ilan', N'ggggggg', N'11111111', NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [username], [email], [contraseña], [nombre], [administrador]) VALUES (4, N'santiago', N'qqqqqqqq', N'33333333', NULL, 1)
INSERT [dbo].[Usuario] ([IdUsuario], [username], [email], [contraseña], [nombre], [administrador]) VALUES (5, N'franco', N'yyyyyyyy', N'77777777', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_Comentario_Jugador] FOREIGN KEY([IdJugador])
REFERENCES [dbo].[Jugador] ([IdJugador])
GO
ALTER TABLE [dbo].[Comentario] CHECK CONSTRAINT [FK_Comentario_Jugador]
GO
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_Comentario_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Comentario] CHECK CONSTRAINT [FK_Comentario_Usuario]
GO
ALTER TABLE [dbo].[Equipo]  WITH CHECK ADD  CONSTRAINT [FK_Equipo_Pais] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Pais] ([IdPais])
GO
ALTER TABLE [dbo].[Equipo] CHECK CONSTRAINT [FK_Equipo_Pais]
GO
ALTER TABLE [dbo].[Jugador]  WITH CHECK ADD  CONSTRAINT [FK_Jugador_Equipo] FOREIGN KEY([IdEquipo])
REFERENCES [dbo].[Equipo] ([IdEquipo])
GO
ALTER TABLE [dbo].[Jugador] CHECK CONSTRAINT [FK_Jugador_Equipo]
GO
ALTER TABLE [dbo].[Jugador]  WITH CHECK ADD  CONSTRAINT [FK_Jugador_Pais] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Pais] ([IdPais])
GO
ALTER TABLE [dbo].[Jugador] CHECK CONSTRAINT [FK_Jugador_Pais]
GO
ALTER TABLE [dbo].[Like]  WITH CHECK ADD  CONSTRAINT [FK_Like_Jugador] FOREIGN KEY([IdJugador])
REFERENCES [dbo].[Jugador] ([IdJugador])
GO
ALTER TABLE [dbo].[Like] CHECK CONSTRAINT [FK_Like_Jugador]
GO
ALTER TABLE [dbo].[Like]  WITH CHECK ADD  CONSTRAINT [FK_Like_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Like] CHECK CONSTRAINT [FK_Like_Usuario]
GO
ALTER TABLE [dbo].[Titulos]  WITH CHECK ADD  CONSTRAINT [FK_Titulos_Pais] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Pais] ([IdPais])
GO
ALTER TABLE [dbo].[Titulos] CHECK CONSTRAINT [FK_Titulos_Pais]
GO
ALTER TABLE [dbo].[TituloXEquipo]  WITH CHECK ADD  CONSTRAINT [FK_TituloXEquipo_Equipo] FOREIGN KEY([IdEquipo])
REFERENCES [dbo].[Equipo] ([IdEquipo])
GO
ALTER TABLE [dbo].[TituloXEquipo] CHECK CONSTRAINT [FK_TituloXEquipo_Equipo]
GO
ALTER TABLE [dbo].[TituloXEquipo]  WITH CHECK ADD  CONSTRAINT [FK_TituloXEquipo_Titulos] FOREIGN KEY([IdTitulo])
REFERENCES [dbo].[Titulos] ([IdTitulo])
GO
ALTER TABLE [dbo].[TituloXEquipo] CHECK CONSTRAINT [FK_TituloXEquipo_Titulos]
GO
ALTER TABLE [dbo].[TituloXJugador]  WITH CHECK ADD  CONSTRAINT [FK_TituloXJugador_Jugador] FOREIGN KEY([IdJugador])
REFERENCES [dbo].[Jugador] ([IdJugador])
GO
ALTER TABLE [dbo].[TituloXJugador] CHECK CONSTRAINT [FK_TituloXJugador_Jugador]
GO
ALTER TABLE [dbo].[TituloXJugador]  WITH CHECK ADD  CONSTRAINT [FK_TituloXJugador_Titulos] FOREIGN KEY([IdTitulo])
REFERENCES [dbo].[Titulos] ([IdTitulo])
GO
ALTER TABLE [dbo].[TituloXJugador] CHECK CONSTRAINT [FK_TituloXJugador_Titulos]
GO
/****** Object:  StoredProcedure [dbo].[Busqueda]    Script Date: 22/4/2024 20:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Busqueda](@terminoBuscado varchar(50))
as
begin
	SELECT 'A' as Tipo, IdJugador as IdRegistro, j.Nombre, j.ImagenJugador as Imagen, p.Imagen as ImagenPais
    FROM Jugador J
	inner join Pais P on p.IdPais=j.IdPais
    WHERE J.Nombre LIKE '%' + @terminoBuscado + '%'
    UNION
    SELECT 'B' as Tipo, IdEquipo as IdRegistro, e.Nombre, e.Imagen as Imagen, p.Imagen as ImagenPais
    FROM Equipo E
	inner join Pais P on P.IdPais=E.IdPais
    WHERE E.Nombre LIKE '%' + @terminoBuscado + '%'
    ORDER BY tipo, nombre
end
GO
/****** Object:  StoredProcedure [dbo].[EliminarJugador]    Script Date: 22/4/2024 20:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[EliminarJugador]
@IdJugador int
As
begin
	Delete from Comentario where IdJugador=@IdJugador
	DELETE FROM "Like" WHERE IdJugador = @IdJugador;
	DELETE FROM TituloXJugador WHERE IdJugador = @IdJugador;
	Delete from Jugador where IdJugador=@IdJugador
end 
GO
/****** Object:  StoredProcedure [dbo].[GetComentarioByJugador]    Script Date: 22/4/2024 20:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetComentarioByJugador](@idJugador int)
as
begin
select * from Comentario where IdJugador=@idJugador
end
GO
/****** Object:  StoredProcedure [dbo].[GetEquipoByID]    Script Date: 22/4/2024 20:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetEquipoByID](@idEquipo int)
as
begin
select Equipo.*,Pais.Imagen as ImPais from Equipo 
inner join Pais on Pais.IdPais=Equipo.IdPais
where IdEquipo=@idEquipo
end
GO
/****** Object:  StoredProcedure [dbo].[GetEquipos]    Script Date: 22/4/2024 20:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[GetEquipos]
as
begin
	select * from Equipo
	order by Nombre
end
GO
/****** Object:  StoredProcedure [dbo].[GetEquiposByPais]    Script Date: 22/4/2024 20:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetEquiposByPais](@idPais int)
as
begin
select * from Equipo where IdPais=@idPais
end
GO
/****** Object:  StoredProcedure [dbo].[GetJugadorByID]    Script Date: 22/4/2024 20:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetJugadorByID](@idJugador int)
as
begin
select J.*, E.Imagen as ImEquipo, P.Imagen as ImPais from Jugador J
inner join Equipo E on E.IdEquipo=J.IdEquipo
inner join Pais P on P.IdPais=J.IdPais
where IdJugador=@idJugador
end
GO
/****** Object:  StoredProcedure [dbo].[GetJugadoresByEquipo]    Script Date: 22/4/2024 20:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetJugadoresByEquipo](@idEquipo int)
as
begin
select J.*,p.Imagen as ImPais from Jugador j 
inner join Pais p on j.IdPais=p.IdPais
where IdEquipo=@idEquipo
end
GO
/****** Object:  StoredProcedure [dbo].[GetJugadoresByPais]    Script Date: 22/4/2024 20:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetJugadoresByPais](@idPais int)
as
begin
select * from Jugador where IdPais=@idPais
end
GO
/****** Object:  StoredProcedure [dbo].[GetPaises]    Script Date: 22/4/2024 20:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetPaises]
as
begin
	select * from Pais
	order by Nombre
end

GO
/****** Object:  StoredProcedure [dbo].[GetTENPlayers]    Script Date: 22/4/2024 20:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetTENPlayers]
as
begin
select TOP 10 * FROM Jugador
ORDER BY Likes DESC
end
GO
/****** Object:  StoredProcedure [dbo].[GetTitulosByEquipo]    Script Date: 22/4/2024 20:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetTitulosByEquipo](@idEquipo int)
as
begin
select TE.*,T.Imagen,T.Nombre from TituloXEquipo TE
inner join Titulos T on T.IdTitulo=TE.IdTitulo
where IdEquipo=@idEquipo
order by Año desc
end
GO
/****** Object:  StoredProcedure [dbo].[GetTitulosByJugador]    Script Date: 22/4/2024 20:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetTitulosByJugador](@idJugador int)
as
begin
select *,T.Imagen,T.Nombre from TituloXJugador TJ
inner join Titulos T on T.IdTitulo=TJ.IdTitulo
where IdJugador=@idJugador
order by Año desc
end
GO
/****** Object:  StoredProcedure [dbo].[GetUsuarioByID]    Script Date: 22/4/2024 20:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetUsuarioByID](@idUsuario int) 
as
begin
select * from  Usuario where IdUsuario=@idUsuario

end
GO
/****** Object:  StoredProcedure [dbo].[GetUsuarioByUsername]    Script Date: 22/4/2024 20:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetUsuarioByUsername](@Username varchar(50)) 
as
begin
select * from  Usuario where username=@Username

end
GO
/****** Object:  StoredProcedure [dbo].[InsertarComentario]    Script Date: 22/4/2024 20:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertarComentario]
@idUsuario int,
@nombreUsuario varchar(50),
@idJugador int,
@Contenido varchar(500),
@Likes int
as
begin
insert into Comentario(IdUsuario,NombreUsuario,IdJugador,Contenido,Likes)
values(@idUsuario,@nombreUsuario,@idJugador,@Contenido,@Likes)
end



GO
/****** Object:  StoredProcedure [dbo].[InsertarJugador]    Script Date: 22/4/2024 20:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[InsertarJugador]
(
    @IdPais INT,
    @IdEquipo INT,
    @Nombre VARCHAR(50),
    @Imagen VARCHAR(5000),
    @Edad INT,
    @Descripcion VARCHAR(500),
    @Posicion VARCHAR(40),
    @PartidosJugados INT,
    @Goles INT,
    @Likes INT,
    @Dislikes INT
)
AS
BEGIN
    INSERT INTO [dbo].[Jugador]
    (
        [IdPais],
        [IdEquipoActual],
        [Nombre],
        [ImagenJugador],
        [Edad],
        [Descripcion],
        [Posicion],
        [PartidosJugados],
        [Goles],
        [Likes],
        [Dislikes]
    )
    VALUES
    (
        @IdPais,
        @IdEquipo,
        @Nombre,
        @Imagen,
        @Edad,
        @Descripcion,
        @Posicion,
        @PartidosJugados,
        @Goles,
        @Likes,
        @Dislikes
    );

END
GO
/****** Object:  StoredProcedure [dbo].[ModificarLikes]    Script Date: 22/4/2024 20:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarLikes]
    @idUsuario INT,
    @idJugador INT
AS
BEGIN
    DECLARE @likeExistente INT;

    -- Verificar si el like ya existe para el usuario y el jugador
    SELECT @likeExistente = COUNT(*) FROM [dbo].[Like] WHERE IdUsuario = @idUsuario AND IdJugador = @idJugador;

    IF @likeExistente > 0
    BEGIN
        -- Si el like ya existe, borrarlo y restar el like al jugador
        DELETE FROM [dbo].[Like] WHERE idUsuario = @idUsuario AND idJugador = @idJugador;

        UPDATE Jugador SET Likes = Likes - 1 WHERE IdJugador = @idJugador;
    END
    ELSE
    BEGIN
        -- Si el like no existe, insertarlo y sumar el like al jugador
        INSERT INTO [dbo].[Like] (IdUsuario, IdJugador) VALUES (@idUsuario, @idJugador);

        UPDATE Jugador SET Likes = Likes + 1 WHERE IdJugador = @idJugador;
    END
	return (select Likes from Jugador where IdJugador=@idJugador)
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerLikesPorJugador]    Script Date: 22/4/2024 20:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerLikesPorJugador]
    @idJugador INT
AS
BEGIN
    SELECT Likes
    FROM Jugador
    WHERE IdJugador = @idJugador;
END
GO
USE [master]
GO
ALTER DATABASE [FuthubBD] SET  READ_WRITE 
GO
