import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Color(0xFFE6EAF3),
            body: Center(
              child: InputForm(),
            ),
    );
  }
}

class InputForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Column (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: <Widget>[

                //Индикация этапа регистрации
                RegisterationStepsPages(),

                //Блок ввода фамилии, имени, и выбора пола
                Container( 
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column (
                    children: <Widget> [

                      EmptySpacer(5),

                      Text(
                          'Укажите данные о себе',
                          style: TextStyle (
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                      ),

                      Text('(это можно сделать и позднее)'),

                      TextField (
                        autofocus: true,
                        decoration: InputDecoration(labelText: "Фамилия"),
                      ),

                      TextField (
                        decoration: InputDecoration(labelText: "Имя"),
                      ),

                      ChooseSexRadio(),

                    ],
                  ),
                ),

                //Блок выбора тренировочного стажа
                Container (
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column (
                    children: <Widget>[
                      
                      Text('Укажите ваш тренировочный стаж',
                          style: TextStyle (
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                      ),

                      EmptySpacer(10),

                      DropList(['Менее 1 года', 'От 1 года до 3 лет', 'От 3 лет до 5 лет', 'От 5 лет до 10 лет', 'Более 10 лет']),

                    ],
                  ),
                ),
                
                //Блок выбора графика тренировок
                Container (
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column (
                    children: <Widget>[
                      Text('Укажите график ваших тренировок',
                            style: TextStyle (
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                            ),
                      ),

                      EmptySpacer(10),

                      SelectTrainingDays(), //Выбор тренировочных дней

                      EmptySpacer(10),

                      SelectTrainingTime(), //Выбор времени суток

                    ],
                  ),
                ),

                //Блок выбора цели тренировок
                Container (
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      Text('Цель ваших тренировок',
                            style: TextStyle (
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                          ),
                      ),

                      EmptySpacer(10),

                      DropList(['Набор мышечной массы', 'Снижение содержания жира', 'Развитие силы и скорости', 'Укрепление сердечно-сосудистой системы', 'Общее укрепление здоровья']),

                    ],
                  ),
                ),
                
                Container (
                          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: FormSubmitButton(),
                ),

              ],
            );
  }
}

//Кнопка завершения регистрации
class FormSubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(
        'Закончить регистрацию',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,    
          color: Color(0xFF0B5D8A),
        ),
      ),
      color: Color(0xFF68A2FE),
      onPressed: (){},
    );
  }
}

// Выбор времени тренировки
class SelectTrainingTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row (
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded (
          child: SelectUnselectBox('Утро', 0xFFFFFFFF, 0xFFE6EAF3, false),
        ),
        Expanded (
          child: SelectUnselectBox('День', 0xFFFFFFFF, 0xFFE6EAF3, false),
        ),
        Expanded (
          child: SelectUnselectBox('Вечер', 0xFFFFFFFF, 0xFFE6EAF3, true),
        ),
      ],
    );
  }
}

// Выбор тренировочных дней
class SelectTrainingDays extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row (
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded (
          child: SelectUnselectBox('Пн', 0xFFFFFFFF, 0xFFE6EAF3, false),
        ),
        Expanded (
          child: SelectUnselectBox('Вт', 0xFFFFFFFF, 0xFFE6EAF3, true),
        ),
        Expanded (
          child: SelectUnselectBox('Ср', 0xFFFFFFFF, 0xFFE6EAF3, false),
        ),
        Expanded (
          child: SelectUnselectBox('Чт', 0xFFFFFFFF, 0xFFE6EAF3, true),
        ),
        Expanded (
          child: SelectUnselectBox('Пт', 0xFFFFFFFF, 0xFFE6EAF3, false),
        ),
        Expanded (
          child: SelectUnselectBox('Сб', 0xFFFFFFFF, 0xFFE6EAF3, true),
        ),
        Expanded (
          child: SelectUnselectBox('Вс', 0xFFFFFFFF, 0xFFE6EAF3, false),
        ),
      ],
    );
  }
}

//Выделить / снять выделение с прямоугольной области.
class SelectUnselectBox extends StatefulWidget {

  String _text;
  bool _isSelected;
  int _selectedColor;
  int _unselectedColor;

  SelectUnselectBox(this._text, this._selectedColor, this._unselectedColor, this._isSelected);

  @override
  _SelectUnselectBoxState createState() => _SelectUnselectBoxState(_text, _selectedColor, _unselectedColor, _isSelected);
}

class _SelectUnselectBoxState extends State<SelectUnselectBox> {

  String _text;
  bool _isSelected;
  int _selectedColor;
  int _unselectedColor;
  int _currentColor;

  _SelectUnselectBoxState(this._text, this._selectedColor, this._unselectedColor, this._isSelected) {
    _currentColor = (_isSelected) ? _selectedColor : _unselectedColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                          border: Border.all(
                                    color: Colors.black,
                                    width: 1.0,
                                  ),
                          color: Color(_currentColor),
                        ),
            height: 40,
            child: FlatButton(
                    child: Text(
                      _text,
                      style: TextStyle(fontSize: 11.0,),
                    ),
                    onPressed: () {
                      setState(() {
                        _currentColor = (_currentColor == _selectedColor) ? _unselectedColor : _selectedColor;
                      }); 
                    },
                   )
          );
  }
}

//Выпадающий список, в конструктор передается массив элементов
class DropList extends StatefulWidget {

  List<String> _items;

  DropList(this._items);

  @override
  _DropListState createState() => _DropListState(_items);
}

class _DropListState extends State<DropList> {

  List<String> _items;
  String _selectedValue;

  _DropListState(this._items) {
    _selectedValue = _items[0];
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
            value: _selectedValue,
            iconSize: 30,
            isExpanded: true,
            isDense: true,
            items: _items.map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            onChanged: (String value) {
              setState(() {
                _selectedValue = value;
              });
            },
    );
  }
}

//Отображение радио переключателей выбора пола
class ChooseSexRadio extends StatefulWidget {
  @override
  _ChooseSexRadioState createState() => _ChooseSexRadioState();
}

class _ChooseSexRadioState extends State<ChooseSexRadio> {

  int _groupValue;

  void _setGroupValue(int e) {
    setState(() {
      if (e == 0) {
        _groupValue = 0;
      } else if (e == 1) {
        _groupValue = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
                children: <Widget>[
                  Text('Пол'),
                  Radio (
                    value: 0,
                    groupValue: _groupValue,
                    onChanged: (int e) => _setGroupValue(e),
                  ),
                  Text('Мужской'),
                  Radio (
                    value: 1,
                    groupValue: _groupValue,
                    onChanged: (int e) => _setGroupValue(e),
                  ),
                  Text('Женский'),

                ],
            );
  }
}

//Вывод цифр этапов регистрации в сроке
class RegisterationStepsPages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Row (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RegistrationStepPage('1', 0xFFE6EAF3),
                    RegistrationStepPage('2', 0xFFE6EAF3),
                    RegistrationStepPage('3', 0xFFE6EAF3),
                    RegistrationStepPage('4', 0xFFE6EAF3),
                    RegistrationStepPage('5', 0xFFAA96FD),
                  ],
            );
  }
}

//Отображение каждой цифры
class RegistrationStepPage extends StatelessWidget {

    final String _text;
    final int _color;

    RegistrationStepPage(this._text, this._color);

    @override
    Widget build(BuildContext context) {
      return  Container (
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Color(_color),
                ),
                margin: const EdgeInsets.only(top: 30.0, left: 14.0, right: 14.0),
                width: 40.00,
                height: 40.00,
                child: Text(
                  _text,
                  style: TextStyle(fontSize: 20.0,),
                ),
              );
    }
}

//Пустой контейнер заданной высоты
class EmptySpacer extends StatelessWidget {

  final double _emptySpace;

  EmptySpacer(this._emptySpace);

  @override
    Widget build(BuildContext context) {
      return  Container (
                height: _emptySpace,
              );
    }

}