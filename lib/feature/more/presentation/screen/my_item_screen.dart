import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/resource/constant_manager.dart';
import 'package:mzad_damascus/core/widget/app_bar/main_app_bar.dart';
import 'package:mzad_damascus/core/widget/image/main_image_widget.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/cubit_status_manager.dart';
import '../cubit/myitem_cubit/myitem_cubit.dart';
import '../cubit/myitem_cubit/myitem_state.dart';
import '../../domain/entity/request/myitem_request_entity.dart';
import '../../domain/entity/response/myitems_response_entity.dart';

class MyItemsScreen extends StatefulWidget {
  const MyItemsScreen({Key? key}) : super(key: key);

  @override
  State<MyItemsScreen> createState() => _MyItemsScreenState();
}

class _MyItemsScreenState extends State<MyItemsScreen> {
  final List<String> _filters = ['All', 'Active', 'Favourite', 'End'];
  int _selectedFilterIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() {
    context.read<MyitemCubit>().myitem(
          context: context,
          entity: MyItemRequestEntity(
            page: 1,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "My Ads"),
      body: BlocConsumer<MyitemCubit, MyitemState>(
        listener: (context, state) {
          if (state.status == CubitStatus.error && state.error.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              _buildFilterButtons(),
              Expanded(
                child: _buildItemsList(state),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFilterButtons() {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _filters.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(_filters[index]),
              selected: _selectedFilterIndex == index,
              onSelected: (selected) {
                setState(() {
                  _selectedFilterIndex = index;
                });
                _loadItems();
              },
              backgroundColor: Colors.grey.shade100,
              selectedColor: AppColorManager.black.withOpacity(0.1),
              labelStyle: TextStyle(
                color: _selectedFilterIndex == index
                    ? AppColorManager.background
                    : Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildItemsList(MyitemState state) {
    if (state.status == CubitStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    final items = state.entity.data?.data ?? [];

    if (items.isEmpty) {
      return const Center(
        child: Text('لا توجد إعلانات حالياً'),
      );
    }

    return RefreshIndicator(
      onRefresh: () async => _loadItems(),
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, index) => _buildItemCard(items[index]),
      ),
    );
  }

  Widget _buildItemCard(Item item) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildItemImage(item),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${item.startingPrice ?? 0} ر.س',
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatItem(Icons.remove_red_eye,
                          item.author?.length ?? 0, 'مشاهدة'),
                      _buildStatItem(
                          Icons.favorite, item.reactions?.length ?? 0, 'إعجاب'),
                      _buildStatItem(
                          Icons.comment, item.comments?.length ?? 0, 'تعليق'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemImage(Item item) {
    if (item.photos == null || item.photos!.isEmpty) {
      return _buildPlaceholderImage();
    }

    final photoUrl = item.photos!.first.photo;
    if (photoUrl == null || photoUrl.isEmpty) {
      return _buildPlaceholderImage();
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: 100,
        height: 100,
        child: MainImageWidget(
          imageUrl: AppConstantManager.imageBaseUrl + photoUrl,
        ),
      ),
    );
  }

  Widget _buildPlaceholderImage() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Icon(
          Icons.image_not_supported,
          color: Colors.grey,
          size: 32,
        ),
      ),
    );
  }

  Widget _buildStatItem(IconData icon, int count, String label) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        Text(
          '$count $label',
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
   }
}
