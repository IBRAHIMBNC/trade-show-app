import 'package:get/get.dart';
import 'package:supplier_snap/app/modules/notes/data/models/note_model.dart';
import 'package:supplier_snap/app/modules/notes/data/repository/notes_repository.dart';
import 'package:supplier_snap/app/modules/supplier/presentation/supplier_detail/supplier_detail_controller.dart';
import 'package:supplier_snap/app/routes/app_pages.dart';

class NotesListingController extends GetxController {
  final NotesRepository notesRepository;
  NotesListingController({required this.notesRepository});

  final RxList<NoteModel> notes = RxList<NoteModel>();

  final int supplierId = Get.find<SupplierDetailController>().supplier.id!;

  addEditNote([NoteModel? note]) async {
    Get.toNamed(Routes.NOTE_DETAILS, arguments: note);
  }

  @override
  void onInit() {
    notes.bindStream(notesRepository.watchNotesBySupplierId(supplierId));
    super.onInit();
  }
}
