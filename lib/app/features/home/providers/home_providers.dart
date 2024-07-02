import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../doctor_appointment/model/doctor_model.dart';
import '../repository/home_repository.dart';
import '../repository/home_repository_impl.dart';

class UpcomingDoctorState {
  final List<DoctorModel> doctors;
  final bool isLoading;
  final String? errorMessage;

  UpcomingDoctorState({
    this.doctors = const [],
    this.isLoading = false,
    this.errorMessage,
  });
}

class UpcomingDoctorNotifier extends StateNotifier<UpcomingDoctorState> {
  final HomeRepository homeRepository;

  UpcomingDoctorNotifier(this.homeRepository) : super(UpcomingDoctorState()) {
    fetchUpcomingDoctors();
  }

  Future<void> fetchUpcomingDoctors() async {
    try {
      state = UpcomingDoctorState(isLoading: true);
      final doctors = await homeRepository.getDoctorUpComingList();
      state = UpcomingDoctorState(doctors: doctors);
    } catch (e) {
      state = UpcomingDoctorState(errorMessage: e.toString());
    }
  }
}

class TopDoctorState {
  final List<DoctorModel> doctors;
  final bool isLoading;
  final String? errorMessage;

  TopDoctorState({
    this.doctors = const [],
    this.isLoading = false,
    this.errorMessage,
  });
}

class TopDoctorNotifier extends StateNotifier<TopDoctorState> {
  final HomeRepository homeRepository;

  TopDoctorNotifier(this.homeRepository) : super(TopDoctorState()){
    fetchTopDoctors();
  }

  Future<void> fetchTopDoctors() async {
    try {
      state = TopDoctorState(isLoading: true);
      final doctors = await homeRepository.getTopDoctorList();
      state = TopDoctorState(doctors: doctors);
    } catch (e) {
      state = TopDoctorState(errorMessage: e.toString());
    }
  }
}

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepositoryImpl();
});

final upcomingDoctorNotifierProvider =
    StateNotifierProvider<UpcomingDoctorNotifier, UpcomingDoctorState>((ref) {
  final homeRepository = ref.watch(homeRepositoryProvider);
  return UpcomingDoctorNotifier(homeRepository);
});

final topDoctorNotifierProvider =
    StateNotifierProvider<TopDoctorNotifier, TopDoctorState>((ref) {
  final homeRepository = ref.watch(homeRepositoryProvider);
  return TopDoctorNotifier(homeRepository);
});
