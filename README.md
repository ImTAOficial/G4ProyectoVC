Contenido
Prerrequisitos	2
Sistema Operativo	2
Software	2
Bases de Datos	4
Instalación de Software	5
Instalar XAMPP	5
Instalar Composer	5
Configurar Laravel	5
Configuración del Proyecto	6
Configuración del Entorno	6
Importar Base de Datos	6
Ejecución del Proyecto	7
Levantar el Servidor	7
Solución de Problemas	7
Error de conexión a la base de datos	7
Error al instalar dependencias	7
Otros Errores Comunes	8
Proyecto cargado en Github	8
Proyecto ejecutándose	8
Dashboard	8
Menu	9
Integraciones	10
Opciones	11

Prerrequisitos
Sistema Operativo
•	Windows 10/11, macOS, Linux

Software
•	XAMPP 8.2.12

•	Composer

•	PHP Laravel 11

•	Navegador web (Chrome, Firefox)

Bases de Datos
•	MySQL (PhpMyAdmin)

Instalación de Software
Instalar XAMPP
•	Descarga XAMPP desde apachefriends.org
•	Ejecuta el instalador y sigue las instrucciones.
Instalar Composer
•	Descarga Composer desde getcomposer.org
•	Ejecuta el instalador y sigue las instrucciones.
•	Verifica la instalación abriendo una terminal y escribiendo composer.
Configurar Laravel
•	Abre una terminal y navega a la carpeta raíz del proyecto:
cd ruta/al/proyecto/G4ProyectoVC
•	Ejecuta el comando para instalar dependencias:
composer install


Configuración del Proyecto
Configuración del Entorno
•	Renombra .env.example a .env:
cp .env.example .env
•	Abre el archivo .env y configura las variables de entorno para la base de datos:
•	Genera la clave de la aplicación:
php artisan key:generate
Importar Base de Datos
•	Abre PhpMyAdmin desde el navegador (http://localhost/phpmyadmin).
•	Crea una nueva base de datos.
•	Importa el script de base de datos que se encuentra en la carpeta BaseDeDatos.

Ejecución del Proyecto
Levantar el Servidor
•	Desde la terminal, en la carpeta raíz del proyecto:
php artisan serve
Accede al proyecto desde el navegador: http://localhost:8000.

Solución de Problemas
Error de conexión a la base de datos
•	Verifica las credenciales en el archivo .env.
•	Asegúrate de que el servicio de MySQL esté en ejecución.
Error al instalar dependencias
•	Verifica que Composer esté instalado correctamente.
•	Asegúrate de tener una conexión a Internet estable.
Otros Errores Comunes
1.	Revisa los logs en storage/logs/laravel.log para detalles específicos.
Proyecto cargado en Github
Enlace: https://github.com/ImTAOficial/G4ProyectoVC



