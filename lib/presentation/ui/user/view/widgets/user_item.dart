import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/data/response/user/user.dart';
import 'package:flutter_boilerplate/presentation/router/app_route.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/app_text_styles.dart';

class UserItem extends StatelessWidget {
  const UserItem({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16.0,
        ),
        GestureDetector(
          onTap: () {
            context.push(
              AppRoute.userDetail.path,
              extra: user.email,
            );
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32.0,
                    backgroundColor: Colors.green,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        user.avatar,
                      ),
                      radius: 30.0,
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.firstName + user.lastName,
                        style: AppTextStyles.highlight,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        user.email,
                        style: AppTextStyles.placeHolder,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
