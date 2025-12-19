/**
 * El Sueño Comunista - App JavaScript
 * Navigation and interactions
 */

document.addEventListener('DOMContentLoaded', () => {
    initNavigation();
    initPostTypeSelector();
    initCardInteractions();
});

/**
 * Initialize bottom navigation
 */
function initNavigation() {
    const navItems = document.querySelectorAll('.nav-item');
    const screens = document.querySelectorAll('.screen');
    
    navItems.forEach(item => {
        item.addEventListener('click', () => {
            const targetScreen = item.dataset.screen;
            
            // Update active nav item
            navItems.forEach(nav => nav.classList.remove('active'));
            item.classList.add('active');
            
            // Show target screen
            screens.forEach(screen => {
                screen.classList.remove('active');
                if (screen.id === `screen-${targetScreen}`) {
                    screen.classList.add('active');
                }
            });
            
            // Haptic feedback simulation (visual)
            item.style.transform = 'scale(0.95)';
            setTimeout(() => {
                item.style.transform = '';
            }, 100);
        });
    });
}

/**
 * Initialize post type selector (Ofrezco/Necesito)
 */
function initPostTypeSelector() {
    const postTypes = document.querySelectorAll('.post-type');
    
    postTypes.forEach(type => {
        type.addEventListener('click', () => {
            postTypes.forEach(t => t.classList.remove('active'));
            type.classList.add('active');
        });
    });
}

/**
 * Initialize card interactions
 */
function initCardInteractions() {
    // Card buttons
    const cardButtons = document.querySelectorAll('.card .btn-primary');
    
    cardButtons.forEach(btn => {
        btn.addEventListener('click', (e) => {
            e.stopPropagation();
            
            const originalText = btn.textContent;
            btn.textContent = '✓ Enviado';
            btn.style.background = 'linear-gradient(135deg, #16A34A, #166534)';
            
            setTimeout(() => {
                btn.textContent = originalText;
                btn.style.background = '';
            }, 2000);
        });
    });
    
    // Category cards hover effect
    const categoryCards = document.querySelectorAll('.category-card');
    
    categoryCards.forEach(card => {
        card.addEventListener('click', () => {
            card.style.transform = 'scale(0.98)';
            setTimeout(() => {
                card.style.transform = '';
            }, 150);
        });
    });
    
    // Message items
    const messageItems = document.querySelectorAll('.message-item');
    
    messageItems.forEach(item => {
        item.addEventListener('click', () => {
            item.classList.remove('unread');
            const badge = item.querySelector('.unread-badge');
            if (badge) {
                badge.style.display = 'none';
            }
        });
    });
}

/**
 * Form submission prevention (demo only)
 */
document.querySelector('.new-post-form')?.addEventListener('submit', (e) => {
    e.preventDefault();
    
    const submitBtn = e.target.querySelector('.btn-submit');
    const originalText = submitBtn.textContent;
    
    submitBtn.textContent = 'Publicando...';
    submitBtn.disabled = true;
    
    setTimeout(() => {
        submitBtn.textContent = '✓ Publicado';
        submitBtn.style.background = 'linear-gradient(135deg, #16A34A, #166534)';
        
        setTimeout(() => {
            submitBtn.textContent = originalText;
            submitBtn.style.background = '';
            submitBtn.disabled = false;
            e.target.reset();
            
            // Navigate to home
            document.querySelector('[data-screen="home"]').click();
        }, 1500);
    }, 1000);
});
