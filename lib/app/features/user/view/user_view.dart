import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widget/user_widget.dart';

class UserView extends ConsumerWidget {
  /// TODO add your comment here
  const UserView({Key? key}) : super(key: key);

  static const routeName = '/user';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const UserWidget();
  }
}
