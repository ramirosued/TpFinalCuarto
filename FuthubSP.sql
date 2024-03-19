CREATE procedure GetJugadorByID(@idJugador int)
as
begin
select J.*, E.Imagen, P.Imagen from Jugador J
inner join Equipo E on E.IdEquipo=J.IdEquipo
inner join Pais P on P.IdPais=J.IdPais
where IdJugador=@idJugador
end
go

CREATE procedure GetEquipoByID(@idEquipo int)
as
begin
select Equipo.*,Pais.Imagen from Equipo 
inner join Pais on Pais.IdPais=Equipo.IdPais
where IdEquipo=@idEquipo
end
go

CREATE procedure GetUsuarioByID(@idUsuario int) 
as
begin
select * from  Usuario where IdUsuario=@idUsuario

end
go

CREATE procedure GetJugadoresByEquipo(@idEquipo int)
as
begin
select * from Jugador where IdEquipo=@idEquipo
end
go

CREATE procedure GetJugadoresByPais(@idPais int)
as
begin
select * from Jugador where IdPais=@idPais
end
go

CREATE procedure GetComentarioByJugador(@idJugador int)
as
begin
select * from Comentario where IdJugador=@idJugador
end
go

CREATE procedure GetEquiposByPais(@idPais int)
as
begin
select * from Equipo where IdPais=@idPais
end
go

CREATE procedure GetTitulosByEquipo(@idEquipo int)
as
begin
select TE.*,T.Imagen,T.Nombre from TituloXEquipo TE
inner join Titulos T on T.IdTitulo=TE.IdTitulo
where IdEquipo=@idEquipo
end
go

CREATE procedure GetTitulosByJugador(@idJugador int)
as
begin
select *,T.Imagen,T.Nombre from TituloXJugador TJ
inner join Titulos T on T.IdTitulo=TJ.IdTitulo
where IdJugador=@idJugador
end
go

CREATE procedure GetTENPlayers
as
begin
select TOP 10 * FROM Jugador
ORDER BY Likes DESC
end
go


