import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:maibrain/shared/res/values/app_colors.dart';
import 'package:maibrain/shared/res/values/app_strings.dart';
import 'package:maibrain/shared/widgets/maibrain_widget.dart';
import 'package:maibrain/ui/bloc/bloc/chat/chat_bloc.dart';
import 'package:maibrain/ui/widgets/container_message_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController formMessage = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                const Align(child: MaibrainWidget()),
                BlocBuilder<ChatBloc, ChatState>(
                  builder: (context, state) {
                    final listKenlow = state.listMessage;

                    if (listKenlow.isEmpty) {
                      return const SizedBox.shrink();
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 8, right: 16, bottom: 32, left: 16),
                        child: ListView.builder(
                          itemCount: listKenlow.length,
                          itemBuilder: (context, index) {
                            final item = listKenlow[index];

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Align(
                                alignment: index % 2 == 0
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: ContainerMessageWidget(
                                  message: item,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
          Container(
            color: AppColors.primary,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: formMessage,
                    style: const TextStyle(
                      color: AppColors.onSeconday,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.secondary,
                      hintText: AppStrings.hintKeyboard,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.read<ChatBloc>().add(
                          InitChatEnvet(
                            promtMessage: formMessage.text.trim(),
                          ),
                        );
                    formMessage.clear();
                  },
                  icon: const Icon(
                    Icons.send,
                    color: AppColors.tertiary,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
