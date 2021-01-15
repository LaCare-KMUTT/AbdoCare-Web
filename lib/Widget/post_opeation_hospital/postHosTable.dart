import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_table/responsive_table.dart';

import '../../services/interfaces/firebase_service_interface.dart';
import '../../services/service_locator.dart';

class PostHosTable extends StatefulWidget {
  PostHosTable({Key key}) : super(key: key);
  @override
  _PostHosTableState createState() => _PostHosTableState();
}

class _PostHosTableState extends State<PostHosTable> {
  final IFirebaseService _firebaseService = locator<IFirebaseService>();

  List<DatatableHeader> _headers = [
    DatatableHeader(
        text: "HN",
        value: "hn",
        show: true,
        sortable: true,
        textAlign: TextAlign.center),
    DatatableHeader(
        text: "ชื่อ-นามสกุล",
        value: "name",
        show: true,
        flex: 2,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "เพศ",
        value: "sex",
        show: true,
        sortable: true,
        textAlign: TextAlign.center),
    DatatableHeader(
        text: "อายุ",
        value: "age",
        show: true,
        sortable: true,
        textAlign: TextAlign.center),
    DatatableHeader(
        text: "ห้อง",
        value: "room",
        show: true,
        sortable: true,
        textAlign: TextAlign.center),
    DatatableHeader(
        text: "เตียง",
        value: "bed",
        show: true,
        sortable: true,
        textAlign: TextAlign.center),
    DatatableHeader(
        text: "อุณหภูมิ",
        value: "t",
        show: true,
        sortable: true,
        textAlign: TextAlign.center),
    DatatableHeader(
        text: "อัตรา\nการหายใจ",
        value: "r",
        show: true,
        sortable: true,
        textAlign: TextAlign.center),
    DatatableHeader(
        text: "ชีพจร",
        value: "hr",
        show: true,
        sortable: true,
        textAlign: TextAlign.center),
    DatatableHeader(
        text: "ความดัน",
        value: "bp",
        show: true,
        sortable: true,
        textAlign: TextAlign.center),
    DatatableHeader(
        text: "ออกซิเจน",
        value: "o2",
        show: true,
        sortable: true,
        textAlign: TextAlign.center),
    DatatableHeader(
        text: "สถานะ",
        value: "status",
        show: true,
        sortable: true,
        textAlign: TextAlign.center),
  ];

  List<int> _perPages = [5, 10, 15, 100];
  int _total = 10; // total patient
  int _currentPerPage;
  int _currentPage = 1;
  bool _isSearch = false;
  List<Map<String, dynamic>> _source = List<Map<String, dynamic>>();

  List<Map<String, dynamic>> _selecteds = List<Map<String, dynamic>>();
  //String _selectableKey = "id";

  String _sortColumn;
  bool _sortAscending = true;
  bool _isLoading = true;
  bool _showSelect = false;

  Future<List<Map<String, dynamic>>> _generateData({int n: 100}) async {
    final postHosList = await _firebaseService.getPostHosList();
    return postHosList;
  }

  _initData() async {
    setState(() => _isLoading = true);
    Future.delayed(Duration(seconds: 3)).then((value) async {
      var a = await _generateData(n: 1000);
      _source.addAll(a);
      setState(() => _isLoading = false);
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(0),
              constraints: BoxConstraints(
                maxHeight: 700,
              ),
              child: Card(
                elevation: 1,
                shadowColor: Colors.black,
                clipBehavior: Clip.none,
                child: ResponsiveDatatable(
                  actions: [
                    if (_isSearch)
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: IconButton(
                                icon: Icon(Icons.cancel),
                                onPressed: () {
                                  setState(() {
                                    _isSearch = false;
                                  });
                                }),
                            suffixIcon: IconButton(
                                icon: Icon(Icons.search), onPressed: () {})),
                      )),
                    if (!_isSearch)
                      IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            setState(() {
                              _isSearch = true;
                            });
                          })
                  ],
                  headers: _headers,
                  source: _source,
                  selecteds: _selecteds,
                  showSelect: _showSelect,
                  autoHeight: false,
                  onTabRow: (data) {
                    Navigator.pushNamed(context, '/dashboard_postHos');
                    print(data);
                  },
                  onSort: (value) {
                    setState(() {
                      _sortColumn = value;
                      _sortAscending = !_sortAscending;
                      if (_sortAscending) {
                        _source.sort((a, b) =>
                            b["$_sortColumn"].compareTo(a["$_sortColumn"]));
                      } else {
                        _source.sort((a, b) =>
                            a["$_sortColumn"].compareTo(b["$_sortColumn"]));
                      }
                    });
                  },
                  sortAscending: _sortAscending,
                  sortColumn: _sortColumn,
                  isLoading: _isLoading,
                  onSelect: (value, item) {
                    print("$value  $item ");
                    if (value) {
                      setState(() => _selecteds.add(item));
                    } else {
                      setState(
                          () => _selecteds.removeAt(_selecteds.indexOf(item)));
                    }
                  },
                  onSelectAll: (value) {
                    if (value) {
                      setState(() => _selecteds =
                          _source.map((entry) => entry).toList().cast());
                    } else {
                      setState(() => _selecteds.clear());
                    }
                  },
                  footers: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text("Rows per page:"),
                    ),
                    if (_perPages != null)
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: DropdownButton(
                            value: _currentPerPage,
                            items: _perPages
                                .map((e) => DropdownMenuItem(
                                      child: Text("$e"),
                                      value: e,
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _currentPerPage = value;
                              });
                            }),
                      ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child:
                          Text("$_currentPage - $_currentPerPage of $_total"),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 16,
                      ),
                      onPressed: () {
                        setState(() {
                          _currentPage =
                              _currentPage >= 2 ? _currentPage - 1 : 1;
                        });
                      },
                      padding: EdgeInsets.symmetric(horizontal: 15),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios, size: 16),
                      onPressed: () {
                        setState(() {
                          _currentPage++;
                        });
                      },
                      padding: EdgeInsets.symmetric(horizontal: 15),
                    )
                  ],
                ),
              ),
            ),
          ])),
    );
  }
}
