import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:give_tour_app/widgets/label_left_widget.dart';
import 'package:give_tour_app/widgets/wdl_widget.dart';

import '../../../widgets/footer_widget.dart';

class TournamentStanding extends StatefulWidget {
  const TournamentStanding({super.key});

  @override
  State<TournamentStanding> createState() => _TournamentStandingState();
}

class _TournamentStandingState extends State<TournamentStanding> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 16, bottom: 32),
                child: LeftLabelWidget(label: 'Ranking Rules'),
              ),
              _explainWDL(),
              SizedBox(
                height: 600,
                child: _table(),
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          fillOverscroll: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              FooterWidget(),
            ],
          ),
        )
      ],
    );
  }

  _explainWDL() {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          WdlWidget.win(),
          WdlWidget.draw(),
          WdlWidget.lose(),
          Text(
            ' = Win - Draw - Lose',
            style: TextStyle(
              fontWeight: FontWeight.w200,
            ),
          )
        ],
      ),
    );
  }

  Widget _table() {
    return DataTable2(
        columnSpacing: 12,
        horizontalMargin: 12,
        minWidth: MediaQuery.of(context).size.width / 2,
        columns: const [
          DataColumn2(
            label: Text('Column A'),
            size: ColumnSize.L,
          ),
          DataColumn(
            label: Text('Column B'),
          ),
          DataColumn(
            label: Text('Column C'),
          ),
          DataColumn(
            label: Text('Column D'),
          ),
          DataColumn(
            label: Text('Column NUMBERS'),
            numeric: true,
          ),
        ],
        rows: List<DataRow>.generate(
            100,
            (index) => DataRow(cells: [
                  DataCell(Text('A' * (10 - index % 10))),
                  DataCell(Text('B' * (10 - (index + 5) % 10))),
                  DataCell(Text('C' * (15 - (index + 5) % 10))),
                  DataCell(Text('D' * (15 - (index + 10) % 10))),
                  DataCell(Text(((index + 0.1) * 25.4).toString()))
                ])));
  }
}
