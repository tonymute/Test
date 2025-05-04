<?php

require_once __DIR__ . '/../models/Section.php';
require_once __DIR__ . '/../models/MenuItem.php';

class MenuController {
    private $db;
    private $sectionModel;
    private $menuItemModel;

    public function __construct() {
        $config = require __DIR__ . '/../config/database.php';
        $this->db = new PDO(
            "mysql:host={$config['host']};dbname={$config['dbname']}", 
            $config['username'], 
            $config['password']
        );
        $this->sectionModel = new Section($this->db);
        $this->menuItemModel = new MenuItem($this->db);
    }

    public function index() {
        $sections = $this->sectionModel->getAll();
        
        foreach ($sections as $section) {
            $section->menuItems = $this->sectionModel->getMenuItems($section->id);
            
            foreach ($section->menuItems as $menuItem) {
                $menuItem->children = $this->menuItemModel->getChildren($menuItem->id);
            }
        }
        
        require __DIR__ . '/../views/menu.php';
    }

    public function updateOrder() {
        header('Content-Type: application/json');
        
        $input = json_decode(file_get_contents('php://input'), true);
        
        if ($this->menuItemModel->updateOrder($input['items'])) {
            echo json_encode(['success' => true]);
        } else {
            echo json_encode(['success' => false]);
        }
    }
}
?>