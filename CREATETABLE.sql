DROP TABLE IF EXISTS cliente CASCADE;
CREATE TABLE cliente (
	cod_cliente	SERIAL PRIMARY KEY,
	Nome_cliente VARCHAR(50) NOT NULL,
	cpf_cliente NUMERIC(11) NOT NULL,
	data_nasci_cliente DATE NOT NULL,
	end_cliente VARCHAR(80),
	email_cliente VARCHAR(50),
	telefone_cliente NUMERIC(13),
	sexo_cliente CHAR(1) CHECK (sexo_cliente IN ('M','F')),
	cep	INTEGER,
	uf CHAR(2),
	cidade VARCHAR(30),
	bairro VARCHAR(30)
	);
SELECT * FROM cliente;

INSERT INTO cliente VALUES 
	(DEFAULT, 'MARIA SILVA', '23567483921', '15/07/1985', 'Avenida Principal, 123', 'maria.silva@gmail.com', '21987654321', 'F', 11500020, 'SP', 'Cubatão', NULL),
	(DEFAULT, 'JOÃO OLIVEIRA', '98765432123', '05/03/1990', 'Rua da Amizade, 456', 'joao.oliveira@gmail.com', '11998761234', 'M', 52011260, 'PE', 'Recife', 'Graças'),
	(DEFAULT, 'ANA SOUZA', '45671234567', '10/11/1978', 'Rua das Flores, 789', 'ana.souza@gmail.com', '21976543218', 'F', 09842070, 'SP', 'São Bernardo do Campo', 'Batistini'),
	(DEFAULT, 'ANDRÉ SANTOS', '76543210987', '20/05/1995', 'Rua das Árvores, 321', 'andre.santos@gmail.com', '21901234567', 'M', 07084070, 'SP', 'Guarulhos', 'Cabuçu'),
	(DEFAULT, 'LUCIA RIBEIRO', '54321678901', '08/11/1980', 'Avenida Central, 567', 'lucia.ribeiro@gmail.com', '11987654321', 'F', 06711205, 'SP', 'Cotia', 'Jardim da Glória'),
	(DEFAULT, 'CARLOS PEREIRA', '98765432198', '12/04/1975', 'Rua do Comércio, 987', 'carlos.pereira@gmail.com', '21987654321', 'M', 09400200, 'SP', 'Ribeirão Pires', 'Núcleo Colonial'),
	(DEFAULT, 'ANA PAULA FERREIRA', '23456789012', '14/02/1991', 'Avenida do Sol, 741', 'ana.paula@gmail.com', '11987654321', 'F', 09951465, 'SP', 'Diadema', 'Piraporinha'),
	(DEFAULT, 'MARCOS SILVEIRA', '76543210901', '07/09/1988', 'Rua da Praia, 543', 'marcos.silveira@gmail.com', '21987654321', 'M', 11680000, 'SP', 'Ubatuba', 'Maranduba'),
	(DEFAULT, 'SILVIA MELO', '54321678109', '03/06/1977', 'Avenida da Esperança, 654', 'silvia.melo@gmail.com', '11987654321', 'F', 13308030, 'SP', 'Itu', 'Cidade Nova'),
	(DEFAULT, 'FELIPE OLIVEIRA', '98765432176', '25/12/1993', 'Rua das Estrelas, 879', 'felipe.oliveira@gmail.com', '21987654321', 'M', 8330400, 'SP', 'São Paulo', 'São Mateus');
	
insert into cliente values
	(DEFAULT, 'Frederico Vasquez', 14725896888, '1989-04-18', 'Rua Capicharã, 475', 'fred.vasquez@fred.vasquez.com', 11918273645, 'M', 4281110, 'SP', 'São Paulo', 'Vila Nair'),
	(DEFAULT, 'Cezar Adriano Matos', 12349870892, '08/03/1987', 'Rua Santa Áurea, 39', 'cezarmatos@gmail.com', 11947483031, 'M', 4282040, 'SP', 'São Paulo', 'Ipiranga'),
	(DEFAULT, 'Mariana Nogueira', 32345850842, '14/06/1991', 'Rua Cunha Gago, 176, Apto 82', 'mariananog@uol.com.br', 11981829002, 'F', 5421000, 'SP', 'São Paulo', 'Pinheiros'),
	(DEFAULT, 'Simone Oliveira Santos', 27691390816, '18/10/1990', 'Rua Maria Fegueiredo, 283, Apto 315', 'simonesantos@terra.com.br', 11991238765, 'F', 4002901, 'SP', 'São Paulo', 'Vila Mariana'),
	(DEFAULT, 'Moacir Cardoso Tavares', 12932635812, '28/01/1989', 'Avenida Nossa Senhora do Sabará, 1015, Apto 201', 'moacirtavres@gmail.com', 11987861334, 'M', 4688000, 'SP', 'São Paulo', 'Campo Grande'),
	(DEFAULT, 'Jaqueline Rocha', 21313267890, '16/09/1987', 'Rua Dr. Augusto Toledo, 1091', 'jaquerocha@gmail.com', 11953565458, 'F', 9540080, 'SP', 'São Caetano do Sul', 'Santa Paula'),
	(DEFAULT, 'Renata Albuquerque', 10922847829, '05/07/1974', 'Rua João Ribeiro, 133', 'renataalbuquerque@hotmail.com', 11999762391, 'F', 9070250, 'SP', 'Santo André', 'Campestre'),
	(DEFAULT, 'Amanda Albuquerque de Oliveira', 24918747873, '09/02/1998', 'Rua João Ribeiro, 133', 'amandaalbuquerque@hotmail.com', 11999761243, 'F', 9070250, 'SP', 'Santo André', 'Campestre');


DROP TABLE IF EXISTS dependente CASCADE;
CREATE TABLE dependente (
Cod_dependente SERIAL PRIMARY KEY,
Nome_dependente VARCHAR(50) NOT NULL,
cpf_dependente NUMERIC(11) NOT NULL,
data_nasci_dependente DATE NOT NULL,
sexo_cliente CHAR(1) CHECK (sexo_cliente IN ('M','F')),
Cod_cliente INTEGER REFERENCES cliente 
	ON DELETE CASCADE ON UPDATE CASCADE
);

insert into dependente values
	(default, 'João Felix Nery', 23423454332, '2010/10/23',	'M', 1),
	(default, 'Melissa Felix Nery', 76556745656, '2012,09/20', 'F',	1),
	(default, 'Larrissa Pereira', 78776510998, '2014-04-04', 'F', 3);
	
INSERT INTO dependente VALUES
	(default, 'Lucas Silva', '98765432101', '15/03/2015', 'M', 4),
	(default, 'Sophia Oliveira', '23456789012', '08/12/2017', 'F', 5),
	(default, 'Enzo Pereira', '54321678109', '02/05/2019', 'M', 9),
	(default, 'Isabela Ribeiro', '98765432176', '12/07/2021', 'F', 8),
	(default, 'Davi Souza', '76543210987', '21/11/2013', 'M', 6);
	
insert into dependente values
	(default, 'Lucas Oliveira Santos', 39176248835, '30/05/2016', 'M', 17),
	(default, 'Beatriz Cardoso Vasquez', 35621960812, '2012/11/04', 'F', 14),
	(default, 'Bianca Cardoso Vasquez', 35621992847, '2013/07/25', 'F',	14),
	(default, 'Ronaldo Cardoso Vasquez', 35623441847, '2014/08/31', 'M', 14),
	(default, 'Larissa Nogueira Alves', 39123341829, '03/02/2011', 'M', 16),
	(default, 'Pedro Henrique Fortunato', 18026099851, '08/12/2009', 'M', 2),
	(default, 'Ana Lucia Matos', 30129375883, '29/11/2012', 'F', 15),
	(default, 'Ana Laura Matos', 30129376872, '29/11/2012', 'F', 15),
	(default, 'Tatiana Cardoso Tavares', 36216416834, '13/02/2011', 'F', 18),
	(default, 'Samantha Rocha Neves', 34029915838, '12/05/2017', 'F', 18),
	(default, 'Yasmin Albuquerque de Oliveira', 30922173815, '11/02/2015', 'F',18);
	
DROP TABLE IF EXISTS ingresso CASCADE;
CREATE TABLE ingresso (
Num_ingresso SERIAL PRIMARY KEY,
Cod_cliente SERIAL REFERENCES cliente
	ON DELETE CASCADE ON UPDATE CASCADE,
Cod_tipo_ingresso INTEGER REFERENCES tipo_ingresso,
Cod_pagamento INTEGER REFERENCES forma_pagamento,
Situacao_ingresso VARCHAR (7) NOT NULL CHECK ( 
	situacao_ingresso IN ('ATIVO', 'INATIVO')),
Valor_ingresso NUMERIC(7,2) NOT NULL, 
Cod_dependente INTEGER REFERENCES dependente
);

DROP TABLE IF EXISTS forma_pagamento CASCADE;
CREATE TABLE forma_pagamento (
Cod_pagamento SERIAL PRIMARY KEY,
Forma_pagamento VARCHAR(20) NOT NULL CHECK 
	(Forma_pagamento IN ('PIX','CREDITO', 'DEBITO', 'DINHEIRO', 'GRATUIDADE')),
Situacao_pagamento  VARCHAR(20) NOT NULL CHECK 
	(Situacao_pagamento IN ('APROVADO','REPROVADO'))
);
ALTER TABLE forma_pagamento DROP COLUMN Situacao_pagamento;
DROP TABLE IF EXISTS calendario CASCADE;

CREATE TABLE calendario (
cal_data DATE PRIMARY KEY,
Dia_semana  VARCHAR(13) NOT NULL CHECK 
	(Dia_semana IN ('DOMINGO','SEGUNDA-FEIRA', 'TERÇA-FEIRA', 
							'QUARTA-FEIRA', 'QUINTA-FEIRA', 
							'SEXTA-FEIRA', 'SABADO')),
Situacao_data VARCHAR (7) NOT NULL CHECK (
	situacao_data IN ('ATIVO', 'INATIVO'))
);

DROP TABLE IF EXISTS tipo_ingresso CASCADE;
CREATE TABLE tipo_ingresso (
Cod_tipo_ingresso SERIAL PRIMARY KEY,
Desc_tipo_ingresso VARCHAR (50) NOT NULL
);

INSERT INTO tipo_ingresso VALUES 
(DEFAULT, 'GESTANTE'),
(DEFAULT,'IDOSO'),
(DEFAULT, 'COMUM');

INSERT INTO forma_pagamento VALUES
(DEFAULT, 'PIX'),
(DEFAULT,'CREDITO'),
(DEFAULT, 'DEBITO'),
(DEFAULT, 'DINHEIRO'),
(DEFAULT, 'GRATUIDADE');

select * from forma_pagamento;

ALTER TABLE calendario ALTER COLUMN Situacao_data SET DEFAULT 'ATIVO' ;

INSERT INTO calendario VALUES
('31/10/2023', 'TERÇA-FEIRA', default),
('01/11/2023', 'QUARTA-FEIRA', default),
('02/11/2023', 'QUINTA-FEIRA', default);

SELECT * FROM ingresso;

SELECT * FROM CLIENTE

CREATE TABLE ingresso (
Num_ingresso SERIAL PRIMARY KEY,
Cod_cliente SERIAL REFERENCES cliente
	ON DELETE CASCADE ON UPDATE CASCADE,
Cod_tipo_ingresso INTEGER REFERENCES tipo_ingresso,
Cod_pagamento INTEGER REFERENCES forma_pagamento,
Situacao_ingresso VARCHAR (7) NOT NULL CHECK ( 
	situacao_ingresso IN ('ATIVO', 'INATIVO')),
Valor_ingresso NUMERIC(7,2) NOT NULL, 
Cod_dependente INTEGER REFERENCES dependente
);

ALTER TABLE ingresso ADD COLUMN cal_data DATE REFERENCES calendario
	ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO ingresso VALUES
(DEFAULT, 1, 3, 1, 'ATIVO', 130.50);

UPDATE ingresso SET cal_data = '31/10/2023' WHERE num_ingresso = 2;

INSERT INTO ingresso VALUES
(DEFAULT, 2, 3, 1, 'ATIVO', 130.50, null, '01/11/2023'),
(DEFAULT, 3, 1, 5, 'ATIVO', 0, null, '01/11/2023'),
(DEFAULT, 4, 3, 1, 'ATIVO', 130.50, null, '02/11/2023'),
(DEFAULT, 5, 3, 1, 'ATIVO', 130.50, null, '02/11/2023');
select * from ingresso;

select * from cliente;

SELECT i.num_ingresso, i.cod_cliente, c.nome_cliente 
from ingresso as i
INNER JOIN cliente as c on
i.cod_cliente = c.cod_cliente

SELECT * FROM DEPENDENTE
SELECT * FROM INGRESSO

-- pesquisa qtde ingressos vendidos com 
---faturamento agrupado por dia no Mês de Novembro
-- quantidade de ingressos disponíveis e a quantidade de gratuidades 'vendidas'


SELECT
    i.cal_data as data_ingresso,
    count(i.num_ingresso) as Qt_ingressos,
    sum(i.valor_ingresso) as Faturamento,
    300 - count(i.num_ingresso) as Capacidade_disponivel,
    count(*) FILTER (WHERE f.Forma_pagamento ILIKE 'GRATUIDADE') as Quantidade_gratuidades
FROM ingresso as i
INNER JOIN forma_pagamento as f ON f.Cod_pagamento = i.Cod_pagamento
WHERE (EXTRACT(MONTH FROM cal_data) = 11)
GROUP BY i.cal_data
ORDER BY i.cal_data;



--- Mulheres de São Paulo com dependentes  
--- Idade do filho mais velho e mais novo

select * from cliente;

select UPPER	(c.nome_cliente)		as CLIENTE,
		count(d.cod_cliente) as NUM_DEPENDENTES,
		MAX(EXTRACT(YEAR FROM AGE(current_date, d.data_nasci_dependente))) 
		AS filho_mais_velho,
		MIN(EXTRACT(YEAR FROM AGE(current_date, d.data_nasci_dependente))) 
		AS filho_mais_novo
FROM cliente c 
INNER JOIN dependente d ON 
c.cod_cliente=d.cod_cliente
WHERE c.sexo_cliente ILIKE 'F' 
AND c.uf ILIKE ('SP') 
GROUP by c.nome_cliente
ORDER BY c.nome_cliente;
	
-- mostra Valores das compras de cada cliente por data
select 	i.cod_cliente AS id_cliente, 
		c.nome_cliente	AS cliente,
		TO_CHAR(i.cal_data, 'DD-Mon-YYYY') as cal_data,
		count(i.cod_cliente) as ingressos,
		sum(i.valor_ingresso) as Total_Compra, 
		fp.forma_pagamento as pagamento
	from ingresso i 
		INNER JOIN cliente c ON(c.cod_cliente=i.cod_cliente)
		INNER JOIN forma_pagamento fp ON(i.cod_pagamento=fp.cod_pagamento)
	group by i.cod_cliente, c.nome_cliente, i.cal_data, fp.forma_pagamento
	order by c.nome_cliente, i.cal_data
	

	-- oi

	INSERT INTO cliente VALUES
	(DEFAULT, 'Juliana Almeida', '98765432199', '28-09-1985', 'Rua da Harmonia, 987', 'juliana.almeida@email.com', '11987654321', 'F', 34567891, 'SP', 'São Paulo', 'Vila Madalena'),
	(DEFAULT, 'Ricardo Oliveira', '87654321098', '05-08-1978', 'Avenida das Flores, 543', 'ricardo.oliveira@email.com', '11987654321', 'M', 45678902, 'RJ', 'Rio de Janeiro', 'Ipanema'),
	(DEFAULT, 'Fernanda Pereira', '76543210987', '12-11-1990', 'Rua da Liberdade, 789', 'fernanda.pereira@email.com', '11987654321', 'F', 56789013, 'MG', 'Belo Horizonte', 'Lourdes'),
	(DEFAULT, 'Bruno Santos', '65432109876', '25-04-1983', 'Avenida das Estrelas, 1011', 'bruno.santos@email.com', '11987654321', 'M', 67890124, 'RS', 'Porto Alegre', 'Bela Vista'),
	(DEFAULT, 'Amanda Lima', '54321098765', '18-06-1988', 'Rua dos Sonhos, 246', 'amanda.lima@email.com', '11987654321', 'F', 78901235, 'PR', 'Curitiba', 'Bigorrilho'),
	(DEFAULT, 'Rodrigo Oliveira', '43210987654', '30-11-1975', 'Avenida da Alegria, 369', 'rodrigo.oliveira@email.com', '11987654321', 'M', 89012346, 'BA', 'Salvador', 'Ondina'),
	(DEFAULT, 'Carolina Silva', '32109876543', '17-07-1992', 'Rua das Maravilhas, 135', 'carolina.silva@email.com', '11987654321', 'F', 90123457, 'SC', 'Florianópolis', 'Centro'),
	(DEFAULT, 'Gustavo Santos', '21098765432', '22-04-1989', 'Avenida da Paz, 789', 'gustavo.santos@email.com', '11987654321', 'M', 12345678, 'PE', 'Recife', 'Boa Viagem'),
	(DEFAULT, 'Vanessa Lima', '11223344556', '15-01-1991', 'Rua do Comércio, 789', 'vanessa.lima@email.com', '11987654321', 'F', 12345678, 'SP', 'São Paulo', 'Jardins'),
	(DEFAULT, 'Thiago Rocha', '33445566778', '20-09-1987', 'Avenida Principal, 456', 'thiago.rocha@email.com', '11987654321', 'M', 23456789, 'RJ', 'Rio de Janeiro', 'Laranjeiras'),
	(DEFAULT, 'Maria Silva', '12345678901', '15-01-1980', 'Rua A, 123', 'maria.silva@email.com', '11987654321', 'F', 12345678, 'SP', 'São Paulo', 'Centro'),
	(DEFAULT, 'João Oliveira', '23456789012', '20-03-1985', 'Avenida B, 456', 'joao.oliveira@email.com', '11998765432', 'M', 23456789, 'RJ', 'Rio de Janeiro', 'Copacabana'),
	(DEFAULT, 'Amanda Santos', '34567890123', '10-08-1992', 'Rua C, 789', 'amanda.santos@email.com', '11987654321', 'F', 34567890, 'MG', 'Belo Horizonte', 'Savassi'),
	(DEFAULT, 'Ricardo Pereira', '45678901234', '25-05-1987', 'Avenida D, 1011', 'ricardo.pereira@email.com', '11987654321', 'M', 45678901, 'RS', 'Porto Alegre', 'Moinhos de Vento'),
	(DEFAULT, 'Laura Lima', '56789012345', '08-02-1994', 'Rua E, 246', 'laura.lima@email.com', '11987654321', 'F', 56789012, 'SP', 'São Paulo', 'Itaim Bibi'),
	(DEFAULT, 'Pedro Rocha', '67890123456', '30-11-1982', 'Avenida F, 369', 'pedro.rocha@email.com', '11987654321', 'M', 67890123, 'SC', 'Florianópolis', 'Centro'),
	(DEFAULT, 'Camila Oliveira', '78901234567', '17-07-1990', 'Rua G, 135', 'camila.oliveira@email.com', '11987654321', 'F', 78901234, 'PR', 'Curitiba', 'Batel'),
	(DEFAULT, 'Roberto Santos', '89012345678', '22-04-1988', 'Avenida H, 789', 'roberto.santos@email.com', '11987654321', 'M', 89012345, 'BA', 'Salvador', 'Barra'),
	(DEFAULT, 'Ana Oliveira', '12345678901', '15-05-1990', 'Rua Alegre, 123', 'ana.oliveira@email.com', '11987654321', 'F', 12345678, 'SP', 'São Paulo', 'Centro'),
	(DEFAULT, 'Carlos Silva', '23456789012', '20-09-1988', 'Avenida Bem-vindo, 456', 'carlos.silva@email.com', '11998765432', 'M', 23456789, 'RJ', 'Rio de Janeiro', 'Copacabana'),
	(DEFAULT, 'Patricia Souza', '34567890123', '10-12-1985', 'Rua das Flores, 789', 'patricia.souza@email.com', '11987654321', 'F', 34567890, 'MG', 'Belo Horizonte', 'Savassi'),
	(DEFAULT, 'Rodrigo Santos', '45678901234', '25-03-1992', 'Avenida da Paz, 1011', 'rodrigo.santos@email.com', '11987654321', 'M', 45678901, 'RS', 'Porto Alegre', 'Moinhos de Vento'),
	(DEFAULT, 'Mariana Lima', '56789012345', '18-06-1983', 'Rua Esperança, 246', 'mariana.lima@email.com', '11987654321', 'F', 56789012, 'SP', 'São Paulo', 'Morumbi'),
	(DEFAULT, 'Lucas Rocha', '67890123456', '30-11-1980', 'Avenida da Alegria, 369', 'lucas.rocha@email.com', '11987654321', 'M', 67890123, 'SC', 'Florianópolis', 'Centro'),
	(DEFAULT, 'Fernanda Oliveira', '78901234567', '17-07-1987', 'Rua Feliz, 135', 'fernanda.oliveira@email.com', '11987654321', 'F', 78901234, 'PR', 'Curitiba', 'Batel'),
	(DEFAULT, 'Gustavo Santos', '89012345678', '22-04-1995', 'Avenida das Maravilhas, 789', 'gustavo.santos@email.com', '11987654321', 'M', 89012345, 'BA', 'Salvador', 'Barra'),
	(DEFAULT, 'Aline Silva', '98765432101', '08-02-1994', 'Rua Paz e Amor, 789', 'aline.silva@email.com', '11987654321', 'F', 98765432, 'SP', 'São Paulo', 'Vila Mariana'),
	(DEFAULT, 'Rafael Oliveira', '87654321098', '30-11-1982', 'Avenida das Árvores, 369', 'rafael.oliveira@email.com', '11987654321', 'M', 87654321, 'SC', 'Florianópolis', 'Trindade'),
	(DEFAULT, 'Mariana Pereira', '22334455667', '28-07-1984', 'Rua da Harmonia, 987', 'mariana.pereira@email.com', '11987654321', 'F', 34567891, 'SP', 'São Paulo', 'Vila Madalena'),
	(DEFAULT, 'Anderson Oliveira', '11223344556', '05-05-1976', 'Avenida das Árvores, 543', 'anderson.oliveira@email.com', '11987654321', 'M', 45678902, 'RJ', 'Rio de Janeiro', 'Botafogo'),
	(DEFAULT, 'Beatriz Lima', '33445566778', '12-08-1995', 'Rua da Liberdade, 789', 'beatriz.lima@email.com', '11987654321', 'F', 56789013, 'MG', 'Belo Horizonte', 'Lourdes'),
	(DEFAULT, 'Lucas Santos', '66778899001', '25-02-1982', 'Avenida dos Sonhos, 1011', 'lucas.santos@email.com', '11987654321', 'M', 67890124, 'RS', 'Porto Alegre', 'Moinhos de Vento'),
	(DEFAULT, 'Isabela Rocha', '44556677889', '18-04-1987', 'Rua da Alegria, 246', 'isabela.rocha@email.com', '11987654321', 'F', 78901235, 'PR', 'Curitiba', 'Batel'),
	(DEFAULT, 'Ricardo Oliveira', '22334455667', '30-10-1974', 'Avenida dos Sonhos, 369', 'ricardo.oliveira@email.com', '11987654321', 'M', 89012346, 'BA', 'Salvador', 'Ondina'),
	(DEFAULT, 'Juliana Almeida', '66778899001', '17-03-1991', 'Rua da Maravilha, 135', 'juliana.almeida@email.com', '11987654321', 'F', 90123457, 'SC', 'Florianópolis', 'Centro'),
	(DEFAULT, 'Bruno Santos', '33445566778', '22-04-1988', 'Avenida da Paz, 789', 'bruno.santos@email.com', '11987654321', 'M', 12345678, 'PE', 'Recife', 'Boa Viagem'),
	(DEFAULT, 'Tatiane Lima', '99887766554', '15-01-1983', 'Rua do Comércio, 789', 'tatiane.lima@email.com', '11987654321', 'F', 12345678, 'SP', 'São Paulo', 'Jardins'),
	(DEFAULT, 'Leandro Rocha', '66778899001', '20-09-1987', 'Avenida Principal, 456', 'leandro.rocha@email.com', '11987654321', 'M', 23456789, 'RJ', 'Rio de Janeiro', 'Laranjeiras'),
	(DEFAULT, 'Fernanda Pereira', '33445566778', '28-07-1993', 'Rua da Harmonia, 987', 'fernanda.pereira@email.com', '11987654321', 'F', 34567891, 'SP', 'São Paulo', 'Vila Madalena'),
	(DEFAULT, 'Leonardo Oliveira', '66778899001', '05-05-1977', 'Avenida das Árvores, 543', 'leonardo.oliveira@email.com', '11987654321', 'M', 45678902, 'RJ', 'Rio de Janeiro', 'Botafogo'),
	(DEFAULT, 'Amanda Lima', '11223344556', '12-08-1998', 'Rua da Liberdade, 789', 'amanda.lima@email.com', '11987654321', 'F', 56789013, 'MG', 'Belo Horizonte', 'Lourdes'),
	(DEFAULT, 'Gabriel Santos', '99887766554', '25-02-1984', 'Avenida dos Sonhos, 1011', 'gabriel.santos@email.com', '11987654321', 'M', 67890124, 'RS', 'Porto Alegre', 'Moinhos de Vento'),
	(DEFAULT, 'Bianca Rocha', '33445566778', '18-04-1990', 'Rua da Alegria, 246', 'bianca.rocha@email.com', '11987654321', 'F', 78901235, 'PR', 'Curitiba', 'Batel'),
	(DEFAULT, 'Lucas Oliveira', '99887766554', '30-10-1987', 'Avenida dos Sonhos, 369', 'lucas.oliveira@email.com', '11987654321', 'M', 89012346, 'BA', 'Salvador', 'Ondina'),
	(DEFAULT, 'Aline Almeida', '44556677889', '17-03-1994', 'Rua da Maravilha, 135', 'aline.almeida@email.com', '11987654321', 'F', 90123457, 'SC', 'Florianópolis', 'Centro'),
	(DEFAULT, 'Rafael Santos', '66778899001', '22-04-1981', 'Avenida da Paz, 789', 'rafael.santos@email.com', '11987654321', 'M', 12345678, 'PE', 'Recife', 'Boa Viagem'),
	(DEFAULT, 'Thais Lima', '99887766554', '15-01-1986', 'Rua do Comércio, 789', 'thais.lima@email.com', '11987654321', 'F', 12345678, 'SP', 'São Paulo', 'Jardins'),
	(DEFAULT, 'Vinicius Rocha', '66778899001', '20-09-1990', 'Avenida Principal, 456', 'vinicius.rocha@email.com', '11987654321', 'M', 23456789, 'RJ', 'Rio de Janeiro', 'Laranjeiras'),
	(DEFAULT,'Lucas Oliveira', '99887766554', '14-03-1982', 'Rua da Esperança, 456', 'lucas.oliveira@email.com', '11987654321', 'M', 34567891, 'SP', 'São Paulo', 'Pinheiros'),
	(DEFAULT,'Camila Santos', '88776655443', '26-05-1986', 'Avenida da Alegria, 789', 'camila.santos@email.com', '11987654321', 'F', 45678902, 'RJ', 'Rio de Janeiro', 'Copacabana'),
	(DEFAULT,'Pedro Lima', '77665544332', '01-09-1995', 'Rua das Flores, 101', 'pedro.lima@email.com', '11987654321', 'M', 56789013, 'MG', 'Belo Horizonte', 'Funcionários'),
	(DEFAULT,'Isabela Pereira', '66554433221', '18-11-1989', 'Avenida da Liberdade, 222', 'isabela.pereira@email.com', '11987654321', 'F', 67890124, 'RS', 'Porto Alegre', 'Moinhos de Vento'),
	(DEFAULT,'Miguel Silva', '55443322110', '09-02-1980', 'Rua dos Sonhos, 333', 'miguel.silva@email.com', '11987654321', 'M', 78901235, 'PR', 'Curitiba', 'Batel'),
	(DEFAULT,'Ana Rocha', '44332211009', '22-07-1993', 'Avenida das Estrelas, 444', 'ana.rocha@email.com', '11987654321', 'F', 89012346, 'BA', 'Salvador', 'Barra'),
	(DEFAULT,'Rafael Santos', '33221100998', '03-12-1977', 'Rua da Paz, 555', 'rafael.santos@email.com', '11987654321', 'M', 90123457, 'SC', 'Florianópolis', 'Trindade'),
	(DEFAULT,'Larissa Lima', '22110099887', '16-06-1991', 'Avenida Principal, 666', 'larissa.lima@email.com', '11987654321', 'F', 12345678, 'PE', 'Recife', 'Pina'),
	(DEFAULT,'Gabriel Oliveira', '11009988776', '19-08-1988', 'Rua do Comércio, 777', 'gabriel.oliveira@email.com', '11987654321', 'M', 23456789, 'SP', 'São Paulo', 'Moema'),
	(DEFAULT,'Carla Rocha', '11223344556', '20-04-1985', 'Avenida Central, 888', 'carla.rocha@email.com', '11987654321', 'F', 34567891, 'RJ', 'Rio de Janeiro', 'Leblon'),
	(DEFAULT,'Fernando Santos', '33445566778', '15-10-1990', 'Rua das Maravilhas, 999', 'fernando.santos@email.com', '11987654321', 'M', 45678902, 'MG', 'Belo Horizonte', 'Savassi'),
	(DEFAULT,'Julia Lima', '55667788990', '28-03-1983', 'Avenida dos Sonhos, 111', 'julia.lima@email.com', '11987654321', 'F', 56789013, 'RS', 'Porto Alegre', 'Belém Novo'),
	(DEFAULT,'Alexandre Pereira', '11223344556', '20-09-1987', 'Rua das Maravilhas, 135', 'alexandre.pereira@email.com', '11987654321', 'M', 67890124, 'PR', 'Curitiba', 'Bigorrilho'),
	(DEFAULT,'Fernanda Lima', '33445566778', '15-01-1980', 'Avenida Principal, 456', 'fernanda.lima@email.com', '11987654321', 'F', 78901235, 'PE', 'Recife', 'Boa Viagem'),
	(DEFAULT,'Roberto Santos', '55667788990', '22-04-1989', 'Rua da Paz, 789', 'roberto.santos@email.com', '11987654321', 'M', 89012346, 'SC', 'Florianópolis', 'Centro'),
	(DEFAULT,'Aline Oliveira', '11223344556', '15-01-1991', 'Avenida da Alegria, 789', 'aline.oliveira@email.com', '11987654321', 'F', 90123457, 'BA', 'Salvador', 'Ondina'),
	(DEFAULT,'Leonardo Silva', '33445566778', '20-09-1987', 'Rua das Maravilhas, 135', 'leonardo.silva@email.com', '11987654321', 'M', 12345678, 'SP', 'São Paulo', 'Jardins'),
	(DEFAULT,'Larissa Rocha', '55667788990', '15-01-1980', 'Avenida Principal, 456', 'larissa.rocha@email.com', '11987654321', 'F', 23456789, 'RJ', 'Rio de Janeiro', 'Laranjeiras'),
	(DEFAULT,'Felipe Lima', '11223344556', '20-09-1987', 'Rua das Maravilhas, 135', 'felipe.lima@email.com', '11987654321', 'M', 34567891, 'SP', 'São Paulo', 'Centro'),
	(DEFAULT,'Mariana Santos', '33445566778', '15-01-1980', 'Avenida Principal, 456', 'mariana.santos@email.com', '11987654321', 'F', 45678902, 'RS', 'Porto Alegre', 'Bela Vista'),
	(DEFAULT,'Lucas Oliveira', '55667788990', '22-04-1989', 'Rua da Paz, 789', 'lucas.oliveira@email.com', '11987654321', 'M', 56789013, 'PR', 'Curitiba', 'Bigorrilho'),
	(DEFAULT,'Carolina Lima', '11223344556', '20-09-1987', 'Rua das Maravilhas, 135', 'carolina.lima@email.com', '11987654321', 'F', 90123457, 'PE', 'Recife', 'Boa Viagem'),
	(DEFAULT,'Thiago Santos', '33445566778', '20-09-1987', 'Rua das Maravilhas, 135', 'thiago.santos@email.com', '11987654321', 'M', 89012346, 'SC', 'Florianópolis', 'Centro'),
	(DEFAULT,'Vanessa Rocha', '55667788990', '20-09-1987', 'Rua das Maravilhas, 135', 'vanessa.rocha@email.com', '11987654321', 'F', 90123457, 'PE', 'Recife', 'Boa Viagem'),
	(DEFAULT,'Bruno Silva', '11223344556', '20-09-1987', 'Rua das Maravilhas, 135', 'bruno.silva@email.com', '11987654321', 'M', 12345678, 'SC', 'Florianópolis', 'Centro'),
	(DEFAULT,'Juliana Santos', '33445566778', '20-09-1987', 'Rua das Maravilhas, 135', 'juliana.santos@email.com', '11987654321', 'F', 23456789, 'PE', 'Recife', 'Boa Viagem'),
	(DEFAULT,'Rafael Lima', '55667788990', '22-04-1989', 'Rua da Paz, 789', 'rafael.lima@email.com', '11987654321', 'M', 34567891, 'SP', 'São Paulo', 'Vila Madalena'),
	(DEFAULT,'Ana Santos', '11223344556', '15-01-1991', 'Avenida da Alegria, 789', 'ana.santos@email.com', '11987654321', 'F', 45678902, 'RJ', 'Rio de Janeiro', 'Ipanema'),
	(DEFAULT,'Rodrigo Lima', '33445566778', '20-09-1987', 'Rua das Maravilhas, 135', 'rodrigo.lima@email.com', '11987654321', 'M', 56789013, 'MG', 'Belo Horizonte', 'Lourdes'),
	(DEFAULT,'Amanda Santos', '55667788990', '20-09-1987', 'Rua das Maravilhas, 135', 'amanda.santos@email.com', '11987654321', 'F', 67890124, 'RS', 'Porto Alegre', 'Bela Vista'),
	(DEFAULT,'Felipe Rocha', '11223344556', '15-01-1991', 'Avenida da Alegria, 789', 'felipe.rocha@email.com', '11987654321', 'M', 78901235, 'PR', 'Curitiba', 'Bigorrilho'),
	(DEFAULT,'Isabella Silva', '33445566778', '20-09-1987', 'Rua das Maravilhas, 135', 'isabella.silva@email.com', '11987654321', 'F', 89012346, 'BA', 'Salvador', 'Ondina'),
	(DEFAULT,'Gustavo Lima', '55667788990', '22-04-1989', 'Rua da Paz, 789', 'gustavo.lima@email.com', '11987654321', 'M', 90123457, 'SC', 'Florianópolis', 'Centro'),
	(DEFAULT,'Thais Santos', '11223344556', '15-01-1991', 'Avenida Principal, 456', 'thais.santos@email.com', '11987654321', 'F', 12345678, 'PE', 'Recife', 'Boa Viagem'),
	(DEFAULT,'Vinicius Rocha', '33445566778', '20-09-1987', 'Rua das Maravilhas, 135', 'vinicius.rocha@email.com', '11987654321', 'M', 23456789, 'SP', 'São Paulo', 'Jardins'),
	(DEFAULT,'Eduarda Lima', '55667788990', '15-01-1980', 'Avenida Principal, 456', 'eduarda.lima@email.com', '11987654321', 'F', 34567891, 'RJ', 'Rio de Janeiro', 'Laranjeiras'),
	(DEFAULT,'Lucas Santos', '11223344556', '15-01-1991', 'Avenida da Alegria, 789', 'lucas.santos@email.com', '11987654321', 'M', 45678902, 'MG', 'Belo Horizonte', 'Savassi'),
	(DEFAULT,'Laura Lima', '33445566778', '20-09-1987', 'Rua das Maravilhas, 135', 'laura.lima@email.com', '11987654321', 'F', 56789013, 'RS', 'Porto Alegre', 'Belém Novo'),
	(DEFAULT, 'Antônio Oliveira', '12345678901', '14-03-1950', 'Rua da Esperança, 456', 'antonio.oliveira@email.com', '11987654321', 'M', 34567891, 'SP', 'São Paulo', 'Pinheiros'),
	(DEFAULT, 'Maria Santos', '23456789012', '26-05-1948', 'Avenida da Alegria, 789', 'maria.santos@email.com', '11987654321', 'F', 45678902, 'RJ', 'Rio de Janeiro', 'Copacabana'),
	(DEFAULT, 'José Lima', '34567890123', '01-09-1940', 'Rua das Flores, 101', 'jose.lima@email.com', '11987654321', 'M', 56789013, 'MG', 'Belo Horizonte', 'Funcionários'),
	(DEFAULT, 'Ana Oliveira', '45678901234', '10-11-1938', 'Avenida da Paz, 987', 'ana.oliveira@email.com', '11987654321', 'F', 67890124, 'RS', 'Porto Alegre', 'Bela Vista'),
	(DEFAULT, 'Francisco Silva', '56789012345', '18-08-1945', 'Rua dos Sonhos, 246', 'francisco.silva@email.com', '11987654321', 'M', 78901235, 'PR', 'Curitiba', 'Bigorrilho'),
	(DEFAULT, 'Cecília Rocha', '67890123456', '30-01-1942', 'Avenida da Liberdade, 369', 'cecilia.rocha@email.com', '11987654321', 'F', 89012346, 'BA', 'Salvador', 'Ondina'),
	(DEFAULT, 'João Santos', '78901234567', '22-05-1930', 'Rua das Maravilhas, 135', 'joao.santos@email.com', '11987654321', 'M', 90123457, 'SC', 'Florianópolis', 'Centro'),
	(DEFAULT, 'Isabel Lima', '89012345678', '22-04-1935', 'Avenida da Alegria, 789', 'isabel.lima@email.com', '11987654321', 'F', 12345678, 'PE', 'Recife', 'Boa Viagem'),
	(DEFAULT, 'Manuel Santos', '90123456789', '20-09-1938', 'Avenida Principal, 456', 'manuel.santos@email.com', '11987654321', 'M', 23456789, 'RJ', 'Rio de Janeiro', 'Laranjeiras'),
	(DEFAULT, 'Rosa Silva', '11223344556', '15-01-1933', 'Rua A, 123', 'rosa.silva@email.com', '11987654321', 'F', 34567891, 'SP', 'São Paulo', 'Centro'),
	(DEFAULT, 'Joaquim Oliveira', '33445566778', '20-09-1937', 'Rua do Comércio, 789', 'joaquim.oliveira@email.com', '11987654321', 'M', 45678902, 'RJ', 'Rio de Janeiro', 'Ipanema'),
	(DEFAULT, 'Ana Lima', '12345678901', '15-01-1935', 'Rua A, 123', 'ana.lima@email.com', '11987654321', 'F', 56789013, 'MG', 'Belo Horizonte', 'Lourdes'),
	(DEFAULT, 'Alberto Santos', '44556677889', '30-11-1930', 'Rua das Maravilhas, 135', 'alberto.santos@email.com', '11987654321', 'M', 67890124, 'RS', 'Porto Alegre', 'Bela Vista'),
	(DEFAULT, 'Helena Rocha', '11223344556', '18-06-1932', 'Avenida da Alegria, 789', 'helena.rocha@email.com', '11987654321', 'F', 78901235, 'PR', 'Curitiba', 'Bigorrilho'),
	(DEFAULT, 'Antônio Silva', '22334455667', '15-01-1938', 'Rua dos Sonhos, 246', 'antonio.silva@email.com', '11987654321', 'M', 89012346, 'BA', 'Salvador', 'Ondina'),
	(DEFAULT, 'Carmen Oliveira', '11223344556', '22-04-1935', 'Rua da Paz, 789', 'carmen.oliveira@email.com', '11987654321', 'F', 90123457, 'SC', 'Florianópolis', 'Centro');


INSERT INTO dependente VALUES 
	(DEFAULT, 'Mateus Silva', 12345678901, '15-08-2008', 'M', 7),
	(DEFAULT, 'Laura Oliveira', 98765432109, '28-05-2010', 'F', 10),
	(DEFAULT, 'Felipe Pereira', 34567890123, '10-11-2013', 'M', 12),
	(DEFAULT, 'Mariana Lima', 56789012345, '03-04-2015', 'F', 13),
	(DEFAULT, 'Ricardo Santos', 67890123456, '22-09-2018', 'M', 19),
	(DEFAULT, 'Amanda Rocha', 89012345678, '12-03-2017', 'F', 20),
	(DEFAULT, 'Gabriel Lima', 12309876543, '18-06-2012', 'M', 21),
	(DEFAULT, 'Juliana Oliveira', 45678901234, '25-01-2014', 'F', 22),
	(DEFAULT, 'Enzo Silva', 56789012345, '07-08-2016', 'M', 23),
	(DEFAULT, 'Isabella Pereira', 78901234567, '30-12-2019', 'F', 24),
	(DEFAULT, 'Lucas Rocha', 89012345678, '14-04-2011', 'M', 25),
	(DEFAULT, 'Sophia Oliveira', '23456789012', '27-09-2013', 'F', 26),
	(DEFAULT, 'Henrique Silva', '98765432109', '08-02-2015', 'M', 27),
	(DEFAULT, 'Larissa Oliveira', '76543210987', '01-07-2018', 'F', 28),
	(DEFAULT, 'Matheus Pereira', '54321098765', '14-11-2020', 'M', 29),
	(DEFAULT, 'Ana Lima', '87654321098', '22-05-2012', 'F', 30),
	(DEFAULT, 'Pedro Rocha', '98765432109', '03-10-2014', 'M', 31),
	(DEFAULT, 'Carolina Silva', 11223344556, '16-03-2017', 'F', 32),
	(DEFAULT, 'Lucas Santos', 33445566778, '29-08-2019', 'M', 33),
	(DEFAULT, 'Camila Lima', 55667788990, '12-01-2011', 'F', 34),
	(DEFAULT, 'João Oliveira', 33445566778, '25-06-2013', 'M', 35),
	(DEFAULT, 'Larissa Santos', 55667788990, '08-11-2016', 'F', 36),
	(DEFAULT, 'Gustavo Rocha', 33445566778, '19-04-2018', 'M', 37),
	(DEFAULT, 'Amanda Lima', 55667788990, '02-09-2011', 'F', 38),
	(DEFAULT, 'Bruno Silva', 33445566778, '15-02-2013', 'M', 39),
	(DEFAULT, 'Juliana Santos', 55667788990, '28-07-2015', 'F', 40),
	(DEFAULT, 'Rafael Lima', 33445566778, '11-12-2017', 'M', 41),
	(DEFAULT, 'Thais Santos', 55667788990, '24-03-2012', 'F', 42),
	(DEFAULT, 'Vinicius Rocha', 33445566778, '06-08-2014', 'M', 43),
	(DEFAULT, 'Eduarda Lima', 55667788990, '19-01-2016', 'F', 44),
	(DEFAULT, 'Lucas Santos', 33445566778, '03-06-2018', 'M', 45),
	(DEFAULT, 'Laura Lima', 55667788990, '16-11-2011', 'F', 46),
	(DEFAULT, 'Gustavo Lima', 33445566778, '29-04-2013', 'M', 47),
	(DEFAULT, 'Thais Santos', 55667788990, '12-10-2015', 'F', 48),
	(DEFAULT, 'Vinicius Rocha', 33445566778, '25-02-2017', 'M', 49),
	(DEFAULT, 'Eduarda Lima', 55667788990, '10-07-2019', 'F', 50),
	(DEFAULT, 'Larissa Santos', 55667788990, '25-06-2014', 'F', 36),
	(DEFAULT, 'Gustavo Rocha', 33445566778, '19-04-2016', 'M', 37),
	(DEFAULT, 'Amanda Lima', 55667788990, '02-09-2011', 'F', 38),
	(DEFAULT, 'Bruno Silva', 33445566778, '15-02-2013', 'M', 39),
	(DEFAULT, 'Juliana Santos', 55667788990, '28-07-2015', 'F', 40),
	(DEFAULT,'Rafael Lima', 33445566778, '11-12-2017', 'M', 41),
	(DEFAULT,'Thais Santos', 55667788990, '24-03-2012', 'F', 42),
	(DEFAULT,'Vinicius Rocha', 33445566778, '06-08-2014', 'M', 43),
	(DEFAULT,'Eduarda Lima', 55667788990, '19-01-2016', 'F', 44),
	(DEFAULT,'Lucas Santos', 33445566778, '03-06-2018', 'M', 45),
	(DEFAULT,'Laura Lima', 55667788990, '16-11-2011', 'F', 46),
	(DEFAULT,'Gustavo Lima', 33445566778, '29-04-2013', 'M', 47),
	(DEFAULT,'Thais Santos', 55667788990, '12-10-2015', 'F', 48),
	(DEFAULT,'Vinicius Rocha', 33445566778, '25-02-2017', 'M', 49),
	(DEFAULT,'Eduarda Lima', 55667788990, '10-07-2019', 'F', 50),
	(DEFAULT,'Isabela Lima', 11223344556, '15-01-2013', 'F', 3),
	(DEFAULT,'Ana Rocha', 33221100998, '20-09-2015', 'F', 3),
	(DEFAULT,'Rafael Santos', 33221100998, '03-12-2012', 'M', 3),
	(DEFAULT,'Larissa Nogueira Alves', 39123341829, '03-02-2010', 'M', 16),
	(DEFAULT,'Pedro Henrique Fortunato', 18026099851, '08-12-2012', 'M', 2),
	(DEFAULT,'Ana Lucia Matos', 30129375883, '29-11-2017', 'F', 15),
	(DEFAULT,'Ana Laura Matos', 30129376872, '29-11-2017', 'F', 15),
	(DEFAULT,'Tatiana Cardoso Tavares', 36216416834, '13-02-2012', 'F', 18),
	(DEFAULT,'Samantha Rocha Neves', 34029915838, '12-05-2016', 'F', 75),
	(DEFAULT,'Yasmin Albuquerque de Oliveira', 30922173815, '11-02-2015', 'F', 36),
	(DEFAULT,'Arthur Lima', 77665544332, '14-08-2016', 'M', 3),
	(DEFAULT,'Valentina Pereira', 55443322110, '09-01-2014', 'F', 12),
	(DEFAULT,'Laura Oliveira', 55667788990, '17-10-2013', 'F', 11),
	(DEFAULT,'Enzo Silva', 98765432101, '23-04-2012', 'M', 9),
	(DEFAULT,'Sophia Oliveira', 23456789012, '08-05-2010', 'F', 5),
	(DEFAULT,'Rafael Pereira', 54321678109, '02-09-2008', 'M', 3),
	(DEFAULT,'Isabella Ribeiro', 98765432176, '12-07-2010', 'F', 8),
	(DEFAULT,'Davi Souza', 76543210987, '21-11-2012', 'M', 6),
	(DEFAULT,'Lucas Oliveira Santos', 39176248835, '30-05-2016', 'M', 17),
	(DEFAULT,'Beatriz Cardoso Vasquez', 35621960812, '04-11-2012', 'F', 14),
	(DEFAULT,'Bianca Cardoso Vasquez', 35621992847, '25-07-2013', 'F', 45),
	(DEFAULT,'Ronaldo Cardoso Vasquez', 35623441847, '31-08-2014', 'M', 14),
	(DEFAULT,'Larissa Nogueira Alves', 39123341829, '03-02-2011', 'M', 16),
	(DEFAULT,'Pedro Henrique Fortunato', 18026099851, '08-12-2014', 'M', 2),
	(DEFAULT,'Ana Lucia Matos', 30129375883, '29-11-2012', 'F', 15),
	(DEFAULT,'Ana Laura Matos', 30129376872, '29-11-2012', 'F', 15),
	(DEFAULT,'Tatiana Cardoso Tavares', 36216416834, '13-02-2011', 'F', 18),
	(DEFAULT,'Samantha Rocha Neves', 34029915838, '12-05-2017', 'F', 110),
	(DEFAULT,'Yasmin Albuquerque de Oliveira', 30922173815, '11-02-2015', 'F', 18),
	(DEFAULT,'Lucas Rocha', 98765432101, '15-03-2015', 'M', 51),
	(DEFAULT,'Mariana Lima', 23456789012, '28-06-2017', 'F', 52),
	(DEFAULT,'Enzo Silva', 34567890123, '10-11-2019', 'M', 53),
	(DEFAULT,'Isabella Pereira', 45678901234, '03-04-2021', 'F', 54),
	(DEFAULT,'Lucas Rocha', 56789012345, '22-10-2014', 'M', 55),
	(DEFAULT,'Sophia Oliveira', 67890123456, '12-03-2016', 'F', 56),
	(DEFAULT,'Henrique Silva', 89012345678, '18-08-2019', 'M', 57),
	(DEFAULT,'Larissa Oliveira', 12309876543, '25-01-2018', 'F', 58),
	(DEFAULT,'Matheus Pereira', 45678901234, '07-06-2020', 'M', 59),
	(DEFAULT,'Ana Lima', 56789012345, '30-12-2013', 'F', 60),
	(DEFAULT,'Pedro Rocha', 67890123456, '14-05-2015', 'M', 61),
	(DEFAULT,'Carolina Silva', 89012345678, '27-10-2018', 'F', 62),
	(DEFAULT,'Lucas Santos', 12309876543, '10-04-2020', 'M', 63),
	(DEFAULT,'Camila Lima', 45678901234, '22-07-2012', 'F', 64),
	(DEFAULT,'João Oliveira', 56789012345, '05-12-2014', 'M', 65),
	(DEFAULT,'Larissa Santos', 67890123456, '18-05-2017', 'F', 66),
	(DEFAULT,'Gustavo Rocha', 89012345678, '29-10-2019', 'M', 67),
	(DEFAULT,'Amanda Lima', 12309876543, '12-02-2012', 'F', 68),
	(DEFAULT,'Bruno Silva', 45678901234, '25-07-2014', 'M', 69),
	(DEFAULT,'Juliana Santos', 56789012345, '08-12-2016', 'F', 70),
	(DEFAULT,'Rafael Lima', 67890123456, '21-07-2018', 'M', 71),
	(DEFAULT,'Thais Santos', 89012345678, '04-02-2013', 'F', 72),
	(DEFAULT,'Vinicius Rocha', 12309876543, '17-07-2015', 'M', 73),
	(DEFAULT,'Eduarda Lima', 45678901234, '30-12-2017', 'F', 74),
	(DEFAULT,'Lucas Santos', 56789012345, '03-06-2019', 'M', 75),
	(DEFAULT,'Laura Lima', 67890123456, '16-11-2012', 'F', 76),
	(DEFAULT,'Gustavo Lima', 89012345678, '29-04-2014', 'M', 77),
	(DEFAULT,'Thais Santos', 12309876543, '12-10-2016', 'F', 78),
	(DEFAULT,'Vinicius Rocha', 45678901234, '25-02-2018', 'M', 79),
	(DEFAULT,'Eduarda Lima', 56789012345, '10-07-2020', 'F', 80),
	(DEFAULT,'Isabela Lima', 12309876543, '15-01-2015', 'F', 51),
	(DEFAULT,'Ana Rocha', 33221100998, '20-09-2017', 'F', 51),
	(DEFAULT,'Rafael Santos', 33221100998, '03-12-2014', 'M', 51),
	(DEFAULT,'Larissa Nogueira Alves', 39123341829, '02-03-2012', 'M', 66),
	(DEFAULT,'Pedro Henrique Fortunato', 18026099851, '08-12-2014', 'M', 57),
	(DEFAULT,'Ana Lucia Matos', 30129375883, '29-11-2019', 'F', 68),
	(DEFAULT,'Ana Laura Matos', 30129376872, '29-11-2019', 'F', 69),
	(DEFAULT,'Tatiana Cardoso Tavares', 36216416834, '13-02-2014', 'F', 70),
	(DEFAULT,'Samantha Rocha Neves', 34029915838, '12-05-2018', 'F', 71),
	(DEFAULT,'Yasmin Albuquerque de Oliveira', 30922173815, '11-02-2017', 'F', 72),
	(DEFAULT,'Arthur Lima', 77665544332, '14-08-2015', 'M', 73),
	(DEFAULT,'Valentina Pereira', 55443322110, '09-01-2013', 'F', 74),
	(DEFAULT,'Laura Oliveira', 55667788990, '17-10-2012', 'F', 75),
	(DEFAULT,'Enzo Silva', 98765432101, '23-04-2011', 'M', 76),
	(DEFAULT,'Sophia Oliveira', 23456789012, '08-05-2009', 'F', 77),
	(DEFAULT,'Rafael Pereira', 54321678109, '02-09-2007', 'M', 78),
	(DEFAULT,'Isabella Ribeiro', 98765432176, '12-07-2009', 'F', 79),
	(DEFAULT,'Davi Souza', 76543210987, '21-11-2011', 'M', 80),
	(DEFAULT,'Sophie Santos', 11223344556, '15-03-2012', 'F', 81),
	(DEFAULT,'Rafael Lima', 33445566778, '28-06-2014', 'M', 82),
	(DEFAULT,'Mariana Silva', 55667788990, '10-11-2016', 'F', 83),
	(DEFAULT,'Enzo Oliveira', 77889900112, '03-04-2019', 'M', 84),
	(DEFAULT,'Ana Rocha', 99887766554, '22-10-2014', 'F', 85),
	(DEFAULT,'Lucas Oliveira', 11223344556, '12-03-2016', 'M', 86),
	(DEFAULT,'Valentina Lima', 33445566778, '18-08-2019', 'F', 87),
	(DEFAULT,'Henrique Silva', 55667788990, '25-01-2018', 'M', 88),
	(DEFAULT,'Gabriel Lima', 77889900112, '07-06-2020', 'F', 89),
	(DEFAULT,'Larissa Rocha', 99887766554, '30-12-2013', 'M', 90),
	(DEFAULT,'Pedro Oliveira', 11223344556, '14-05-2015', 'F', 91),
	(DEFAULT,'Carla Silva', 33445566778, '27-10-2018', 'M', 92),
	(DEFAULT,'Lucas Santos', 55667788990, '10-04-2020', 'F', 93),
	(DEFAULT,'Camila Lima', 77889900112, '22-07-2012', 'M', 94),
	(DEFAULT,'João Oliveira', 99887766554, '05-12-2014', 'F', 95),
	(DEFAULT,'Larissa Santos', 11223344556, '18-05-2017', 'M', 96),
	(DEFAULT,'Gustavo Rocha', 33445566778, '29-10-2019', 'F', 97),
	(DEFAULT,'Amanda Lima', 55667788990, '12-02-2012', 'M', 98),
	(DEFAULT,'Bruno Silva', 77889900112, '25-07-2014', 'F', 99),
	(DEFAULT,'Juliana Santos', 99887766554, '08-12-2016', 'M', 100),
	(DEFAULT,'Rafael Lima', 11223344556, '21-07-2018', 'F', 101),
	(DEFAULT,'Thais Santos', 33445566778, '04-02-2013', 'M', 102),
	(DEFAULT,'Vinicius Rocha', 55667788990, '17-07-2015', 'F', 103),
	(DEFAULT,'Eduarda Lima', 77889900112, '30-12-2017', 'M', 104);
	
	INSERT INTO calendario VALUES
('03-11-2023', 'SEXTA-FEIRA', default),
('04-11-2023', 'SABADO', default),
('05-11-2023', 'DOMINGO', default),
('06-11-2023', 'SEGUNDA-FEIRA', 'INATIVO'),
('07-11-2023', 'TERÇA-FEIRA', default),
('08-11-2023', 'QUARTA-FEIRA', default),
('09-11-2023', 'QUINTA-FEIRA', default),
('10-11-2023', 'SEXTA-FEIRA', default),
('11-11-2023', 'SABADO', default),
('12-11-2023', 'DOMINGO', default),
('13-11-2023', 'SEGUNDA-FEIRA', 'INATIVO'),
('14-11-2023', 'TERÇA-FEIRA', default),
('15-11-2023', 'QUARTA-FEIRA', default),
('16-11-2023', 'QUINTA-FEIRA', default),
('17-11-2023', 'SEXTA-FEIRA', default),
('18-11-2023', 'SABADO', default),
('19-11-2023', 'DOMINGO', default),
('20-11-2023', 'SEGUNDA-FEIRA', default),
('21-11-2023', 'TERÇA-FEIRA', default),
('22-11-2023', 'QUARTA-FEIRA', default),
('23-11-2023', 'QUINTA-FEIRA', default),
('24-11-2023', 'SEXTA-FEIRA', default),
('25-11-2023', 'SABADO', default),
('26-11-2023', 'DOMINGO', default),
('27-11-2023', 'SEGUNDA-FEIRA', 'INATIVO'),
('28-11-2023', 'TERÇA-FEIRA', default),
('29-11-2023', 'QUARTA-FEIRA', default),
('30-11-2023', 'QUINTA-FEIRA', default),
('01-12-2023', 'SEXTA-FEIRA', default),
('02-12-2023', 'SABADO', default),
('03-12-2023', 'DOMINGO', default),
('04-12-2023', 'SEGUNDA-FEIRA', 'INATIVO'),
('05-12-2023', 'TERÇA-FEIRA', default),
('06-12-2023', 'QUARTA-FEIRA', default),
('07-12-2023', 'QUINTA-FEIRA', default),
('08-12-2023', 'SEXTA-FEIRA', default),
('09-12-2023', 'SABADO', default),
('10-12-2023', 'DOMINGO', default),
('11-12-2023', 'SEGUNDA-FEIRA', 'INATIVO'),
('12-12-2023', 'TERÇA-FEIRA', default),
('13-12-2023', 'QUARTA-FEIRA', default),
('14-12-2023', 'QUINTA-FEIRA', default),
('15-12-2023', 'SEXTA-FEIRA', default),
('16-12-2023', 'SABADO', default),
('17-12-2023', 'DOMINGO', default),
('18-12-2023', 'SEGUNDA-FEIRA', 'INATIVO'),
('19-12-2023', 'TERÇA-FEIRA', default),
('20-12-2023', 'QUARTA-FEIRA', default),
('21-12-2023', 'QUINTA-FEIRA', default),
('22-12-2023', 'SEXTA-FEIRA', default),
('23-12-2023', 'SABADO', default),
('24-12-2023', 'DOMINGO', default),
('25-12-2023', 'SEGUNDA-FEIRA', default),
('26-12-2023', 'TERÇA-FEIRA', default),
('27-12-2023', 'QUARTA-FEIRA', default),
('28-12-2023', 'QUINTA-FEIRA', default),
('29-12-2023', 'SEXTA-FEIRA', default),
('30-12-2023', 'SABADO', default),
('31-12-2023', 'DOMINGO', default);
ALTER TABLE ingresso DROP COLUMN situacao_ingresso;


INSERT INTO ingresso VALUES 
(default, 1, 3, 1, 130.50, 1, 31/10/2023)
(default, 1, 3, 1, 130.50, 2, 31/10/2023)
(default, 2, 3, 2, 65.25, 3, 01/11/2023)
(default, 3, 3, 2, 65.25, 4, 01/11/2023)
(default, 4, 3, 2, 130.50, 5, 02/11/2023)
(default, 5, 3, 3, 130.50, 6, 02/11/2023)
(default, 5, 3, 3, 130.50, 7, 02/11/2023)
(default, 5, 3, 3, 130.50, 8, 02/11/2023)
(default, 6, 3, 1, 130.50, 9, 02/11/2023)
(default, 6, 3, 1, 130.50, 10, 02/11/2023)
(default, 7, 3, 1, 130.50, 11, 31/10/2023)
(default, 8, 3, 4, 130.50, 12, 31/10/2023)
(default, 9, 3, 2, 130.50, 13, 31/10/2023)
(default, 9, 3, 2, 130.50, 14, 31/10/2023)
(default, 9, 3, 2, 130.50, 15, 31/10/2023)
(default, 9, 3, 2, 130.50, 16, 31/10/2023)
(default, 10, 3, 4, 130.50, 17, 31/10/2023)
(default, 11, 3, 3, 130.50, 18, 31/10/2023)
(default, 12, 3, 2, 130.50, 19, 31/10/2023)
(default, 12, 3, 2, 130.50, 20, 31/10/2023)
(default, 13, 3, 1, 130.50, 21, 31/10/2023)
(default, 14, 3, 1, 65.25, 22, 01/11/2023)
(default, 14, 3, 1, 65.25, 23, 01/11/2023)
(default, 15, 3, 4, 65.25, 24, 01/11/2023)
(default, 16, 3, 2, 65.25, 25, 01/11/2023)
(default, 18, 3, 1, 65.25, 26, 01/11/2023)
(default, 18, 3, 1, 65.25, 27, 01/11/2023)
(default, 20, 3, 1, 65.25, 28, 01/11/2023)
(default, 22, 3, 1, 65.25, 29, 01/11/2023)
(default, 22, 3, 1, 65.25, 30, 01/11/2023)
(default, 23, 3, 2, 65.25, 31, 01/11/2023)
(default, 24, 3, 2, 65.25, 32, 01/11/2023)
(default, 24, 3, 2, 65.25, 33, 01/11/2023)
(default, 26, 3, 3, 65.25, 34, 01/11/2023)
(default, 28, 3, 1, 65.25, 35, 01/11/2023)
(default, 28, 3, 1, 65.25, 36, 01/11/2023)
(default, 28, 3, 1, 65.25, 37, 01/11/2023)
(default, 29, 3, 4, 65.25, 38, 01/11/2023)
(default, 31, 3, 1, 65.25, 39, 01/11/2023)
(default, 32, 3, 1, 65.25, 40, 01/11/2023)
(default, 32, 3, 1, 65.25, 41, 01/11/2023)
(default, 32, 3, 1, 65.25, 42, 01/11/2023)
(default, 32, 3, 1, 65.25, 43, 01/11/2023)
(default, 32, 3, 1, 65.25, 44, 01/11/2023)
(default, 32, 3, 1, 65.25, 45, 01/11/2023)
(default, 35, 3, 2, 65.25, 46, 01/11/2023)
(default, 36, 3, 2, 65.25, 47, 01/11/2023);

