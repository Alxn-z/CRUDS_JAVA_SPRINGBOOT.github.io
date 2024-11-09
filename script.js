//async: ejecutan operaciones en un modelo de datos  
//promises: objeto qe maneja peticiones asincronas. *pending *fulfilled *rejected

const apiURL = "http://localhost:8080/api/eventos"

async function listarEventos() {
    //invocar metodo de la API de forma asincrona:
    //usar la ruta que corresponde al metodo "listar todos" o "select all"
    // elemento HTML en el cual se va renderizar
    const response = await fetch(apiURL);
    //obtener resultado del "response" en formato json
    const eventos =response.json();
    //elemento HTML en el cual se va a renderizar:
    const listarEventos = document.querySelector("eventos-table tbody")

    //pendiente: validar si usaurio es !=null
    //<td>${usuario}</td>: se agregan los datos que creamos en modelo 
    usuarios.arrray.array.forEach(usuario => {
        const fila = document.createElement("tr");
        fila.innerHTML= ` 
        <td>${eventos.nombre}</td>
        <td>${eventos.lugar}</td>
        <td>${eventos.fecha_hora}</td>
        <td>${eventos.descripcion}</td> 

        `;
        

        listarEventos.appendChild(fila);
    });
}

async function crear_editar_Evetntos(params) { 
    
    //capturar informacion de elementos HTML:
    const nombre= document.getElementById("nombre").value;
    const lugar= document.getElementById("lugar").value;
    const fecha_hora= document.getElementById("fecha_hora").value;
    const descripcion= document.getElementById("descripcion").value;

    //se crea un objeto JSON que tiene la info que se va a enviar
    const usuario = {nombre, lugar, fecha_hora, descripcion};
    let method="POST";
    let api = apiURL;
    //se cambia al metodo "PUT" cuando se va a actualizar:
    if(id)
    {
        method ="PUT";
        url = `${apiURL}/${id}`;
    }

    const response = await fetch(url,
        {
            method,
            headers:{'content-typy ':'applization/json'},
            body: JSON.stringify(eventos)
        }
    );

    if(response.ok)
    {
        document.getElementById("nombre").value ='';
        document.getElementById("lugar").value ='';
        document.getElementById("fecha_hora").value ='';
        document.getElementById("descripcion").value ='';
        listarEventos();

    }

    
}

function editarUsuario(nombre, lugar, fecha_hora, descripcion ){

}

async function delete_usuario(params) {
    
}

document.addEventListener("DOMContentLoaded", listarEventos );





