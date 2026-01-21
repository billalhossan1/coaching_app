import 'package:football_coaching_coach_app/view/screen/home/profile/model/my_applicaitons_model.dart';
import 'package:get/get.dart';

import '../../../../../../utils/ToastMsg/toast_message.dart';
import '../../repo/profile_repo.dart';

class MyApplicationController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoadingMore = false.obs;
  RxInt currentPage = 1.obs;
  RxInt totalPage = 1.obs;
  RxBool hasMore = true.obs;

  @override
  void onInit() {
    getMyApplications();
    super.onInit();
  }

  RxList<ApplicationCard> applicationsList = RxList<ApplicationCard>([]);

  Future<void> getMyApplications({int page = 1}) async {
    if (page == 1) {
      isLoading.value = true;
    }

    // Fetch data from the repository
    Response response = await ProfileRepo().getMyApplications(page: page);

    if (page == 1) {
      isLoading.value = false;
    }

    if (response.statusCode == 200) {
      GetMyApplicationsModel getMyApplicationsModel =
          GetMyApplicationsModel.fromJson(response.body);
      totalPage.value = getMyApplicationsModel.pagination?.totalPage ?? 1;
      currentPage.value = page;

      if (page == 1) {
        applicationsList.clear(); // Clear list if we're on the first page
      }

      applicationsList.addAll(getMyApplicationsModel.applicationList ?? []);

      // Check if there are more pages
      hasMore.value = currentPage.value < totalPage.value;
    } else {
      showCustomSnackBar(response.statusText ?? "Something went wrong");
    }
  }

  Future<void> loadMore() async {
    if (isLoadingMore.value || !hasMore.value) return;

    isLoadingMore.value = true;
    await getMyApplications(page: currentPage.value + 1);
    isLoadingMore.value = false;
  }

  Future<void> refresh() async {
    currentPage.value = 1;
    hasMore.value = true;
    await getMyApplications(page: 1);
  }
}
