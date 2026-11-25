#import "cv_template.typ": cv

// Compilar desde esta carpeta:
//   typst compile cv_es.typ ../assets/cv/Nicole_Flores_CV.pdf

#cv(
  name: "Nicole Flores",
  portfolio-url: "https://nfloresp99.github.io/portafolio/",
  role: "Project Manager | Proyectos de tecnología y datos",
  summary: "Project Manager en proyectos de tecnología y datos. Gestiono 5 proyectos en paralelo con un equipo multidisciplinario de arquitectura, cloud, datos y QA, aplicando Scrum o metodologías tradicionales según cada cliente. Todos los proyectos entregados dentro del plazo. Certificada en Google Project Management.",
  portfolio-label: "Portafolio",
  born-label: "",
  phone: "+593 98 787 9595",
  email: "stepahy31@gmail.com",
  location: "Quito, Ecuador",
  linkedin: "linkedin.com/in/nicole-flores-51a8762a2",
  section-education: "Educación",
  section-experience: "Experiencia",
  section-skills: "Habilidades",
  section-languages: "Idiomas",
  section-certifications: "Certificaciones",
  section-training: "Formación adicional",
  section-references: "Referencias",
  references-note: "Disponibles a solicitud.",

  // (idioma, nivel, barras llenas de 5)
  languages: (
    ("Español", "Nativo", 5),
    ("Inglés", "A2 (en curso)", 2),
  ),

  // (institución, título, fechas)
  education: (
    ("Universidad Central del Ecuador", "Administración Pública", "2024 – Actualidad"),
    ("Instituto Patronato Municipal San José", "Diplomado en Marketing Digital", "2019 – 2022"),
    ("Unidad Educativa Diez de Agosto", "Bachiller en Ciencias", "2013 – 2019"),
  ),

  // (empresa, cargo, fechas, modalidad, bullets); cada bullet es (etiqueta, texto)
  experience: (
    (
      "Corporación Turingtech", "Project Manager", "Nov 2025 – Actualidad", "Remoto",
      (
        ("Portafolio", "gestiono 5 proyectos simultáneos de automatización, inteligencia de negocio, integración de sistemas y software a medida para clientes de distintos sectores."),
        ("Equipo", "coordino a 5 especialistas (arquitecto de soluciones, Cloud Data Engineer, ingeniero de datos y QA), con equipos de 2 a 3 personas por proyecto."),
        ("Metodología", "aplico Scrum con sprints de 1 a 2 semanas y validación con el cliente al cierre de cada sprint, o una metodología tradicional cuando el alcance lo requiere."),
        ("Planificación", "armo el backlog y el tablero del proyecto en Jira y estimo los tiempos junto con el equipo; doy seguimiento a los clientes en el CRM."),
        ("Resultados", "100% de los proyectos entregados dentro del plazo; en varios se terminó antes, sin usar el margen de contingencia de 21 h que se reserva por proyecto."),
        ("Cierre", "gestiono las actas de aceptación con el cliente y la documentación de entrega, apoyándome en IA para informes y entregables."),
      ),
    ),
    (
      "R/B, MANGO · LC Waikiki", "Sales Specialist & Customer Experience", "Dic 2023 – Nov 2025", "Retail",
      (
        ("Ventas consultivas", "superé las metas mensuales en un 40% con foco en upselling y cross-selling."),
        ("Clientes", "desarrollé relaciones de largo plazo con clientes de alto valor, con una tasa de retención del 65%."),
        ("Capacitación", "formé a nuevos integrantes del equipo en técnicas de venta y atención al cliente."),
      ),
    ),
    (
      "CITIMED", "Operations & Data Analyst", "Ene 2023 – Dic 2023", "Salud",
      (
        ("Datos", "administré el CRM y las bases de datos de pacientes con 99% de precisión en los registros."),
        ("Procesos", "optimicé procesos operativos y reduje los tiempos de atención en un 25%."),
        ("Coordinación", "articulé el trabajo entre equipos médicos y administrativos en entornos de alta presión."),
      ),
    ),
    (
      "Las Delicias de la Guaragua", "Process Optimization Specialist", "Mar 2021 – Dic 2022", "Operaciones logísticas",
      (
        ("Inventarios", "diseñé mejoras en el control de inventarios y la gestión financiera operativa."),
        ("Seguimiento", "implementé sistemas de seguimiento que mejoraron la visibilidad del negocio."),
      ),
    ),
  ),

  skill-groups: (
    ("Gestión de proyectos", ("Scrum", "Cascada", "Kanban", "Planificación", "Estimación de tiempos", "Backlog", "Actas de aceptación", "Documentación")),
    ("Herramientas", ("Jira", "CRM", "Excel", "PowerPoint", "Word", "Power BI (en curso)")),
    ("Inteligencia artificial", ("Claude", "ChatGPT", "Gemini")),
    ("Habilidades", ("Coordinación de equipos", "Comunicación con clientes", "Mejora de procesos", "Atención al cliente")),
    ("Marketing digital", ("Google Ads", "Meta")),
  ),

  certifications: (
    ("Gestión de proyectos", (
      "Google Project Management Professional Certificate — Google · Coursera, Feb 2026",
    )),
    ("Metodologías ágiles", (
      "Scrum — Corporación Turingtech, Dic 2025",
    )),
  ),

  training: (
    ("Inteligencia artificial", (
      "Anthropic Academy, 8 cursos: Claude 101, AI Fluency, Claude Cowork, Claude Code 101, Claude Code in Action, Claude Platform 101, Claude API y Model Context Protocol — Nov 2026",
      "Inteligencia Artificial con Gemini — Google, Nov 2026",
    )),
    ("Tecnología y datos", (
      "Informática: Hardware y Software (30 h) — Corporación Turingtech, Jun 2026",
      "Power BI — Microsoft Learn, en curso (finaliza Dic 2026)",
    )),
  ),

  // Las referencias no se publican: el CV dice "Disponibles a solicitud".
  references: (),
)
