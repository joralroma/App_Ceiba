import 'package:get/get.dart';
import 'package:flutter/material.dart';

// i18n
import 'package:ceiba/app/i18n/ceiba_localization.dart';

// Models
import 'package:ceiba/app/models/user.dart';
import 'package:ceiba/app/models/error.dart';
import 'package:ceiba/app/models/publication.dart';

// Widgets
import 'home_loader.dart';
import 'publication_item.dart';
import 'header_publications.dart';

// Controller
import 'package:ceiba/app/ui/home/home_controller.dart';

// Utils
import 'package:ceiba/app/utils/modal.dart';
import 'package:ceiba/app/utils/responsive.dart';

class ListPublications extends StatefulWidget {
  
  const ListPublications({
    Key? key,
    required this.user
  }) : super(key: key);

  final User user;

  @override
  State<ListPublications> createState() => _ListPublicationsState();
}

class _ListPublicationsState extends State<ListPublications> {

  final HomeController _homeController = Get.find<HomeController>();

  late final CeibaLocalization _ceibaLocalization;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => _initState()); 
  }

  void _initState() {
    _ceibaLocalization = CeibaLocalization.of(context);
    getListPublications();
  }

  @override
  Widget build(BuildContext context) {

    final Responsive _responsive = Responsive(context);

    return Container(
      height: _responsive.hp(90),
      padding: const EdgeInsets.only(top: 15, right: 10, bottom: 0, left: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(18),
          topLeft: Radius.circular(18)
        )
      ),
      child: Obx(
        () => _homeController.loadingPublications ? const HomeLoader() : SingleChildScrollView(
          child: Column(
            children: [
              HeaderPublications(user: widget.user),
              ..._homeController.publications.map((Publication item) => PublicationItem(publication: item)).toList()
            ]
          ),
        )
      ),
    );
  }

  void getListPublications() async {
    final CeibaError? error = await _homeController.getListPublications(widget.user.id);
    if(error != null) {
      Get.back();
      CeibaModal.showSnackbar(context, '??Error!', _ceibaLocalization.translate(error.message));
    }
  }
}