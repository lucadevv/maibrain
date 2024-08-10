import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maibrain/domain/models/user_model.dart';
import 'package:maibrain/shared/navigation/cubit/navigation_page_cubit.dart';
import 'package:maibrain/shared/res/values/app_colors.dart';
import 'package:maibrain/shared/res/values/app_strings.dart';
import 'package:maibrain/shared/widgets/maibrain_widget.dart';
import 'package:maibrain/ui/bloc/bloc/chat/chat_bloc.dart';
import 'package:maibrain/ui/bloc/bloc/person/person_bloc.dart';
import 'package:maibrain/ui/widgets/container_message_widget.dart';
import 'package:maibrain/ui/widgets/qr_widget.dart';

class PersonWidget extends StatelessWidget {
  const PersonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Align(
          alignment: AlignmentDirectional(0, 0),
          child: MaibrainWidget(),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 8, right: 16, bottom: 32, left: 16),
          child: BlocConsumer<PersonBloc, PersonState>(
            listener: (context, state) {
              if (state.personStatus == PersonStatus.error) {
                Flushbar(
                  title: state.messageError,
                  message: AppStrings.messageError,
                  duration: const Duration(seconds: 3),
                  isDismissible: false,
                  backgroundColor: AppColors.error,
                  flushbarPosition: FlushbarPosition.TOP,
                ).show(context);
              }
            },
            builder: (context, state) {
              final item = state.userModel;
              switch (state.personStatus) {
                case PersonStatus.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case PersonStatus.sucess:
                  return PersonStateSucces(item: item);
                default:
                  return Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Transform.rotate(
                          angle: -1.5708,
                          child: const IconButton(
                            iconSize: 50,
                            onPressed: null,
                            icon: Icon(
                              Icons.send,
                              color: AppColors.tertiary,
                            ),
                          ),
                        ),
                        const QrWidget(),
                        const SizedBox(height: 8),
                        const Text(
                          AppStrings.scanQr,
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  );
              }
            },
          ),
        ),
      ],
    );
  }
}

class PersonStateSucces extends StatelessWidget {
  const PersonStateSucces({
    super.key,
    required this.item,
  });

  final UserModel item;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          item.personName,
          style: textTheme.bodyLarge!.copyWith(
            color: AppColors.onPrimary,
          ),
        ),
        const SizedBox(height: 8),
        CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 30,
          backgroundImage: NetworkImage(item.personPhotoUrl),
        ),
        const SizedBox(height: 8),
        const Align(
          alignment: AlignmentDirectional(-1, 0),
          child: ContainerMessageWidget(
            message: AppStrings.chatMessage,
          ),
        ),
        const Spacer(),
        Transform.rotate(
          angle: -1.5708,
          child: IconButton(
            iconSize: 50,
            onPressed: () {
              context.read<ChatBloc>().add(
                  FetchChatEvent(userId: item.userId, name: item.personName));
              context.read<NavigationPageCubit>().navigateToPge(0);
            },
            icon: const Icon(
              Icons.send,
              color: AppColors.tertiary,
            ),
          ),
        ),
        const SizedBox(height: 8),
        const QrWidget(),
        const SizedBox(height: 8),
        const Text(
          AppStrings.scanQr,
        )
      ],
    );
  }
}
