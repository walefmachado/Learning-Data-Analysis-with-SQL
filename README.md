# Learning Data Analysis with SQL

This repository was created with the aim of gathering my study material from the SQL tools for data analysis. Initially the content will be based on the book _SQL for Data Analysis_ ([TANIMURA, 2022.](https://www.oreilly.com/library/view/sql-for-data/9781492088776/)), but in time I will include other materials.  


## Course outline

## Data Analysis with SQL

### Preparing Data for Analysis

#### Types of Data
#### SQL Query Structure 
#### Profiling: Data Quality 
#### Preparing: Data Cleaning
#### Preparing: Shaping Data 


## Basic Data Analysis with SQL

O que precisa saber pra começar a estudar SQL: 

- __O que é um banco de dados__: banco de dados relacional = armazena um conjunto de relações. Os dados são armazenados em tabelas com linhas e colunas.

SQL: Structured query language. Várias plataformas: MySQL. PostgreSQL, Oracle. 

- __Diagrama entidade relacionamento.__

Utilizar a __Google Cloud Platafor__ para utilizar os dados da iniciativa __Base dos Dados__ que estão no Big Query. 

Aprendendo a usar o BigQuery:

[Google BigQuery (SQL) 101](https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbldRd3liUzRSNExMWFV2dzFhaFI1dVA5THNPUXxBQ3Jtc0tsOVk0N1Z0Z29rUnJjWHF0T3VhaTRYVWVvdlI0aDRpWGxvTm5BZkptVmpmc05HaEFhM2FCbWpUNUhxMk5Edm5HUGNGeUhjRGxVMmlxeHpjY0stM3pOWHVhTzc1djY3WWFBWk10bDNDbHZQSk9hNnl6cw&q=https%3A%2F%2Fmedium.com%2Fbasedosdados%2Fbigquery-101-8b39da1ce52b&v=BRPUA0EgS4I)


[Workshop: SQL + BigQuery]((https://www.youtube.com/watch?v=nGM2OwTUY_M&t=0s)) [@Base dos Dados](https://www.youtube.com/channel/UCO1AcMaEa7bArIHb85bkSYA)


### Consultas SQL na Prática usando SELECT, DISTINCT, WHERE e LIMIT  

Estrutura básica de uma consulta: 

```
SELECT <atributo>
FROM <tabelas>
WHERE [condição]
```
O comando `LIMIT` limita o número de resultado da consulta (não só da vizualização). 

O comando `DISTINCT` seleciona atributos distindos (elimina atributos repetidos).

Estrutura com mais de uma condição: 

```
SELECT <atributo>
FROM <tabelas>
WHERE condição_1 AND condição_2;

```

```
SELECT <atributo>
FROM <tabelas>
WHERE (coluna_X = 'valor_2' OR coluna_X = 'valor_2') AND condição;

```
Comando `AND NOT` na condição é uma negação de uma condição. 

### Como usar ORDER BY em consultas SQL e IN, BETWEEN, LIKE e NOT

```
SELECT <atributo>
FROM <tabelas>
WHERE (coluna_X = 'valor_2' OR coluna_X = 'valor_2') AND condição
ORDER BY <atributo>;

```
O comando `ORDER BY` coloca em ordem alfabética ou numérica crescente. Para ordem decrescente adocionar no final `DESC`. 

```
SELECT <atributo>
FROM <tabelas>
WHERE (coluna_X = 'valor_2' OR coluna_X = 'valor_2') AND condição
ORDER BY <atributo> DESC;

```
Ex: 

```
SELECT <atributo>
FROM <tabelas>
WHERE ano BETWEEN 2014 AND 2020 
ORDER BY <atributo> DESC;

```

```
SELECT <atributo>
FROM <tabelas>
WHERE ano IN (2000, 2014, 2020) -- pode ser numérico ou não 
ORDER BY <atributo> DESC;

```

Para filtrar valores nulos: `IS NOT NULL`.

Para campos não numéricos: O comando `LIKE 'P%'` (algo que começa com a letra "P"). __Pesquisar essa sintaxe!__

- Caractere de escape `\\`

### Para que serve o COUNT em SQL + agregação com MAX, MIN e SUM

### Como usar GROUP BY, HAVING e CASE em consultas SQL na prática 

### Normalização e SQL 

### Usando JOIN em consultas SQL para combinar tabelas 

### Entendendo chaves nos bancos de dados Diferença entre Chave Primária e Chave Estrangeira?

### Tipos de JOINS em SQL Diferença entre INNER JOIN e OUTER JOIN 

### O mesmo SQL funciona em todos os bancos de dados? Ordem de processamento de uma consulta SQL e mais

### Como filtrar os dados por data em consultas SQL



