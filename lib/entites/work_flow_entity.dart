
import 'package:orthalign/entites/header_path_entity.dart';
class WorkFlowEntity
{
  final String value;
  final HeaderPathEntity? headerPath;

  WorkFlowEntity({
    required this.value,
    this.headerPath});
}

//  = const HeaderPathEntity(topPath: "", bottomPath: "");;