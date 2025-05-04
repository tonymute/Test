<?php

require_once __DIR__ . '/controllers/MenuController.php';

$action = $_GET['action'] ?? 'index';

$controller = new MenuController();

if ($action === 'update-order' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    $controller->updateOrder();
} else {
    $controller->index();
}