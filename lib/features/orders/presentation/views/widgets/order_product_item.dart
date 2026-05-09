import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/entities/order_product_entity.dart';

class OrderProductItem extends StatelessWidget {
  final OrderProductEntity product;

  const OrderProductItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius:
                BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: product.imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,

              errorWidget:
                  (context, url, error) {
                return Container(
                  width: 60,
                  height: 60,
                  color: Colors.grey.shade300,
                  child: const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                );
              },
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  'Code: ${product.code}',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  '\$${product.price}',
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding:
                const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius:
                  BorderRadius.circular(8),
            ),
            child: Text(
              'x${product.quantity}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}