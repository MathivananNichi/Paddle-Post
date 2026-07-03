import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/error/failures.dart';
import 'package:flutter_base_project/core/widgets/error_view.dart';
import 'package:flutter_base_project/features/auth/presentation/viewmodels/auth_controller.dart';
import 'package:flutter_base_project/features/users/domain/entities/app_user.dart';
import 'package:flutter_base_project/features/users/presentation/viewmodels/users_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// View for the users list. Renders the three states of the async ViewModel
/// (loading / data / error) and offers pull-to-refresh + logout.
class UsersView extends ConsumerWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(usersViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        actions: [
          IconButton(
            tooltip: 'Sign out',
            icon: const Icon(Icons.logout),
            onPressed: () => ref.read(authControllerProvider.notifier).logout(),
          ),
        ],
      ),
      body: usersAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => ErrorView(
          message: error is Failure ? error.message : error.toString(),
          onRetry: () => ref.read(usersViewModelProvider.notifier).refresh(),
        ),
        data: (users) => RefreshIndicator(
          onRefresh: () => ref.read(usersViewModelProvider.notifier).refresh(),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: users.length,
            separatorBuilder: (_, _) => const Divider(height: 1),
            itemBuilder: (context, index) => _UserTile(user: users[index]),
          ),
        ),
      ),
    );
  }
}

class _UserTile extends StatelessWidget {
  const _UserTile({required this.user});

  final AppUser user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl)),
      title: Text(user.fullName),
      subtitle: Text(user.email),
    );
  }
}
