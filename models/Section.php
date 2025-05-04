<?php

class Section {
    private $db;
    public $id;
    public $title;
    public $created_at;

    public function __construct($db) {
        $this->db = $db;
    }

    public function getAll() {
        $stmt = $this->db->query("SELECT * FROM sections ORDER BY id");
        return $stmt->fetchAll(PDO::FETCH_OBJ);
    }

    public function getMenuItems($sectionId) {
        $stmt = $this->db->prepare("
            SELECT mi.* FROM menu_items mi
            JOIN menu_item_section mis ON mi.id = mis.menu_item_id
            WHERE mis.section_id = ? AND mi.parent_id IS NULL
            ORDER BY mi.`order`
        ");
        $stmt->execute([$sectionId]);
        return $stmt->fetchAll(PDO::FETCH_OBJ);
    }
}
?>