import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maibrain/shared/res/values/app_colors.dart';
import 'package:maibrain/ui/bloc/bloc/chat/chat_bloc.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        if (state.chatStatus == ChatStatus.connecting) {
          return AppBar(
            centerTitle: true,
            title: const CircularProgressIndicator(),
          );
        } else if (state.chatStatus == ChatStatus.connected) {
          return AppBar(
            centerTitle: false,
            title: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(state.personModel.photoUrl),
                  backgroundColor: Colors.grey,
                ),
                const SizedBox(width: 8),
                Text(
                  state.personModel.name,
                  style: textTheme.displayMedium!.copyWith(
                    color: AppColors.onSeconday,
                  ),
                ),
              ],
            ),
          );
        } else if (state.chatStatus == ChatStatus.error) {
          return AppBar(
            centerTitle: true,
            title: Text(
              "Error",
              style: textTheme.displayMedium!.copyWith(
                color: AppColors.onSeconday,
              ),
            ),
          );
        } else {
          return AppBar(
            centerTitle: true,
            title: Text(
              "Maibrain",
              style: textTheme.displayMedium!.copyWith(
                color: AppColors.onSeconday,
              ),
            ),
          );
        }
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
