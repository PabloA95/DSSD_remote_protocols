# Entrega Cloud de Desarrollo de software en sistemas distribuidos #

__ API REST para simular la ejecucion de un protocolo remoto, la cual recibe los datos del protocolo y lo comienza a ejecutar, pudiendo luego ser consultada por su estado y su resultado de evaluación. __



Para el desarrollo de la API seleccionamos el lenguaje Ruby, y utilizamos el motor de bases de datos postgres, debido a que es la única que provee heroku sin requerir método de pago. Como metodo de autenticacion elegimos el standart JWT, y sus tokens tienen un vencimiento de 15 minutos
Con la plataforma creamos el proyecto, agregamos el add-on de postgres al proyecto, clonamos el repositorio que nos da heroku, colocamos los archivos de nuestro proyecto dentro, configuramos la conexión a la base de datos con los datos dados por el add-on, creamos el procfile, pusheamos todo al repositorio de heroku, y nos conectamos por consola para correr las migraciones (heroku run rails db:migrate).


Los métodos principales son:

_POST /login_
```
curl -H "Content-Type: application/json" -d '{"name":"admin", "password":"1234"}' https://the-path.com/login -X POST
```

_GET /status/:id_
```
curl -H "Content-Type: application/json" -H "Authorization: Bearer <token>" https://the-path.com/status/1
```

_POST /execute_
```
curl -H "Content-Type: application/json" -H "Authorization: Bearer <token>" -d '{"protocol":1, "proyecto_id":1}' https://the-path.com/execute -X POST
```


Nuestra idea de la API fue qué se tienen distintos protocolos cargados, pero estos no pertenecen a ningún método de testeo de medicamentos en sí, sino que desde cualquier proyecto de cualquier método que requieran ejecutar alguno de los protocolos cargados, pueden llamar a la API (en un caso real deberían pasar datos del problema, por simular la ejecución esos datos no existen, ya que no hay tareas a las cuales pasarlos). Las tareas son almacenadas como un único campo de texto, ya que al no ser algo que se ejecute realmente no encontramos el punto de que sean una clase separada que no tenga nada.
Los endpoints que se pueden llamar sin estar logueados son el login y el create de usuario.