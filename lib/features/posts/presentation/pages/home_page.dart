import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// Home page - Main feed of posts from neighbors
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            floating: true,
            backgroundColor: AppColors.background,
            title: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.star_rounded,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 8),
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [AppColors.primary, AppColors.accent],
                  ).createShader(bounds),
                  child: const Text(
                    'El Sueño Comunista',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.notifications_outlined),
                    onPressed: () {},
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          '3',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Search bar
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar en tu barrio...',
                  prefixIcon: const Icon(Icons.search, color: AppColors.textMuted),
                  filled: true,
                  fillColor: AppColors.surfaceGlass,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: AppColors.border),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: AppColors.border),
                  ),
                ),
              ),
            ),
          ),

          // Categories
          SliverToBoxAdapter(
            child: SizedBox(
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  _CategoryChip(icon: '🛠️', label: 'Herramientas', color: AppColors.categoryTools),
                  _CategoryChip(icon: '🥕', label: 'Alimentos', color: AppColors.categoryFood),
                  _CategoryChip(icon: '🚗', label: 'Transporte', color: AppColors.categoryTransport),
                  _CategoryChip(icon: '💼', label: 'Servicios', color: AppColors.categoryServices),
                  _CategoryChip(icon: '🆘', label: 'Ayuda', color: AppColors.categoryHelp),
                ],
              ),
            ),
          ),

          // Section header
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Cerca de ti',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Ver todo'),
                  ),
                ],
              ),
            ),
          ),

          // Feed cards
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _PostCard(
                  userName: 'Carlos Martín',
                  distance: '350m',
                  category: '🛠️',
                  categoryColor: AppColors.categoryTools,
                  title: 'Taladro percutor Bosch disponible',
                  description: 'Lo presto por el fin de semana. Incluye brocas de varios tamaños.',
                  time: 'Hace 2h',
                  buttonText: 'Solicitar',
                ),
                const SizedBox(height: 12),
                _PostCard(
                  userName: 'Ana López',
                  distance: '120m',
                  category: '🥕',
                  categoryColor: AppColors.categoryFood,
                  title: 'Tomates del huerto urbano',
                  description: '¡Cosecha abundante! Regalo 2kg de tomates cherry ecológicos.',
                  time: 'Hace 45min',
                  buttonText: 'Contactar',
                ),
                const SizedBox(height: 12),
                _PostCard(
                  userName: 'Pedro Sánchez',
                  distance: '800m',
                  category: '🚗',
                  categoryColor: AppColors.categoryTransport,
                  title: 'Viaje al Carrefour mañana 10:00',
                  description: 'Voy en coche, tengo 3 plazas libres. Volvemos en 1 hora aprox.',
                  time: 'Hace 3h',
                  buttonText: 'Apuntarme',
                ),
                const SizedBox(height: 12),
                _PostCard(
                  userName: 'Laura García',
                  distance: '200m',
                  category: '🆘',
                  categoryColor: AppColors.categoryHelp,
                  title: '¿Alguien puede pasear a mi perro?',
                  description: 'Este viernes trabajo hasta tarde. Necesito ayuda de 18:00 a 19:00.',
                  time: 'Hace 5h',
                  buttonText: 'Ayudar',
                ),
                const SizedBox(height: 100), // Space for bottom nav
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String icon;
  final String label;
  final Color color;

  const _CategoryChip({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color, color.withOpacity(0.7)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Text(icon, style: const TextStyle(fontSize: 24)),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  final String userName;
  final String distance;
  final String category;
  final Color categoryColor;
  final String title;
  final String description;
  final String time;
  final String buttonText;

  const _PostCard({
    required this.userName,
    required this.distance,
    required this.category,
    required this.categoryColor,
    required this.title,
    required this.description,
    required this.time,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.surfaceElevated,
                child: Text(
                  userName.split(' ').map((e) => e[0]).take(2).join(),
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      '📍 $distance',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: categoryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(category, style: const TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          // Content
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
              height: 1.4,
            ),
          ),
          
          const SizedBox(height: 12),
          
          // Footer
          Container(
            padding: const EdgeInsets.only(top: 12),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: AppColors.border)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textMuted,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  child: Text(buttonText),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
