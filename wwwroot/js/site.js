// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.



function verificarContraseña() {
    let campoContraseña = document.getElementById('contraseña1').value;
    let campoContraseña2 = document.getElementById('contraseña2').value;
    let verificada=campoContraseña.length >= 8 && campoContraseña==campoContraseña2
    if (verificada==false){
        const error=document.getElementById('errorIngreso')
        error.innerHTML="Revise que las contraseñas sean iguales o que tengan 8 dígitos o más"
    }
    return verificada

}



function ActualizarLikes(IdJ, IdU) 
{
    
    $.ajax(
        {
            type:'POST',
            dataType:'JSON',
            url:'/Home/DarLike',
            data:{IdJugador: IdJ, idUsuario: IdU},
            success:
            function(response){
                // sumar 1 en el like
                if (response.respuesta == "NoLog")
                {
                    alert("Primero debes loguearte");
                }
                else{
                    //if(response.likeDado) document.getElementById()
                    document.getElementById("CantLikes_"+IdJ).innerText=response.respuesta+ " likes";
                }

            }
        }
    )
}


function ComprobarInicio() 
{
    
    $.ajax(
        {
            type:'POST',
            dataType:'JSON',
            url:'/Home/ComprobarInicio',
            success:
            function(response){
                // sumar 1 en el like
                if (response.respuesta == "NoLog")
                {
                    alert("Primero debes loguearte");
                }

            }
        }
    )
}