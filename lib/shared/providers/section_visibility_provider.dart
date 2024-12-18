import 'package:flutter_riverpod/flutter_riverpod.dart';

final sectionVisibilityProvider =
    StateNotifierProvider<SectionVisibilityNotifier, Map<String, bool>>((ref) {
  return SectionVisibilityNotifier();
});

class SectionVisibilityNotifier extends StateNotifier<Map<String, bool>> {
  SectionVisibilityNotifier() : super({});

  void setSectionVisibility(String sectionId, bool isVisible) {
    state = {...state, sectionId: isVisible};
  }

  bool isSectionVisible(String sectionId) {
    return state[sectionId] ?? false;
  }
}