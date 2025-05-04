<li class="list-group-item menu-item" data-item-id="<?= $item->id ?>">
    <div class="d-flex justify-content-between align-items-center">
        <span><?= htmlspecialchars($item->title) ?> (<?= htmlspecialchars($item->url) ?>)</span>
        <span class="badge bg-primary rounded-pill"><?= $item->order ?></span>
    </div>
    
    <?php if (!empty($item->children)): ?>
        <ul class="children list-group mt-2">
            <?php foreach ($item->children as $child): ?>
                <li class="list-group-item menu-item" data-item-id="<?= $child->id ?>">
                    <div class="d-flex justify-content-between align-items-center">
                        <span><?= htmlspecialchars($child->title) ?> (<?= htmlspecialchars($child->url) ?>)</span>
                        <span class="badge bg-primary rounded-pill"><?= $child->order ?></span>
                    </div>
                </li>
            <?php endforeach ?>
        </ul>
    <?php endif ?>
</li>