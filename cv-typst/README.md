# CV en Typst

Fuente editable del CV de Nicole Flores, en [Typst](https://typst.app). La plantilla está basada en la del CV de Jhossua Vega.

## Archivos

- `cv_template.typ`: plantilla (colores, tipografía, componentes).
- `cv_es.typ`: contenido en español.
- `photo.jpg`: foto del encabezado, recortada de `../img/principalderech.png`.

## Cómo compilar

Desde esta carpeta:

```powershell
typst compile cv_es.typ ../assets/cv/Nicole_Flores_CV.pdf
```

El PDF va a `../assets/cv/`, que es el archivo que descarga el botón "Descargar CV" del portafolio. Si `typst` no está en el PATH, está en `%LOCALAPPDATA%\Microsoft\WinGet\Packages\Typst.Typst_*\typst-*\typst.exe`.

## Editar contenido

- Cada experiencia es `(empresa, cargo, fechas, modalidad, bullets)` y cada bullet es `(etiqueta, texto)`; la etiqueta sale en negrita.
- Los idiomas son `(idioma, nivel, barras llenas de 5)`.
- Debe caber en una página A4.
- Mantener los datos iguales a los de `../index.html` (fechas, cifras, certificaciones).
- Las referencias no se publican: el CV dice "Disponibles a solicitud".
