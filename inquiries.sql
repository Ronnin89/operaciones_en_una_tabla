-- PARTE 1

-- creacion de base de datos
CREATE DATABASE posts

-- cambio a la base de datos
\c posts

-- crecion de tabla
CREATE TABLE posts(
  id SERIAL PRIMARY KEY,
  name_user VARCHAR(30) NOT NULL,
  date_creation DATE NOT NULL,
  content VARCHAR(100) NOT NULL,
  descrip VARCHAR(50)
);

-- insertar 3 posts con todos sus campos
INSERT INTO posts(name_user, date_creation, content, descrip) 
VALUES('Pamela', '2021-01-14', 'contenido de un post', 'esto es un post'),
('Pamela', '2021-01-15', 'contenido de otro post', 'esto es un post'),
('Carlos', '2021-01-17', 'contenido de su primer post', 'esto es un post');

-- modificacion de la tabla, title añadido
ALTER TABLE posts ADD COLUMN title VARCHAR(20);

-- agregando titulo a los posts ya creados
UPDATE posts
SET title = 'post de pamela'
WHERE id=1 OR id=2;

UPDATE posts
SET title = 'post de carlos'
WHERE id=3;

-- Insertar nuevo usuario con sus respectivos posts
INSERT INTO posts(name_user, date_creation, content, descrip, title) 
VALUES('Pedro', '2021-01-09', 'contenido del primer post de pedro', 'esto es un post', 'post de pedro'),
('Pedro', '2021-01-10', 'contenido del segundo post de pedro', 'esto es un post', 'post de pedro');

-- eliminar post de Carlos
DELETE FROM posts WHERE name_user ='Carlos'; -- id=3

-- ingresando nuevo post de Carlos
INSERT INTO posts(name_user, date_creation, content, descrip, title) 
VALUES('Carlos', '2021-01-20', 'contenido de un nuevo post', 'esto es un post', 'post de carlos');


-- PARTE 2
-- creando una nueva tabla de comentarios
CREATE TABLE comments(
  id_comment SERIAL,
  date_creation TIMESTAMP,
  content VARCHAR(50),
  id_post INTEGER REFERENCES posts(id)
);


-- creando comentarios en la tabla comments
INSERT INTO comments(date_creation, content, id_post)
VALUES('2021-01-14 14:31:20', 'comentario 1 del post de Pamela', 1),
('2021-01-14 14:31:50', 'comentario 2 del post de Pamela', 1),
('2021-01-20 10:50:35', 'comentario 1 del post de Carlos', 6),
('2021-01-20 12:36:21', 'comentario 2 del post de Carlos', 6),
('2021-01-21 08:45:38', 'comentario 3 del post de Carlos', 6),
('2021-01-21 11:50:53', 'comentario 4 del post de Carlos', 6);

-- nuevo post para margarita
INSERT INTO posts(name_user, date_creation, content, descrip, title) 
VALUES('Margarita', '2021-01-21', 'contenido del primer post de maggi', 'esto es un post', 'post de maggi');

-- creando comentarios para margarita
INSERT INTO comments(date_creation, content, id_post)
VALUES('2021-01-21 14:31:20', 'comentario 1 del post de maggi', 7),
('2021-01-21 14:31:50', 'comentario 2 del post de maggi', 7),
('2021-01-21 15:50:35', 'comentario 3 del post de maggi', 7),
('2021-01-21 16:36:21', 'comentario 4 del post de maggi', 7),
('2021-01-21 19:45:38', 'comentario 5 del post de maggi', 7);