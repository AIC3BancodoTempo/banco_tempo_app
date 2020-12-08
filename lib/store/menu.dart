import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'menu.g.dart';

class MenuSelect = _MenuSelect with _$MenuSelect;

abstract class _MenuSelect with Store {
  @observable
  bool isAdmin = true;
}
