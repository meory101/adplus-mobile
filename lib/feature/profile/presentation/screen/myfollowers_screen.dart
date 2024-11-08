import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/injection/injection_container.dart' as di;
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/myfollowers_request_entity.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/myfollowers_cubit/myfollowers_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/myfollowers_cubit/myfollowers_state.dart';

class MyFollowersScreen extends StatelessWidget {
  const MyFollowersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<MyFollowersCubit>()
        ..getMyFollowers(
          context: context,
          entity: MyFollowersRequestEntity(page: 1),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Followers'),
        ),
        body: BlocBuilder<MyFollowersCubit, MyFollowersState>(
          builder: (context, state) {
            if (state.status==CubitStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            
            final followers = state.entity.data?['followers'] as List?;
            
            if (followers == null || followers.isEmpty) {
              return const Center(
                child: Text('No followers yet'),
              );
            }

            return ListView.builder(
              itemCount: followers.length,
              itemBuilder: (context, index) {
                final follower = followers[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(follower.avatar ?? ''),
                  ),
                  title: Text(follower.name ?? 'Unknown'),
                  subtitle: Text(follower.username ?? ''),
                );
              },
            );
          },
        ),
      ),
    );
  }
}