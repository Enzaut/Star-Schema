-- Tabela Fato: Fato_Professor
create database universidade;
use universidade;
CREATE TABLE fato_professor (
    idProfessor INT,
    idDisciplina INT,
    idCurso INT,
    idDepartamento INT,
    data_id INT,
    quantidade_cursos INT,
    nota_media_curso DECIMAL(5, 2),
    PRIMARY KEY (idProfessor, idDisciplina, idCurso, idDepartamento, data_id),
    FOREIGN KEY (idProfessor) REFERENCES dim_professor(idProfessor),
    FOREIGN KEY (idDisciplina) REFERENCES dim_disciplina(idDisciplina),
    FOREIGN KEY (idCurso) REFERENCES dim_curso(idCurso),
    FOREIGN KEY (idDepartamento) REFERENCES dim_departamento(idDepartamento),
    FOREIGN KEY (data_id) REFERENCES dim_data(data_id)
);

-- Dimensão Professor
CREATE TABLE dim_professor (
    idProfessor INT PRIMARY KEY,
    nome_professor VARCHAR(100),
    departamento_id INT,
    FOREIGN KEY (departamento_id) REFERENCES dim_departamento(idDepartamento)
);

-- Dimensão Disciplina
CREATE TABLE dim_disciplina (
    idDisciplina INT PRIMARY KEY,
    nome_disciplina VARCHAR(100)
);

-- Dimensão Curso
CREATE TABLE dim_curso (
    idCurso INT PRIMARY KEY,
    nome_curso VARCHAR(100),
    departamento_id INT,
    FOREIGN KEY (departamento_id) REFERENCES dim_departamento(idDepartamento)
);

-- Dimensão Departamento
CREATE TABLE dim_departamento (
    idDepartamento INT PRIMARY KEY,
    nome_departamento VARCHAR(100),
    campus VARCHAR(100),
    idProfessor_coordenador INT
);

-- Dimensão Data
CREATE TABLE dim_data (
    data_id INT PRIMARY KEY,
    data DATE,
    ano INT,
    mes INT,
    dia INT,
    trimestre INT
);
