import 'package:flutter/material.dart';
import '../models/models.dart';
import '../theme/app_theme.dart';
import '../features/shop/domain/entities/store_entity.dart';

class StoreCard extends StatelessWidget {
  final dynamic store; // Accommodates both Store and StoreEntity
  final VoidCallback? onTap;

  const StoreCard({super.key, required this.store, this.onTap});

  @override
  Widget build(BuildContext context) {
    // Extract properties dynamically to handle both Store and StoreEntity
    String id = store.id ?? '';
    String name = store.name ?? '';
    String imageUrl = store.imageUrl ?? '';
    double rating = store.rating ?? 0.0;
    String deliveryTime = store.deliveryTime ?? '';
    double deliveryFee = store.deliveryFee ?? 0.0;
    bool isOpen = store.isOpen ?? _isStoreOpen(store);
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: AppTheme.surfaceColor,
          borderRadius: BorderRadius.circular(20), // Increased border radius for modern look
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero widget for smooth transition to store screen
            Hero(
              tag: 'store_image_${id}',
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.network(
                  imageUrl,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Store name
                    Text(
                      name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppTheme.textPrimary,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    
                    // Store rating and delivery time
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 14,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          ' ${rating}',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppTheme.textSecondary,
                              ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '• ${deliveryTime}',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppTheme.textSecondary,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    
                    // Store status (open/closed) and delivery fee
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Open/Closed indicator
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: isOpen ? AppTheme.openColor.withOpacity(0.1) : AppTheme.closedColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: isOpen ? AppTheme.openColor : AppTheme.closedColor,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                isOpen ? Icons.storefront : Icons.storefront_outlined,
                                color: isOpen ? AppTheme.openColor : AppTheme.closedColor,
                                size: 12,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                isOpen ? 'Aberto' : 'Fechado',
                                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                      color: isOpen ? AppTheme.openColor : AppTheme.closedColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        
                        // Delivery fee
                        Text(
                          'R\$ ${deliveryFee.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppTheme.textSecondary,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  // Helper method to determine if store is open
  bool _isStoreOpen(Store store) {
    // For now, we'll use a simple logic based on hours
    // In a real app, this would check against actual business hours
    return DateTime.now().hour >= 8 && DateTime.now().hour <= 22; // Default 8AM-10PM
  }
}
