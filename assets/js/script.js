document.addEventListener('DOMContentLoaded', function() {
    const menuLists = document.querySelectorAll('.menu-list, .children');
    
    menuLists.forEach(list => {
        new Sortable(list, {
            group: 'menu',
            animation: 150,
            handle: '.menu-item',
            onEnd: function() {
                updateMenuOrder();
            }
        });
    });
    
    function updateMenuOrder() {
        const sections = document.querySelectorAll('.menu-list');
        const data = [];
        
        sections.forEach(section => {
            const sectionId = section.dataset.sectionId;
            const items = section.querySelectorAll('.menu-item:not(.children .menu-item)');
            
            items.forEach((item, index) => {
                data.push({
                    id: parseInt(item.dataset.itemId),
                    order: index + 1,
                    parent_id: null
                });
                const childrenContainer = item.querySelector('.children');
                if (childrenContainer) {
                    const children = childrenContainer.querySelectorAll('.menu-item');
                    children.forEach((child, childIndex) => {
                        data.push({
                            id: parseInt(child.dataset.itemId),
                            order: childIndex + 1,
                            parent_id: parseInt(item.dataset.itemId)
                        });
                    });
                }
            });
        });
        fetch('/index.php?action=update-order', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ items: data })
        })
        .then(response => response.json())
        .then(data => {
            if (!data.success) {
                console.error('Failed to update order');
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
    }
});
