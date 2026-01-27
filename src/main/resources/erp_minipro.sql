-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 27 jan. 2026 à 22:53
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `erp_minipro`
--

-- --------------------------------------------------------

--
-- Structure de la table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `line1` varchar(190) NOT NULL,
  `line2` varchar(190) DEFAULT NULL,
  `city` varchar(120) NOT NULL,
  `postal_code` varchar(30) DEFAULT NULL,
  `country` varchar(120) NOT NULL,
  `is_default` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `addresses`
--

INSERT INTO `addresses` (`id`, `customer_id`, `type`, `line1`, `line2`, `city`, `postal_code`, `country`, `is_default`) VALUES
(1, 1, 'BILLING', '10 Rue A', NULL, 'Montréal', NULL, 'Canada', 1),
(2, 1, 'SHIPPING', '20 Rue B', NULL, 'Montréal', NULL, 'Canada', 1),
(3, 2, 'BILLING', '30 Rue C', NULL, 'Laval', NULL, 'Canada', 1),
(4, 3, 'BILLING', '40 Rue D', NULL, 'Québec', NULL, 'Canada', 1),
(5, 4, 'BILLING', '50 Rue E', NULL, 'Toronto', NULL, 'Canada', 1),
(6, 5, 'BILLING', '60 Rue F', NULL, 'Ottawa', NULL, 'Canada', 1),
(7, 6, 'BILLING', '70 Rue G', NULL, 'Gatineau', NULL, 'Canada', 1),
(8, 7, 'BILLING', '80 Rue H', NULL, 'Sherbrooke', NULL, 'Canada', 1),
(9, 8, 'BILLING', '90 Rue I', NULL, 'Longueuil', NULL, 'Canada', 1),
(10, 9, 'BILLING', '100 Rue J', NULL, 'Brossard', NULL, 'Canada', 1);

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(120) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `code`, `name`, `active`) VALUES
(1, 'CAT-INFO', 'Informatique', 1),
(2, 'CAT-BURE', 'Bureautique', 1),
(3, 'CAT-IMPR', 'Impression', 1),
(4, 'CAT-RESE', 'Réseaux', 1),
(5, 'CAT-MOB', 'Mobilité', 1),
(6, 'CAT-SON', 'Audio', 1),
(7, 'CAT-VID', 'Vidéo', 1),
(8, 'CAT-ACCS', 'Accessoires', 1),
(9, 'CAT-SERV', 'Services', 1),
(10, 'CAT-STOR', 'Stockage', 1);

-- --------------------------------------------------------

--
-- Structure de la table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(190) DEFAULT NULL,
  `phone` varchar(40) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `customers`
--

INSERT INTO `customers` (`id`, `code`, `name`, `email`, `phone`, `active`, `created_at`) VALUES
(1, 'CUST-001', 'Alpha SARL', 'alpha@corp.com', '+1514111111', 1, '2026-01-27 12:56:59'),
(2, 'CUST-002', 'Beta Inc', 'beta@corp.com', '+1514222222', 1, '2026-01-27 12:56:59'),
(3, 'CUST-003', 'Gamma Ltd', 'gamma@corp.com', '+1514333333', 1, '2026-01-27 12:56:59'),
(4, 'CUST-004', 'Delta Corp', 'delta@corp.com', '+1514444444', 1, '2026-01-27 12:56:59'),
(5, 'CUST-005', 'Epsilon', 'epsilon@corp.com', '+1514555555', 1, '2026-01-27 12:56:59'),
(6, 'CUST-006', 'Zeta', 'zeta@corp.com', '+1514666666', 1, '2026-01-27 12:56:59'),
(7, 'CUST-007', 'Eta', 'eta@corp.com', '+1514777777', 1, '2026-01-27 12:56:59'),
(8, 'CUST-008', 'Theta', 'theta@corp.com', '+1514888888', 1, '2026-01-27 12:56:59'),
(9, 'CUST-009', 'Iota', 'iota@corp.com', '+1514999999', 1, '2026-01-27 12:56:59'),
(10, 'CUST-010', 'Kappa', 'kappa@corp.com', '+1514000011', 1, '2026-01-27 12:56:59');

-- --------------------------------------------------------

--
-- Structure de la table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) NOT NULL,
  `invoice_number` varchar(50) NOT NULL,
  `sales_order_id` bigint(20) NOT NULL,
  `status` varchar(30) NOT NULL,
  `issued_at` datetime NOT NULL,
  `due_date` datetime DEFAULT NULL,
  `subtotal` decimal(12,2) NOT NULL,
  `tax_total` decimal(12,2) NOT NULL,
  `grand_total` decimal(12,2) NOT NULL,
  `amount_paid` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_number`, `sales_order_id`, `status`, `issued_at`, `due_date`, `subtotal`, `tax_total`, `grand_total`, `amount_paid`) VALUES
(1, 'INV-2026-00001', 1, 'ISSUED', '2026-01-16 16:45:10', '2026-02-06 16:45:10', 1500.00, 225.00, 1725.00, 0.00),
(2, 'INV-2026-00002', 2, 'PARTIALLY_PAID', '2026-01-18 16:45:10', '2026-02-04 16:45:10', 300.00, 45.00, 335.00, 100.00),
(3, 'INV-2026-00003', 3, 'ISSUED', '2026-01-19 16:45:10', '2026-02-03 16:45:10', 899.00, 134.85, 1033.85, 0.00),
(4, 'INV-2026-00004', 4, 'ISSUED', '2026-01-20 16:45:10', '2026-02-02 16:45:10', 240.00, 36.00, 276.00, 0.00),
(5, 'INV-2026-00005', 5, 'DRAFT', '2026-01-21 16:45:10', NULL, 279.00, 41.85, 320.85, 0.00),
(6, 'INV-2026-00006', 6, 'DRAFT', '2026-01-22 16:45:10', NULL, 149.00, 22.35, 171.35, 0.00),
(7, 'INV-2026-00007', 7, 'PAID', '2026-01-23 16:45:10', '2026-02-06 16:45:10', 1350.00, 202.50, 1502.50, 1502.50),
(8, 'INV-2026-00008', 8, 'PAID', '2026-01-24 16:45:10', '2026-02-06 16:45:10', 120.00, 18.00, 138.00, 138.00),
(9, 'INV-2026-00009', 9, 'PAID', '2026-01-25 16:45:10', '2026-02-06 16:45:10', 199.00, 29.85, 228.85, 228.85),
(10, 'INV-2026-00010', 10, 'CANCELLED', '2026-01-26 16:45:10', NULL, 750.00, 112.50, 862.50, 0.00);

-- --------------------------------------------------------

--
-- Structure de la table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) NOT NULL,
  `warehouse_id` bigint(20) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `locations`
--

INSERT INTO `locations` (`id`, `warehouse_id`, `code`, `name`, `active`) VALUES
(1, 1, 'A-01', 'Rack A1', 1),
(2, 1, 'A-02', 'Rack A2', 1),
(3, 1, 'B-01', 'Rack B1', 1),
(4, 2, 'A-01', 'Rack A1', 1),
(5, 2, 'A-02', 'Rack A2', 1),
(6, 2, 'B-01', 'Rack B1', 1),
(7, 3, 'A-01', 'Rack A1', 1),
(8, 3, 'A-02', 'Rack A2', 1),
(9, 3, 'B-01', 'Rack B1', 1),
(10, 3, 'C-01', 'Rack C1', 1);

-- --------------------------------------------------------

--
-- Structure de la table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) NOT NULL,
  `invoice_id` bigint(20) NOT NULL,
  `method` varchar(30) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `paid_at` datetime NOT NULL,
  `reference` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `payments`
--

INSERT INTO `payments` (`id`, `invoice_id`, `method`, `amount`, `paid_at`, `reference`) VALUES
(1, 2, 'TRANSFER', 100.00, '2026-01-19 16:45:40', 'TRX-0002-A'),
(2, 7, 'CARD', 1502.50, '2026-01-24 16:45:40', 'TRX-0007-A'),
(3, 8, 'MOBILE_MONEY', 138.00, '2026-01-25 16:45:40', 'TRX-0008-A'),
(4, 9, 'CASH', 228.85, '2026-01-26 16:45:40', 'TRX-0009-A'),
(5, 1, 'TRANSFER', 50.00, '2026-01-17 16:45:40', 'TRX-0001-A'),
(6, 3, 'CARD', 20.00, '2026-01-20 16:45:40', 'TRX-0003-A'),
(7, 4, 'CASH', 30.00, '2026-01-21 16:45:40', 'TRX-0004-A'),
(8, 5, 'TRANSFER', 10.00, '2026-01-22 16:45:40', 'TRX-0005-A'),
(9, 6, 'CARD', 15.00, '2026-01-23 16:45:40', 'TRX-0006-A'),
(10, 3, 'TRANSFER', 40.00, '2026-01-24 16:45:40', 'TRX-0003-B');

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL,
  `sku` varchar(80) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `supplier_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `sku`, `name`, `description`, `unit_price`, `active`, `category_id`, `supplier_id`) VALUES
(1, 'SKU-001', 'Laptop Pro', 'PC portable pro', 1350.00, 1, 1, 1),
(2, 'SKU-002', 'Laptop Basic', 'PC portable bureautique', 750.00, 1, 1, 1),
(3, 'SKU-003', 'Imprimante Laser', 'Laser monochrome', 280.00, 1, 3, 9),
(4, 'SKU-004', 'Routeur WiFi', 'Routeur pro', 120.00, 1, 4, 4),
(5, 'SKU-005', 'Smartphone X', 'Téléphone mobile', 899.00, 1, 5, 8),
(6, 'SKU-006', 'Casque Audio', 'Casque antibruit', 199.00, 1, 6, 7),
(7, 'SKU-007', 'Webcam HD', 'Caméra HD', 89.00, 1, 7, 6),
(8, 'SKU-008', 'Clavier Meca', 'Clavier mécanique', 129.00, 1, 8, 2),
(9, 'SKU-009', 'SSD 1To', 'Disque SSD', 149.00, 1, 10, 10),
(10, 'SKU-010', 'Installation IT', 'Service installation', 300.00, 1, 9, 5);

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(4, 'ACCOUNTING'),
(1, 'ADMIN'),
(2, 'SALES'),
(3, 'STOCK');

-- --------------------------------------------------------

--
-- Structure de la table `sales_orders`
--

CREATE TABLE `sales_orders` (
  `id` bigint(20) NOT NULL,
  `order_number` varchar(50) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `status` varchar(30) NOT NULL,
  `order_date` datetime NOT NULL,
  `currency` varchar(10) NOT NULL,
  `subtotal` decimal(12,2) NOT NULL,
  `tax_total` decimal(12,2) NOT NULL,
  `discount_total` decimal(12,2) NOT NULL,
  `grand_total` decimal(12,2) NOT NULL,
  `notes` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `sales_orders`
--

INSERT INTO `sales_orders` (`id`, `order_number`, `customer_id`, `status`, `order_date`, `currency`, `subtotal`, `tax_total`, `discount_total`, `grand_total`, `notes`) VALUES
(1, 'SO-2026-00001', 1, 'CONFIRMED', '2026-01-15 16:43:02', 'CAD', 1500.00, 225.00, 0.00, 1725.00, 'Commande confirmée'),
(2, 'SO-2026-00002', 2, 'CONFIRMED', '2026-01-17 16:43:02', 'CAD', 300.00, 45.00, 10.00, 335.00, 'Remise commerciale'),
(3, 'SO-2026-00003', 3, 'PREPARING', '2026-01-18 16:43:02', 'CAD', 899.00, 134.85, 0.00, 1033.85, 'Préparation en cours'),
(4, 'SO-2026-00004', 4, 'PREPARING', '2026-01-19 16:43:02', 'CAD', 240.00, 36.00, 0.00, 276.00, 'À expédier'),
(5, 'SO-2026-00005', 5, 'CONFIRMED', '2026-01-20 16:43:02', 'CAD', 279.00, 41.85, 0.00, 320.85, 'Commande standard'),
(6, 'SO-2026-00006', 6, 'CONFIRMED', '2026-01-21 16:43:02', 'CAD', 149.00, 22.35, 0.00, 171.35, 'Livraison rapide'),
(7, 'SO-2026-00007', 7, 'SHIPPED', '2026-01-22 16:43:02', 'CAD', 1350.00, 202.50, 50.00, 1502.50, 'Expédiée hier'),
(8, 'SO-2026-00008', 8, 'SHIPPED', '2026-01-23 16:43:02', 'CAD', 120.00, 18.00, 0.00, 138.00, 'Routeur pro'),
(9, 'SO-2026-00009', 9, 'DELIVERED', '2026-01-24 16:43:02', 'CAD', 199.00, 29.85, 0.00, 228.85, 'Livrée'),
(10, 'SO-2026-00010', 10, 'CANCELLED', '2026-01-25 16:43:02', 'CAD', 750.00, 112.50, 0.00, 862.50, 'Annulée par le client');

-- --------------------------------------------------------

--
-- Structure de la table `sales_order_lines`
--

CREATE TABLE `sales_order_lines` (
  `id` bigint(20) NOT NULL,
  `sales_order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `qty` int(11) NOT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  `discount` decimal(12,2) NOT NULL,
  `tax_rate` decimal(5,2) NOT NULL,
  `line_total` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `sales_order_lines`
--

INSERT INTO `sales_order_lines` (`id`, `sales_order_id`, `product_id`, `qty`, `unit_price`, `discount`, `tax_rate`, `line_total`) VALUES
(1, 1, 1, 1, 1350.00, 0.00, 15.00, 1552.50),
(2, 1, 2, 1, 150.00, 0.00, 15.00, 172.50),
(3, 2, 10, 1, 300.00, 10.00, 15.00, 333.50),
(4, 2, 2, 2, 12.50, 0.00, 15.00, 28.75),
(5, 3, 5, 1, 899.00, 0.00, 15.00, 1033.85),
(6, 3, 8, 1, 0.00, 0.00, 0.00, 0.00),
(7, 4, 4, 2, 120.00, 0.00, 15.00, 276.00),
(8, 4, 7, 1, 0.00, 0.00, 0.00, 0.00),
(9, 5, 3, 1, 280.00, 0.00, 15.00, 322.00),
(10, 5, 2, 1, 12.50, 0.00, 15.00, 14.38),
(11, 6, 9, 1, 149.00, 0.00, 15.00, 171.35),
(12, 6, 2, 2, 12.50, 0.00, 15.00, 28.75),
(13, 7, 1, 1, 1350.00, 50.00, 15.00, 1495.00),
(14, 7, 6, 1, 199.00, 0.00, 15.00, 228.85),
(15, 8, 4, 1, 120.00, 0.00, 15.00, 138.00),
(16, 8, 8, 1, 0.00, 0.00, 0.00, 0.00),
(17, 9, 6, 1, 199.00, 0.00, 15.00, 228.85),
(18, 9, 2, 1, 0.00, 0.00, 0.00, 0.00),
(19, 10, 2, 1, 750.00, 0.00, 15.00, 862.50),
(20, 10, 8, 1, 0.00, 0.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Structure de la table `shipments`
--

CREATE TABLE `shipments` (
  `id` bigint(20) NOT NULL,
  `shipment_number` varchar(50) NOT NULL,
  `sales_order_id` bigint(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `shipped_at` datetime DEFAULT NULL,
  `delivered_at` datetime DEFAULT NULL,
  `notes` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `shipments`
--

INSERT INTO `shipments` (`id`, `shipment_number`, `sales_order_id`, `status`, `shipped_at`, `delivered_at`, `notes`) VALUES
(1, 'SH-2026-00001', 1, 'READY', NULL, NULL, 'À expédier'),
(2, 'SH-2026-00002', 2, 'READY', NULL, NULL, 'Préparation'),
(3, 'SH-2026-00003', 3, 'READY', NULL, NULL, 'En attente de picking'),
(4, 'SH-2026-00004', 4, 'READY', NULL, NULL, 'Prête'),
(5, 'SH-2026-00005', 5, 'DRAFT', NULL, NULL, 'Brouillon'),
(6, 'SH-2026-00006', 6, 'DRAFT', NULL, NULL, 'Brouillon'),
(7, 'SH-2026-00007', 7, 'SHIPPED', '2026-01-26 16:44:18', NULL, 'Expédiée'),
(8, 'SH-2026-00008', 8, 'SHIPPED', '2026-01-26 16:44:18', NULL, 'Expédiée'),
(9, 'SH-2026-00009', 9, 'DELIVERED', '2026-01-25 16:44:18', '2026-01-26 16:44:18', 'Livrée'),
(10, 'SH-2026-00010', 10, 'DRAFT', NULL, NULL, 'Commande annulée');

-- --------------------------------------------------------

--
-- Structure de la table `shipment_lines`
--

CREATE TABLE `shipment_lines` (
  `id` bigint(20) NOT NULL,
  `shipment_id` bigint(20) NOT NULL,
  `sales_order_line_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `qty_shipped` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `shipment_lines`
--

INSERT INTO `shipment_lines` (`id`, `shipment_id`, `sales_order_line_id`, `product_id`, `qty_shipped`) VALUES
(1, 1, 1, 1, 1),
(2, 1, 2, 2, 1),
(3, 2, 3, 10, 1),
(4, 2, 4, 2, 2),
(5, 3, 5, 5, 1),
(6, 4, 7, 4, 2),
(7, 5, 9, 3, 1),
(8, 5, 10, 2, 1),
(9, 6, 11, 9, 1),
(10, 6, 12, 2, 2),
(11, 7, 13, 1, 1),
(12, 7, 14, 6, 1);

-- --------------------------------------------------------

--
-- Structure de la table `stock_levels`
--

CREATE TABLE `stock_levels` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `location_id` bigint(20) NOT NULL,
  `qty_on_hand` int(11) NOT NULL,
  `qty_reserved` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `stock_levels`
--

INSERT INTO `stock_levels` (`id`, `product_id`, `location_id`, `qty_on_hand`, `qty_reserved`) VALUES
(1, 1, 1, 50, 0),
(2, 2, 1, 80, 0),
(3, 3, 2, 40, 0),
(4, 4, 2, 60, 0),
(5, 5, 3, 30, 0),
(6, 6, 4, 100, 0),
(7, 7, 5, 70, 0),
(8, 8, 6, 90, 0),
(9, 9, 7, 120, 0),
(10, 10, 8, 20, 0);

-- --------------------------------------------------------

--
-- Structure de la table `stock_moves`
--

CREATE TABLE `stock_moves` (
  `id` bigint(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `qty` int(11) NOT NULL,
  `from_location_id` bigint(20) DEFAULT NULL,
  `to_location_id` bigint(20) DEFAULT NULL,
  `reference_type` varchar(50) DEFAULT NULL,
  `reference_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `stock_reservations`
--

CREATE TABLE `stock_reservations` (
  `id` bigint(20) NOT NULL,
  `sales_order_id` bigint(20) NOT NULL,
  `sales_order_line_id` bigint(20) NOT NULL,
  `location_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `qty_reserved` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `stock_reservations`
--

INSERT INTO `stock_reservations` (`id`, `sales_order_id`, `sales_order_line_id`, `location_id`, `product_id`, `qty_reserved`, `status`, `created_at`) VALUES
(1, 1, 1, 1, 1, 1, 'ACTIVE', '2026-01-15 16:43:50'),
(2, 1, 2, 1, 2, 1, 'ACTIVE', '2026-01-15 16:43:50'),
(3, 2, 3, 8, 10, 1, 'ACTIVE', '2026-01-17 16:43:50'),
(4, 2, 4, 1, 2, 2, 'ACTIVE', '2026-01-17 16:43:50'),
(5, 3, 5, 3, 5, 1, 'ACTIVE', '2026-01-18 16:43:50'),
(6, 4, 7, 2, 4, 2, 'ACTIVE', '2026-01-19 16:43:50'),
(7, 5, 9, 2, 3, 1, 'ACTIVE', '2026-01-20 16:43:50'),
(8, 5, 10, 1, 2, 1, 'ACTIVE', '2026-01-20 16:43:50'),
(9, 6, 11, 7, 9, 1, 'ACTIVE', '2026-01-21 16:43:50'),
(10, 6, 12, 1, 2, 2, 'ACTIVE', '2026-01-21 16:43:50'),
(11, 7, 13, 1, 1, 1, 'CONSUMED', '2026-01-22 16:43:50'),
(12, 7, 14, 4, 6, 1, 'CONSUMED', '2026-01-22 16:43:50'),
(13, 8, 15, 2, 4, 1, 'CONSUMED', '2026-01-23 16:43:50'),
(14, 9, 17, 4, 6, 1, 'CONSUMED', '2026-01-24 16:43:50'),
(15, 10, 19, 1, 2, 1, 'RELEASED', '2026-01-25 16:43:50');

-- --------------------------------------------------------

--
-- Structure de la table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(190) DEFAULT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `suppliers`
--

INSERT INTO `suppliers` (`id`, `code`, `name`, `email`, `phone`, `active`) VALUES
(1, 'SUP-001', 'TechSource', 'contact@techsource.com', '+1514000001', 1),
(2, 'SUP-002', 'LogiGroup', 'sales@logigroup.com', '+1514000002', 1),
(3, 'SUP-003', 'MegaIT', 'info@megait.com', '+1514000003', 1),
(4, 'SUP-004', 'NetPlus', 'contact@netplus.com', '+1514000004', 1),
(5, 'SUP-005', 'OfficePro', 'support@officepro.com', '+1514000005', 1),
(6, 'SUP-006', 'VisionTech', 'sales@visiontech.com', '+1514000006', 1),
(7, 'SUP-007', 'AudioMax', 'contact@audiomax.com', '+1514000007', 1),
(8, 'SUP-008', 'MobileWorld', 'info@mobileworld.com', '+1514000008', 1),
(9, 'SUP-009', 'PrintOne', 'contact@printone.com', '+1514000009', 1),
(10, 'SUP-010', 'DataStore', 'sales@datastore.com', '+1514000010', 1);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `username` varchar(80) NOT NULL,
  `email` varchar(190) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password_hash`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@erp.local', '$2a$10$hash', 'ACTIVE', '2026-01-27 12:56:59', '2026-01-27 12:56:59'),
(2, 'sales1', 'sales1@erp.local', '$2a$10$hash', 'ACTIVE', '2026-01-27 12:56:59', '2026-01-27 12:56:59'),
(3, 'sales2', 'sales2@erp.local', '$2a$10$hash', 'ACTIVE', '2026-01-27 12:56:59', '2026-01-27 12:56:59'),
(4, 'stock1', 'stock1@erp.local', '$2a$10$hash', 'ACTIVE', '2026-01-27 12:56:59', '2026-01-27 12:56:59'),
(5, 'stock2', 'stock2@erp.local', '$2a$10$hash', 'ACTIVE', '2026-01-27 12:56:59', '2026-01-27 12:56:59'),
(6, 'account1', 'account1@erp.local', '$2a$10$hash', 'ACTIVE', '2026-01-27 12:56:59', '2026-01-27 12:56:59'),
(7, 'account2', 'account2@erp.local', '$2a$10$hash', 'ACTIVE', '2026-01-27 12:56:59', '2026-01-27 12:56:59'),
(8, 'user1', 'user1@erp.local', '$2a$10$hash', 'ACTIVE', '2026-01-27 12:56:59', '2026-01-27 12:56:59'),
(9, 'user2', 'user2@erp.local', '$2a$10$hash', 'ACTIVE', '2026-01-27 12:56:59', '2026-01-27 12:56:59'),
(10, 'user3', 'user3@erp.local', '$2a$10$hash', 'DISABLED', '2026-01-27 12:56:59', '2026-01-27 12:56:59');

-- --------------------------------------------------------

--
-- Structure de la table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 3),
(5, 3),
(6, 4),
(7, 4),
(8, 2),
(9, 3),
(10, 2);

-- --------------------------------------------------------

--
-- Structure de la table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` bigint(20) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(150) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `warehouses`
--

INSERT INTO `warehouses` (`id`, `code`, `name`, `active`) VALUES
(1, 'WH-MTL', 'Entrepôt Montréal', 1),
(2, 'WH-QC', 'Entrepôt Québec', 1),
(3, 'WH-TOR', 'Entrepôt Toronto', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_addresses_customer_id` (`customer_id`),
  ADD KEY `idx_addresses_customer_type` (`customer_id`,`type`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Index pour la table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoice_number` (`invoice_number`),
  ADD KEY `idx_invoices_order_id` (`sales_order_id`),
  ADD KEY `idx_invoices_status` (`status`);

--
-- Index pour la table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_locations_warehouse_code` (`warehouse_id`,`code`),
  ADD KEY `idx_locations_warehouse_id` (`warehouse_id`);

--
-- Index pour la table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_payments_invoice_id` (`invoice_id`),
  ADD KEY `idx_payments_paid_at` (`paid_at`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sku` (`sku`),
  ADD KEY `idx_products_category_id` (`category_id`),
  ADD KEY `idx_products_supplier_id` (`supplier_id`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `sales_orders`
--
ALTER TABLE `sales_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_number` (`order_number`),
  ADD KEY `idx_sales_orders_customer_id` (`customer_id`),
  ADD KEY `idx_sales_orders_status` (`status`),
  ADD KEY `idx_sales_orders_order_date` (`order_date`);

--
-- Index pour la table `sales_order_lines`
--
ALTER TABLE `sales_order_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_sol_order_id` (`sales_order_id`),
  ADD KEY `idx_sol_product_id` (`product_id`);

--
-- Index pour la table `shipments`
--
ALTER TABLE `shipments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shipment_number` (`shipment_number`),
  ADD KEY `idx_shipments_order_id` (`sales_order_id`),
  ADD KEY `idx_shipments_status` (`status`);

--
-- Index pour la table `shipment_lines`
--
ALTER TABLE `shipment_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_shipment_lines_product` (`product_id`),
  ADD KEY `idx_shipment_lines_shipment_id` (`shipment_id`),
  ADD KEY `idx_shipment_lines_sol_id` (`sales_order_line_id`);

--
-- Index pour la table `stock_levels`
--
ALTER TABLE `stock_levels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_stock_levels_product_location` (`product_id`,`location_id`),
  ADD KEY `idx_stock_levels_product_id` (`product_id`),
  ADD KEY `idx_stock_levels_location_id` (`location_id`);

--
-- Index pour la table `stock_moves`
--
ALTER TABLE `stock_moves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stock_moves_from_location` (`from_location_id`),
  ADD KEY `fk_stock_moves_to_location` (`to_location_id`),
  ADD KEY `idx_stock_moves_product_id` (`product_id`),
  ADD KEY `idx_stock_moves_created_at` (`created_at`);

--
-- Index pour la table `stock_reservations`
--
ALTER TABLE `stock_reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_stock_res_sales_order_id` (`sales_order_id`),
  ADD KEY `idx_stock_res_line_id` (`sales_order_line_id`),
  ADD KEY `idx_stock_res_location_id` (`location_id`),
  ADD KEY `idx_stock_res_product_id` (`product_id`);

--
-- Index pour la table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `fk_user_roles_role` (`role_id`);

--
-- Index pour la table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `sales_orders`
--
ALTER TABLE `sales_orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `sales_order_lines`
--
ALTER TABLE `sales_order_lines`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `shipments`
--
ALTER TABLE `shipments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `shipment_lines`
--
ALTER TABLE `shipment_lines`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `stock_levels`
--
ALTER TABLE `stock_levels`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `stock_moves`
--
ALTER TABLE `stock_moves`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `stock_reservations`
--
ALTER TABLE `stock_reservations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `fk_addresses_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Contraintes pour la table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `fk_invoices_order` FOREIGN KEY (`sales_order_id`) REFERENCES `sales_orders` (`id`);

--
-- Contraintes pour la table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `fk_locations_warehouse` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Contraintes pour la table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `fk_payments_invoice` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`);

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_products_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `fk_products_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`);

--
-- Contraintes pour la table `sales_orders`
--
ALTER TABLE `sales_orders`
  ADD CONSTRAINT `fk_sales_orders_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Contraintes pour la table `sales_order_lines`
--
ALTER TABLE `sales_order_lines`
  ADD CONSTRAINT `fk_sales_order_lines_order` FOREIGN KEY (`sales_order_id`) REFERENCES `sales_orders` (`id`),
  ADD CONSTRAINT `fk_sales_order_lines_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Contraintes pour la table `shipments`
--
ALTER TABLE `shipments`
  ADD CONSTRAINT `fk_shipments_order` FOREIGN KEY (`sales_order_id`) REFERENCES `sales_orders` (`id`);

--
-- Contraintes pour la table `shipment_lines`
--
ALTER TABLE `shipment_lines`
  ADD CONSTRAINT `fk_shipment_lines_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `fk_shipment_lines_shipment` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`),
  ADD CONSTRAINT `fk_shipment_lines_sol` FOREIGN KEY (`sales_order_line_id`) REFERENCES `sales_order_lines` (`id`);

--
-- Contraintes pour la table `stock_levels`
--
ALTER TABLE `stock_levels`
  ADD CONSTRAINT `fk_stock_levels_location` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  ADD CONSTRAINT `fk_stock_levels_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Contraintes pour la table `stock_moves`
--
ALTER TABLE `stock_moves`
  ADD CONSTRAINT `fk_stock_moves_from_location` FOREIGN KEY (`from_location_id`) REFERENCES `locations` (`id`),
  ADD CONSTRAINT `fk_stock_moves_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `fk_stock_moves_to_location` FOREIGN KEY (`to_location_id`) REFERENCES `locations` (`id`);

--
-- Contraintes pour la table `stock_reservations`
--
ALTER TABLE `stock_reservations`
  ADD CONSTRAINT `fk_stock_res_sales_order` FOREIGN KEY (`sales_order_id`) REFERENCES `sales_orders` (`id`),
  ADD CONSTRAINT `fk_stock_res_sales_order_line` FOREIGN KEY (`sales_order_line_id`) REFERENCES `sales_order_lines` (`id`),
  ADD CONSTRAINT `fk_stock_reservations_location` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  ADD CONSTRAINT `fk_stock_reservations_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Contraintes pour la table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `fk_user_roles_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `fk_user_roles_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
