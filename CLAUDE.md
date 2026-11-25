# CLAUDE.md

Portafolio personal estático de Stephany Nicole Flores Perez (Project Manager en proyectos de tecnología y datos). Una sola página, sin build. Se publica con GitHub Pages desde `main` en `https://nfloresp99.github.io/portafolio/`.

## Estructura

- `index.html`: toda la página (HTML + `<style>` + config de Tailwind inline).
- `img/principalderech.png`: foto del hero (la única imagen usada).
- `img/principalizq.png`: no se usa en ninguna parte.
- `README.md`: resumen del perfil; debe coincidir con los datos de `index.html`.
- `cv-typst/`: fuente del CV en Typst (ver su README). Se compila a `assets/cv/Nicole_Flores_CV.pdf`, que es lo que descargan los botones "Descargar CV". Si cambia un dato en la página, actualizar también `cv-typst/cv_es.typ` y recompilar.

## Stack

- Tailwind vía CDN (`cdn.tailwindcss.com`), configurado en el `<script>` de `tailwind.config` dentro del `<head>`.
- Fuentes de Google: Inter (títulos) y Open Sans (texto).
- Sin JavaScript propio salvo el menú móvil (script al final del `<body>`).
- Contador de visitas de hits.sh en el footer. Cuenta visitas reales desde que se publicó.
- Sin dependencias, sin `package.json`, sin tests.

## Cómo ver los cambios

Abrir `index.html` directo en el navegador, o servir la carpeta:

```powershell
python -m http.server 8000
```

## Convenciones de estilo

- Color de acento: `cobalt` en `tailwind.config` (nombre heredado; el color es rosa). `cobalt` (#B24C63) es para texto y botones sobre blanco, porque cumple contraste 4.5:1. `cobalt-light` (#D67B8A) es para texto sobre el fondo oscuro de contacto y para decoración. Funcionan los modificadores de Tailwind (`bg-cobalt/10`, `hover:border-cobalt`).
- Colores de texto: `text-navy` (#0F172A) y `text-navy-700` (#334155).
- Tarjetas: `glass-card rounded-xl card-shimmer hover-lift`.
- Etiqueta de sección: `<p class="text-cobalt ... uppercase accent-underline">` seguida de un `h2` con `text-4xl lg:text-5xl font-black tight-kern`.
- Secciones con `id`: `about`, `results`, `experience`, `skills`, `certifications`, `contact`. Si se agrega una, añadirla también al nav de escritorio y al menú móvil.
- Textos en español. Mantener el tono profesional y orientado a resultados.

## Datos que deben mantenerse consistentes

El nombre, email, LinkedIn, WhatsApp y métricas aparecen en varios lugares (nav, hero, contacto, footer y `README.md`). Al cambiar uno, buscar y actualizar todos:

```powershell
git grep -n "Flores\|linkedin\|gmail\|wa.me"
```

## Contenido

- Toda cifra o certificación debe ser real y verificable. Una certificación en curso se marca "En curso" con la fecha estimada; nunca con una fecha de finalización inventada.
- No nombrar clientes de Turingtech: son confidenciales. Se mencionan solo los sectores.
- Al sumar o quitar certificaciones, actualizar también el número del hero ("13 Certificaciones") y el README.

## Notas

- La capa de pétalos animados (SVG al final del `<body>`) es `fixed` con `pointer-events-none`; no debe bloquear clics.
- Las imágenes PNG pesan ~750 KB cada una; preferir WebP comprimido al agregar o reemplazar fotos.
