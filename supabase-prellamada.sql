-- Pega todo esto en Supabase > SQL Editor > New query > Run
-- (es una tabla nueva, aparte de "leads")

create table if not exists public.previa_llamada (
  id bigint generated always as identity primary key,
  created_at timestamptz not null default now(),
  nombre text check (char_length(nombre) <= 120),
  email text check (char_length(email) <= 200),
  whatsapp text check (char_length(whatsapp) <= 40),
  instagram text check (char_length(instagram) <= 80),
  seguidores text check (char_length(seguidores) <= 40),
  alcance text check (char_length(alcance) <= 40),
  vistas text check (char_length(vistas) <= 40),
  visitas_perfil text check (char_length(visitas_perfil) <= 40),
  clics_enlace text check (char_length(clics_enlace) <= 40),
  nuevos_seguidores text check (char_length(nuevos_seguidores) <= 40),
  frecuencia text check (char_length(frecuencia) <= 80),
  oferta text check (char_length(oferta) <= 300),
  meta text check (char_length(meta) <= 120),
  resolver text check (char_length(resolver) <= 1000)
);

-- Seguridad: la web solo puede AÑADIR filas. Solo tú puedes leerlas desde tu panel.
alter table public.previa_llamada enable row level security;

drop policy if exists "la web puede insertar" on public.previa_llamada;
create policy "la web puede insertar"
  on public.previa_llamada for insert
  to anon
  with check (true);
