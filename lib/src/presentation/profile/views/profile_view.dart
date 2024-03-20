
import 'package:duka_la_mkononi/src/domain/user/models/User.dart';
import 'package:duka_la_mkononi/src/presentation/profile/cubits/user_cubit.dart';
import 'package:duka_la_mkononi/src/utils/extensions/scroll_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';

import '../../products/views/nav.dart';
import '../widgets/profile_widget.dart';

class ProfileView extends HookWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MediaQuery.of(context).size.width <640? const CustomNavigation():null,
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is RemoteUserSuccess) {
            final user = state.user;
            return ProfilePage(user:user!);
          } else {
            // Handle other states if needed
            return _buildLoadingIndicator();
          }
        },
      ),
    );
  }


  Widget _buildLoadingIndicator() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
  }