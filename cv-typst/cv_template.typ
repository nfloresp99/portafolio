// ============================================================
// Nicole Flores — plantilla de CV (Typst)
// Basada en la plantilla del CV de Jhossua Vega. Se llama desde cv_es.typ.
// ============================================================

// Paletas. Se elige con: typst compile --input paleta=<nombre> cv_es.typ ...
// (primario, acento del encabezado, etiquetas, texto oscuro, texto medio, texto suave, línea, barra vacía)
#let paletas = (
  vino: ("#7A2E46", "#F7D6DE", "#B24C63", "#2A2226", "#4A3C42", "#8A7A80", "#EFE3E6", "#EBD9DE"),
  marino-rosa: ("#1E2A44", "#F2C6D0", "#B24C63", "#22262E", "#3D4350", "#7C828E", "#E5E7EB", "#EBD9DE"),
  grafito-rosa: ("#33333B", "#F2C6D0", "#C0687E", "#26262B", "#45454D", "#85858E", "#E7E7EA", "#EDDDE1"),
  ciruela: ("#4E3557", "#E6D3EE", "#8A5C9A", "#2A2430", "#4A4250", "#8A8290", "#ECE6EF", "#E3D8E8"),
)
#let p = paletas.at(sys.inputs.at("paleta", default: "vino"))
#let primary = rgb(p.at(0))
#let accent = rgb(p.at(1))
#let tag-bg = rgb(p.at(2))
#let text-dark = rgb(p.at(3))
#let text-mid = rgb(p.at(4))
#let text-soft = rgb(p.at(5))
#let rule-light = rgb(p.at(6))
#let bar-empty = rgb(p.at(7))

#let skill-tag(label) = box(
  fill: tag-bg, radius: 3pt, inset: (x: 5.5pt, y: 2.8pt),
)[#text(fill: white, size: 7pt, weight: 500)[#label]]

#let lang-bar(n, filled) = {
  let items = ()
  for i in range(n) {
    items.push(box(width: 11pt, height: 6pt, radius: 1pt,
      fill: if i < filled { tag-bg } else { bar-empty }))
  }
  stack(dir: ltr, spacing: 2.5pt, ..items)
}

// Section title. Vertical space ABOVE titles is added by the caller (v(...)),
// so every section is separated the same way.
#let section-title(t) = block(above: 0pt, below: 7pt)[
  #set par(spacing: 0pt)
  #set block(spacing: 0pt)
  #text(size: 10pt, weight: 700, fill: primary, tracking: 0.5pt)[#upper(t)]
  #v(3.5pt)
  #line(length: 100%, stroke: 1.1pt + primary)
]

// Line 1: institution (left) + dates (right). Line 2: degree.
#let edu-item(institution, degree, dates) = block(below: 9pt, spacing: 0pt)[
  #set par(spacing: 0pt)
  #set block(spacing: 0pt)
  #grid(columns: (1fr, auto), column-gutter: 6pt, align: (left + bottom, right + bottom),
    text(size: 9pt, weight: 600, fill: primary)[#institution],
    text(size: 7.6pt, fill: text-soft)[#dates],
  )
  #v(3pt)
  #text(size: 8.3pt, fill: text-mid)[#degree]
]

// Line 1: company (left) + dates (right). Line 2: role · modality. Then bullets.
// Font size is set BEFORE the paragraph settings so `em` values resolve against
// the bullet text size (7.5pt) and not the document default (11pt). That keeps
// the line spacing inside a bullet smaller than the spacing between bullets.
#let exp-item(company, role, dates, modality, bullets) = block(below: 12pt, spacing: 0pt)[
  #set par(spacing: 0pt)
  #set block(spacing: 0pt)
  #grid(columns: (1fr, auto), column-gutter: 6pt, align: (left + bottom, right + bottom),
    text(size: 9.2pt, weight: 700, fill: primary)[#company],
    text(size: 7.6pt, fill: text-soft)[#dates],
  )
  #v(3.5pt)
  #text(size: 8.2pt, weight: 600, fill: text-mid)[#role]#if modality != "" [#text(size: 7.6pt, fill: text-soft)[ #sym.dot.c #modality]]
  #v(5.5pt)
  #set text(size: 7.4pt, fill: text-dark)
  #set par(justify: false, leading: 0.48em)
  #list(
    marker: text(size: 7.5pt, fill: text-dark)[#sym.bullet],
    indent: 0pt, body-indent: 6pt, spacing: 4.8pt,
    // Each bullet is either plain text or (label, text): the label is shown in bold.
    ..bullets.map(b => if type(b) == array [#text(weight: 700, fill: primary)[#b.at(0):] #b.at(1)] else [#b])
  )
]

#let cert-group(cat, items) = block(below: 8pt, spacing: 0pt)[
  #set par(spacing: 0pt)
  #set block(spacing: 0pt)
  #if cat != "" [#text(size: 8pt, weight: 700, fill: primary)[#cat] #v(3.5pt)]
  #set text(size: 6.9pt, fill: text-mid)
  #set par(justify: false, leading: 0.45em)
  #list(
    marker: text(size: 6.9pt, fill: text-mid)[#sym.dot.c],
    indent: 0pt, body-indent: 5pt, spacing: 4.6pt,
    ..items
  )
]

// Three short lines so phone numbers never split across lines.
#let ref-item(name, role, cell) = block(below: 0pt, spacing: 0pt)[
  #set par(justify: false, leading: 0.4em)
  #text(size: 7.9pt, weight: 600, fill: primary)[#name] \
  #text(size: 7.2pt, fill: text-mid)[#role] \
  #text(size: 7.2pt, fill: text-soft)[#cell]
]

#let cv(
  name: "",
  portfolio-url: "",
  languages: (),
  role: "",
  summary: "",
  portfolio-label: "",
  born-label: "",
  phone: "",
  email: "",
  location: "",
  linkedin: "",
  section-education: "",
  section-experience: "",
  section-skills: "",
  section-languages: "",
  section-certifications: "",
  section-training: "",
  section-references: "",
  references-note: "",
  lang-spanish: "",
  lang-english: "",
  lang-spanish-level: "",
  lang-english-level: "",
  education: (),
  experience: (),
  skill-groups: (),
  certifications: (),
  training: (),
  references: (),
) = {
  set page(width: 21cm, height: 29.7cm, margin: 0pt, fill: white)
  set text(font: ("Liberation Sans", "Arial"), fill: text-dark, hyphenate: false)
  set par(leading: 0.58em, spacing: 0.6em)
  show regex("[\\w.()-]+/[\\w.()-]+"): it => box(it)

  // ---------- HEADER ----------
  block(width: 100%, fill: primary, inset: (left: 34pt, right: 34pt, top: 15pt, bottom: 11pt))[
    #grid(columns: (1fr, auto), align: top,
      [
        #text(size: 23pt, weight: 700, fill: white, tracking: 0.5pt)[#upper(name)] \
        #text(size: 11.5pt, weight: 300, fill: white)[#role]
      ],
      box(width: 58pt, height: 58pt, radius: 50%, clip: true, stroke: 2.4pt + white)[
        #image("photo.jpg", width: 58pt, height: 58pt, fit: "cover")
      ]
    )
    #v(10pt)
    #grid(columns: (1.7fr, 1fr), gutter: 16pt, align: top,
      [
        #text(size: 8.6pt, weight: 300, fill: white)[#summary]
        #v(5pt)
        #text(size: 8pt, weight: 300, fill: accent)[#portfolio-label: ] #text(size: 8pt, fill: accent)[#portfolio-url]
      ],
      [
        #set align(right)
        #set text(size: 8pt, weight: 300, fill: white)
        #if born-label != "" [#born-label #h(5pt) #box(width: 4.5pt, height: 4.5pt, radius: 50%, fill: accent) \
        #v(3pt)]#phone #h(5pt) #box(width: 4.5pt, height: 4.5pt, radius: 50%, fill: accent) \
        #v(3pt) #email #h(5pt) #box(width: 4.5pt, height: 4.5pt, radius: 50%, fill: accent) \
        #v(3pt) #location #h(5pt) #box(width: 4.5pt, height: 4.5pt, radius: 50%, fill: accent) \
        #v(3pt) #linkedin #h(5pt) #box(width: 4.5pt, height: 4.5pt, radius: 50%, fill: accent)
      ]
    )
  ]

  // ---------- BODY ----------
  grid(columns: (1.58fr, 1.08fr), gutter: 10pt,
    inset: (left: 34pt, right: 34pt, top: 12pt, bottom: 4pt),
    // -- MAIN COLUMN --
    [
      #set par(justify: false)
      #section-title(section-education)
      #for e in education [#edu-item(e.at(0), e.at(1), e.at(2))]

      #v(8pt)
      #section-title(section-experience)
      #for e in experience [#exp-item(e.at(0), e.at(1), e.at(2), e.at(3), e.at(4))]

      #v(6pt)
      #section-title(section-references)
      #if references.len() > 0 {
        grid(columns: (1fr, 1fr), column-gutter: 10pt, row-gutter: 6pt,
          ..references.map(r => ref-item(r.at(0), r.at(1), r.at(2))))
      } else {
        text(size: 7.8pt, fill: text-mid)[#references-note]
      }
    ],
    // -- SIDE COLUMN --
    [
      #set block(width: 100%)
      #section-title(section-skills)
      #for g in skill-groups [
        #text(size: 6.9pt, weight: 700, fill: text-soft, tracking: 0.4pt)[#upper(g.at(0))]
        #v(2pt)
        #box(width: 100%)[
          #set par(leading: 4.2pt)
          #g.at(1).map(skill-tag).join(h(3.5pt))
        ]
        #v(3pt)
      ]

      #v(6pt)
      #section-title(section-languages)
      #grid(columns: languages.len() * (1fr,), column-gutter: 10pt,
        ..languages.map(l => [
          #text(size: 8.3pt, weight: 700, fill: primary)[#l.at(0)]
          #v(2.5pt)
          #lang-bar(5, l.at(2))
          #v(2.5pt)
          #text(size: 7.2pt, fill: text-soft)[#l.at(1)]
        ])
      )

      #v(10pt)
      #section-title(section-certifications)
      #for c in certifications [#cert-group(c.at(0), c.at(1))]
      #if training.len() > 0 [
        #v(4pt)
        #section-title(section-training)
        #for c in training [#cert-group(c.at(0), c.at(1))]
      ]
    ]
  )
}
