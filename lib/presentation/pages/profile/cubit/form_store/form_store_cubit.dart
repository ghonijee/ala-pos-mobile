import 'package:ala_pos/domain/models/store/store_category_model.dart';
import 'package:ala_pos/domain/models/store/store_model.dart';
import 'package:ala_pos/domain/repositories/store_repository.dart';
import 'package:ala_pos/presentation/fields/fields.dart';
import 'package:ala_pos/presentation/fields/store_category_field.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'form_store_state.dart';
part 'form_store_cubit.freezed.dart';

@injectable
class FormStoreCubit extends Cubit<FormStoreState> {
  StoreRepository repository;
  late bool isUpdate;
  late List<StoreCategoryModel> listCategory;

  FormStoreCubit(this.repository) : super(FormStoreState(id: 0)) {
    listCategory = repository.getStoreCategory();
  }

  show(StoreModel model) {
    isUpdate = true;
    emit(state.copyWith(
      statusSubmission: FormzStatus.pure,
      id: model.id!,
      storeNameField: StoreNameField.dirty(model.name),
      addressField: AddressField.dirty(model.address!),
      storeCategoryField: StoreCategoryField.dirty(StoreCategoryModel(id: model.storeCategoryId, name: '')),
      phoneField: PhoneField.dirty(model.phone!),
    ));
  }

  submit() async {
    try {
      emit(state.loading());

      var result = await repository.update(state.toModel());

      result.fold((failure) {
        emit(state.copyWith(
          statusSubmission: FormzStatus.submissionFailure,
          message: failure.message,
        ));
      }, (response) {
        emit(state.copyWith(
          message: response.message!,
          statusSubmission: FormzStatus.submissionSuccess,
        ));
      });
    } catch (e) {
      emit(state.copyWith(
        statusSubmission: FormzStatus.submissionFailure,
        message: e.toString(),
      ));
    }
  }

  changeStoreName(value) {
    emit(state.copyWith(storeNameField: StoreNameField.dirty(value)));
  }

  changeAddress(value) {
    emit(state.copyWith(addressField: AddressField.dirty(value)));
  }

  changePhone(value) {
    emit(state.copyWith(phoneField: PhoneField.dirty(value)));
  }

  changeCategory(StoreCategoryModel? model) {
    emit(state.copyWith(storeCategoryField: StoreCategoryField.dirty(model)));
  }
}
