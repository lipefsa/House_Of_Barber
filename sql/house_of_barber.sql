-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22-Jul-2023 às 02:07
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `house_of_barber`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `agendamento`
--

CREATE TABLE `agendamento` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `estabelecimento_id` int(11) NOT NULL,
  `data_agendamento` date NOT NULL,
  `horario_agendamento` time NOT NULL,
  `valor` float NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `agendamento`
--

INSERT INTO `agendamento` (`id`, `cliente_id`, `estabelecimento_id`, `data_agendamento`, `horario_agendamento`, `valor`, `status`, `data_criacao`) VALUES
(13, 4, 4, '2022-08-21', '09:00:00', 13, 'PENDENTE', '2022-08-19 03:32:33'),
(16, 4, 4, '2022-08-21', '10:30:00', 5, 'FINALIZADO', '2022-08-19 04:44:22'),
(17, 4, 4, '2022-08-28', '20:30:00', 5, 'PENDENTE', '2022-08-20 21:02:29'),
(18, 4, 4, '2022-08-21', '09:30:00', 5, 'PENDENTE', '2022-08-21 22:24:22'),
(19, 4, 4, '2022-08-21', '18:00:00', 5, 'PENDENTE', '2022-08-21 23:17:29'),
(20, 4, 4, '2022-08-21', '18:30:00', 5, 'PENDENTE', '2022-08-21 23:18:22');

-- --------------------------------------------------------

--
-- Estrutura da tabela `agendamento_servico`
--

CREATE TABLE `agendamento_servico` (
  `agendamento_id` int(11) NOT NULL,
  `servico_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `agendamento_servico`
--

INSERT INTO `agendamento_servico` (`agendamento_id`, `servico_id`) VALUES
(13, 3),
(16, 3),
(16, 4),
(17, 4),
(18, 4),
(18, 4),
(18, 3),
(18, 3),
(19, 4),
(20, 4),
(20, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `api_token`
--

CREATE TABLE `api_token` (
  `id_api_token` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `perfil` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_acesso` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `api_token`
--

INSERT INTO `api_token` (`id_api_token`, `id_usuario`, `perfil`, `token`, `data_acesso`) VALUES
(1, 4, 'CLIENTE', '889afc8ffeee9e92484b21b8e528e422', '2022-08-12 04:06:27'),
(2, 4, 'CLIENTE', '9bb68bb0952dbc58a40e3ac60dbc4cb9', '2022-08-12 04:07:58'),
(3, 4, 'CLIENTE', 'a6e4e1e3942a444ad6d951c216d07c3a', '2022-08-12 04:08:17'),
(4, 4, 'CLIENTE', '8a4f5ad1deffa7c2b4a46a3a26266463', '2022-08-12 04:34:13'),
(5, 4, 'CLIENTE', '70f30da7456e8d144e00beb09df4f6d3', '2022-08-12 04:37:18'),
(6, 4, 'CLIENTE', '8d950518ea9034390b14bcfc80712687', '2022-08-13 01:21:21'),
(7, 4, 'CLIENTE', 'e80c82618682d54eb11eb156a5804db9', '2022-08-13 02:40:04'),
(8, 4, 'CLIENTE', 'e597396e93de852973d03cbf49052654', '2022-08-13 02:45:38'),
(9, 4, 'CLIENTE', '0c64424bb015f6530a55a7c00e27dabb', '2022-08-13 03:11:08'),
(10, 4, 'ESTABELECIMENTO', '032967b00806d8bd69b6f709f4ddfc5c', '2022-08-13 16:58:59'),
(11, 4, 'ESTABELECIMENTO', '114bb0790fd594b0baaf85b932a75dbb', '2022-08-13 17:01:39'),
(12, 4, 'ESTABELECIMENTO', 'ee5e03b873400b40369374fe85978f0b', '2022-08-13 17:06:00'),
(13, 4, 'ESTABELECIMENTO', 'b63e3ce41d471fdeb9b1355c2400a815', '2022-08-13 17:06:40'),
(14, 4, 'CLIENTE', 'ba145403902f4db8138cf0a26bc364e3', '2022-08-13 23:06:49'),
(15, 4, 'ESTABELECIMENTO', 'a74ceb1a9b80c6e411dfd96fbcb11b42', '2022-08-13 23:09:11'),
(16, 4, 'CLIENTE', 'f4f4a60864c1e6f9e95be9bc731a31ab', '2022-08-14 14:19:33'),
(17, 4, 'ESTABELECIMENTO', '332fffd4562248af921376bdd5fee152', '2022-08-14 14:22:21'),
(18, 4, 'CLIENTE', 'a909f070a0cb86c46613675cde8ba8bb', '2022-08-14 14:23:47'),
(19, 4, 'CLIENTE', '79040930fb20b4d4a1921ce97532f4ff', '2022-08-14 18:44:51'),
(20, 4, 'CLIENTE', 'efcb113a809f63b71cc88ab0e1fc7677', '2022-08-15 00:08:09'),
(21, 4, 'CLIENTE', 'f0eb79b660eafcc9ae7a0fc308f62ef3', '2022-08-15 10:13:35'),
(22, 4, 'ESTABELECIMENTO', '69539a35b2931d236636ee776c433ba7', '2022-08-15 16:45:52'),
(23, 4, 'ESTABELECIMENTO', 'd0eb1b587ee176bb547a1290ea773a4e', '2022-08-15 16:48:35'),
(24, 4, 'ESTABELECIMENTO', 'dc73b607416c2a70b594413a919d1259', '2022-08-15 16:48:47'),
(25, 4, 'ESTABELECIMENTO', '91ab831f6811288eb31e10145a496569', '2022-08-16 00:45:57'),
(26, 4, 'CLIENTE', '7506bef4074e7f3dddd9fd8a20021ef7', '2022-08-19 01:37:00'),
(27, 4, 'ESTABELECIMENTO', '06cf1b40acae566a83651829008a1657', '2022-08-19 01:52:32'),
(28, 4, 'ESTABELECIMENTO', 'e16b00d799cd6fdba0d03c4aa1c072bd', '2022-08-19 03:06:41'),
(29, 4, 'CLIENTE', '73cddba3dc096fdca456d15ac778ae1f', '2022-08-19 03:27:30'),
(30, 4, 'ESTABELECIMENTO', '85a8a77e830a495359fd43e8835559e8', '2022-08-20 19:15:26'),
(31, 4, 'ESTABELECIMENTO', '32da0d834abbf002aab086bec663c429', '2022-08-20 20:02:03'),
(32, 4, 'CLIENTE', 'd48eaaf1ddbd1f18566bbb8ff03e554f', '2022-08-20 21:01:43'),
(33, 4, 'ESTABELECIMENTO', '6f25c9f741927e2a27beeb8cadf50bf8', '2022-08-21 15:13:02'),
(34, 4, 'CLIENTE', '2c1d65f047ebf0de82e964905cda5dba', '2022-08-21 15:14:58');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_nascimento` date NOT NULL,
  `cpf` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_google` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `telefone`, `data_nascimento`, `cpf`, `email`, `senha`, `sub_google`, `data_cadastro`) VALUES
(4, 'Teste AAAAAA', '(75) 88888-8888', '2022-08-02', '000.000.000-00', 'teste@teste.com', '$2y$10$SHME6Z9lJKWBwivh1NeU.Ov/8Cn9sTU2/QtGyTfYYz/.9ffTbkNf2', '', '2022-08-13 23:07:50');

-- --------------------------------------------------------

--
-- Estrutura da tabela `dias_funcionamento`
--

CREATE TABLE `dias_funcionamento` (
  `id` int(11) NOT NULL,
  `dia` int(11) NOT NULL,
  `horario_abertura` time NOT NULL,
  `horario_fechamento` time NOT NULL,
  `estabelecimento_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `dias_funcionamento`
--

INSERT INTO `dias_funcionamento` (`id`, `dia`, `horario_abertura`, `horario_fechamento`, `estabelecimento_id`) VALUES
(7, 6, '09:00:00', '23:00:00', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `id` int(11) NOT NULL,
  `estabelecimento_id` int(11) NOT NULL,
  `cep` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rua` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`id`, `estabelecimento_id`, `cep`, `estado`, `cidade`, `bairro`, `rua`, `numero`) VALUES
(1, 4, '44032-582', 'BA', 'Feira de Santana', 'Campo Limpo', 'Rua do Catálogo', '2247');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estabelecimento`
--

CREATE TABLE `estabelecimento` (
  `id` int(11) NOT NULL,
  `nome_admin` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone_admin` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf_admin` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnpj` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `foto_perfil` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `estabelecimento`
--

INSERT INTO `estabelecimento` (`id`, `nome_admin`, `telefone_admin`, `cpf_admin`, `email`, `senha`, `nome`, `tipo`, `telefone`, `cnpj`, `data_cadastro`, `foto_perfil`, `status`) VALUES
(4, 'Nome do admin', '(75) 99997-8877', '111.111.111-11', 'teste@email.com', '$2y$10$O/yyw5/dxYg6nBi8xT.Vzei8DlXtBrvOD9HIsbCfXS4EMusnfHrfK', 'Nome da barbearia', 'BARBEARIA', '(88) 77777-7777', '00.000.0000/0001-00', '2022-08-21 21:48:57', 'dbdbdc0b8505e06936333032373835346136316233.png', 'ATIVO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `favorito`
--

CREATE TABLE `favorito` (
  `id` int(11) NOT NULL,
  `estabelecimento_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico`
--

CREATE TABLE `servico` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` float NOT NULL,
  `estabelecimento_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `servico`
--

INSERT INTO `servico` (`id`, `nome`, `valor`, `estabelecimento_id`) VALUES
(3, 'Corte de cabelo', 13, 4),
(4, 'Barba', 5, 4);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `agendamento`
--
ALTER TABLE `agendamento`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `api_token`
--
ALTER TABLE `api_token`
  ADD PRIMARY KEY (`id_api_token`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `dias_funcionamento`
--
ALTER TABLE `dias_funcionamento`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `estabelecimento`
--
ALTER TABLE `estabelecimento`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `favorito`
--
ALTER TABLE `favorito`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `agendamento`
--
ALTER TABLE `agendamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `api_token`
--
ALTER TABLE `api_token`
  MODIFY `id_api_token` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `dias_funcionamento`
--
ALTER TABLE `dias_funcionamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `estabelecimento`
--
ALTER TABLE `estabelecimento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `favorito`
--
ALTER TABLE `favorito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `servico`
--
ALTER TABLE `servico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
