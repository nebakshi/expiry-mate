import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/extensions/date_extensions.dart';
import '../../../../core/theme/responsive.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/product_enums.dart';
import '../../../../shared/widgets/common_widgets.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, required this.onTap});

  final Product product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isSmall = Responsive.isSmallDevice;
    final thumbSize = isSmall ? 42.0 : 52.0;
    final cardPad = isSmall ? 10.0 : AppSpacing.md;

    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSpacing.radius),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(cardPad),
          child: Row(
            children: [
              _Thumb(product: product, size: thumbSize),
              SizedBox(width: isSmall ? 10.0 : AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.productName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: Responsive.fontSize(15),
                          fontWeight: FontWeight.w700),
                    ),
                    if (product.brand != null &&
                        product.brand!.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(product.brand!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                              fontSize: Responsive.fontSize(12))),
                    ],
                    SizedBox(height: isSmall ? 4 : AppSpacing.sm),
                    Row(
                      children: [
                        StatusBadge(product.status),
                        if (!isSmall) ...[
                          const SizedBox(width: AppSpacing.sm),
                          Icon(product.category.icon,
                              size: 14, color: Theme.of(context).colorScheme.onSurfaceVariant),
                          const SizedBox(width: 4),
                          Flexible(
                            child: Text(product.category.label,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                                    fontSize: 12)),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: isSmall ? 4 : AppSpacing.sm),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    product.expiryDate.displayDate,
                    style: TextStyle(
                        fontSize: Responsive.fontSize(11),
                        color: Theme.of(context).colorScheme.onSurfaceVariant),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.expiryDate.daysLeftLabel,
                    style: TextStyle(
                      fontSize: Responsive.fontSize(12),
                      fontWeight: FontWeight.w700,
                      color: product.status.color,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Thumb extends StatelessWidget {
  const _Thumb({required this.product, this.size = 52});
  final Product product;
  final double size;

  @override
  Widget build(BuildContext context) {
    final url = product.imageUrl;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: size,
        height: size,
        child: (url != null && url.isNotEmpty)
            ? Image.network(
                url,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _fallback(),
                loadingBuilder: (c, child, progress) =>
                    progress == null ? child : _fallback(),
              )
            : _fallback(),
      ),
    );
  }

  Widget _fallback() => Container(
        color: product.category.color(),
        child: Icon(product.category.icon,
            color: AppColors.primary, size: size * 0.5),
      );
}

extension on ProductCategory {
  Color color() => AppColors.primary.withValues(alpha: 0.10);
}
