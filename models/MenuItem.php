<?php

class MenuItem {
    private $db;
    public $id;
    public $title;
    public $url;
    public $order;
    public $parent_id;
    public $created_at;

    public function __construct($db) {
        $this->db = $db;
    }

    public function getChildren($parentId) {
        $stmt = $this->db->prepare("
            SELECT * FROM menu_items 
            WHERE parent_id = ?
            ORDER BY `order`
        ");
        $stmt->execute([$parentId]);
        return $stmt->fetchAll(PDO::FETCH_OBJ);
    }

    public function updateOrder($items) {
        $this->db->beginTransaction();
        
        try {
            $stmt = $this->db->prepare("
                UPDATE menu_items 
                SET `order` = ?, parent_id = ?
                WHERE id = ?
            ");
            
            foreach ($items as $item) {
                $parentId = isset($item['parent_id']) && $item['parent_id'] ? $item['parent_id'] : null;
                $stmt->execute([$item['order'], $parentId, $item['id']]);
            }
            
            $this->db->commit();
            return true;
        } catch (Exception $e) {
            $this->db->rollBack();
            return false;
        }
    }
}
?>