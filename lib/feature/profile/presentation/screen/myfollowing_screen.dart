import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/injection/injection_container.dart' as di;
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/myfolloweing_request_entity.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/myfollowing_cubit/myfollowing_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/myfollowing_cubit/myfollowing_state.dart';
import '../../../../core/resource/color_manager.dart';

class MyFollowingScreen extends StatelessWidget {
  const MyFollowingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<MyFollowingCubit>()
        ..getMyFollowing(
          context: context,
          entity: MyFollowingRequestEntity(page: 1),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Following'),
          backgroundColor: AppColorManager.textAppColor,
        ),
        body: BlocBuilder<MyFollowingCubit, MyFollowingState>(
          builder: (context, state) {
            if (state.status==CubitStatus.loading) {
              return const CircularProgressIndicator();
            }

            if (state.status==CubitStatus.error) {
              return Center(
                child: Text(state.error),
              );
            }

            final following = state.entity.data?['following'] as List?;
            
            if (following == null || following.isEmpty) {
              return const Center(
                child: Text('You are not following anyone yet'),
              );
            }

            return ListView.builder(
              itemCount: following.length,
              itemBuilder: (context, index) {
                final user = following[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user['avatar'] ?? ''),
                  ),
                  title: Text(user['name'] ?? 'Unknown'),
                  subtitle: Text(user['username'] ?? ''),
                );
              },
            );
          },
        ),
      ),
    );
  }
}