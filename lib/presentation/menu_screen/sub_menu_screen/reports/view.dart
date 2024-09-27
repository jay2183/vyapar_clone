import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'gst_reports/gst-1.dart';
import 'gst_reports/gst-2.dart';
import 'gst_reports/gst-r3b.dart';
import 'gst_reports/gst-trasaction-report.dart';
import 'gst_reports/gst_r_9_report.dart';
import 'gst_reports/sac_report.dart';
import 'gst_reports/sale_summary.dart';


class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Reports'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Action for search
            },
          ),
        ],
        backgroundColor: Colors.blue.shade50,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 18),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // First Category - Transaction
          const Text(
            'Transaction',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('Sale Report', context, () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => Text("data"),
            //   ),
            // );
          }),
          buildSubItem('Purchase Report', context, () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => PurchaseReport(),
            //   ),
            // );
          }),
          buildSubItem('Day Book', context, () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => DayBook(),
            //   ),
            // );
          }),
          buildSubItem('All Transactions', context, () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => AllTransaction(),
            //   ),
            // );
          }),
          buildSubItemWithIcon(
              'Bill Wise Profit', context, Icons.info_outline, () {}),
          buildSubItem('Profit & Loss', context, () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => ProfitAndLossReoprt(),
            //   ),
            // );
          }),
          buildSubItem('Cashflow', context, () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => CashFlowReportReport(),
            //   ),
            // );
          }),
          buildSubItemWithIcon(
              'Balance Sheet', context, Icons.info_outline, () {}),

          const SizedBox(height: 30),

          // Second Category - Party Reports
          const Text(
            'Party reports',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('Party Statement', context, () {}),
          buildSubItemWithIcon(
              'Party Wise Profit & Loss',
              context,
              Icons.info_outline,
              color: Colors.yellow,
              () {}),
          buildSubItem('All Parties Report', context, () {}),
          buildSubItem('Party Report by Items', context, () {}),
          buildSubItem('Sale/Purchase by Party', context, () {}),

          const SizedBox(height: 30),

          // Third Category - GST Reports
          const Text(
            'GST repots',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('GST-1', context, () => Get.to(()=>Gst1Screen())),
          buildSubItem('GST-2', context, () => Get.to(()=>Gst2Screen())),
          buildSubItem('GSTR-3B', context, () => Get.to(()=>GstR3bScreen())),
          buildSubItem('GST Transction report', context, () => Get.to(()=>GstTrasactionReportScreen())),
          buildSubItem('GSTR-9', context, () => Get.to(()=>GstR9ReportScreen())),
          buildSubItem('Sale Summary by HSN', context,()=> Get.to( () =>SaleSummaryScreen())),
          buildSubItem('SAC Report', context, () => Get.to(()=>SacReportScreen())),

          //Forth  Category - Item/Stock Reports

          const Text(
            'Item/Stock reports',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('Stock Summary Report', context, () {}),
          buildSubItem('Item Report by Party ', context, () {}),
          buildSubItem('Item Wise Profit & Loss', context, () {}),
          buildSubItem('Low Stock Summary Report', context, () {}),

          buildSubItem('Item Detail Report', context, () {}),
          buildSubItem('Stock Detail Report', context, () {}),
          buildSubItem('Sale/Purchase By Item Category', context, () {}),
          buildSubItem('Stock summary By Item Category', context, () {}),
          buildSubItemWithIcon(
              'Item Batch Report', context, Icons.info_outline, () {}),
          buildSubItemWithIcon(
              'Item Serial Report', context, Icons.info_outline, () {}),
          buildSubItem('Item Wise Discount', context, () {}),
          const SizedBox(height: 30),

          //Fifth  Category -  Business status

          const Text(
            'Business status',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('Bank Statement', context, () {}),
          buildSubItem('Discount Report', context, () {}),

          const SizedBox(height: 30),

          //Sixth  Category -  Taxes

          const Text(
            'Taxes',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('GST Report', context, () {}),
          buildSubItem('GST Rate Report', context, () {}),
          buildSubItem('Form No. 27EQ', context, () {}),
          buildSubItem('TCS Receivable', context, () {}),

          buildSubItem('TDS Payable', context, () {}),
          buildSubItem('TDS Receivable', context, () {}),

          const SizedBox(height: 30),

          //Seventh Category -  Expense report

          const Text(
            'Expense report',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('Expense Transaction Report', context, () {}),
          buildSubItem('Expense Category Report', context, () {}),
          buildSubItem('Expense Item Report', context, () {}),

          const SizedBox(height: 30),

          //Eight Category -  Sale/Purchase Order report

          const Text(
            'Sale/Purchase Order report',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem(
              'Sale/Purchase Order Transaction Report', context, () {}),
          buildSubItem('Sale/Purchase Order Item Report', context, () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => SalePurchaseOrderItemReport(),
            //   ),
            // );
          }),

          const SizedBox(height: 30),

          //Nineth Category -  Loan report

          const Text(
            'Loan Report',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('Loan Statement', context, () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => LoanStatementScreen(),
            //   ),
            // );
          }),

          const SizedBox(height: 30),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget buildSubItem(String title, BuildContext context, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
    );
  }

  Widget buildSubItemWithIcon(
      String title, BuildContext context, IconData icon, VoidCallback onTap,
      {Color color = Colors.grey}) {
    return GestureDetector(
      onTap: () {
        onTap;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(width: 5),
            Icon(icon, size: 16, color: color),
          ],
        ),
      ),
    );
  }
}