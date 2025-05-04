<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Многоуровневое меню</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/assets/css/style.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h1>Многоуровневое меню</h1>
        
        <div id="menu-container">
            <?php foreach ($sections as $section): ?>
                <div class="section-title"><?= htmlspecialchars($section->title) ?></div>
                <ul class="menu-list list-group mb-4" data-section-id="<?= $section->id ?>">
                    <?php foreach ($section->menuItems as $item): ?>
                        <?php include 'menu_item.php' ?>
                    <?php endforeach ?>
                </ul>
            <?php endforeach ?>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sortablejs@1.14.0/Sortable.min.js"></script>
    <script src="/assets/js/script.js"></script>
</body>
</html>