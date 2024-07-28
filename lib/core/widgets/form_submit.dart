part of 'widgets.dart';

class SubmitState {}

@riverpod
class SubmitForm extends _$SubmitForm {
  @override
  StateOf<SubmitState> build() {
    return const StateOf<SubmitState>.init();
  }

  Future<void> submitForm<T>(Future<T> Function() future) async {
    state = const StateOf<SubmitState>.loading();
    try {
      await future.call();
      state = StateOf<SubmitState>.success(SubmitState());
    } catch (err) {
      state = StateOf<SubmitState>.failure(Exception(err));
    }
  }
}

class SubmitFormWidget<T> extends ConsumerWidget {
  const SubmitFormWidget({
    required this.future,
    super.key,
  });

  final Future<T> Function() future;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final submitState = ref.watch(submitFormProvider);

    if (submitState.isSuccess) return const Text('');

    if (submitState.isFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to submit form')),
      );
    }

    return IconButton(
      onPressed: () {
        if (!submitState.isInit) return;
        ref.watch(submitFormProvider.notifier).submitForm(future);
      },
      icon: submitState.isLoading ? const Spinner() : const Icon(Icons.check),
    );
  }
}
