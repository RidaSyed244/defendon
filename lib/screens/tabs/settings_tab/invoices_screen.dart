import 'package:defendon/models/invoice_model.dart';
import 'package:defendon/utils/extensions.dart';
import 'package:defendon/utils/padding_extensions.dart';
import 'package:defendon/utils/widget_utility_extensions.dart';
import 'package:defendon/widgets/primary_outline_card.dart';
import 'package:defendon/widgets/primary_section_header_widget.dart';
import 'package:flutter/material.dart';

class InvoicesScreen extends StatelessWidget {
  const InvoicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Invoices',
        ),
        centerTitle: false,
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimarySearchBar(
                hintText: "Search a invoice",
                onSearch: (query) {},
              ),
              10.heightBox,
              const InvoiceTableHeader(),
              20.heightBox,
              Expanded(
                child: ListView.builder(
                  itemCount: invoices.length,
                  itemBuilder: (context, index) {
                    return InvoiceCard(
                      invoice: invoices[index],
                    );
                  },
                ),
              ),
            ],
          ).p16().safeArea(),
        ],
      ),
    );
  }

  static List<InvoiceData> invoices = [
    InvoiceData(
      id: "#2345",
      date: "12 jan 2023",
      amount: "60£",
      status: "UNPAID",
    ),
    InvoiceData(
      id: "#2345",
      date: "12 jan 2023",
      amount: "60£",
      status: "UNPAID",
    ),
    InvoiceData(
      id: "#2345",
      date: "12 jan 2023",
      amount: "\$330",
      status: "UNPAID",
    ),
  ];
}

class InvoiceTableHeader extends StatelessWidget {
  const InvoiceTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryOutlinedCard(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      backgroundColor: Colors.white,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              "Invoice ID",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              "Billing Date",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              "Amount",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              "Status",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InvoiceCard extends StatelessWidget {
  final InvoiceData invoice;

  const InvoiceCard({
    super.key,
    required this.invoice,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryOutlinedCard(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      backgroundColor: Colors.white,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              invoice.id,
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              invoice.date,
              style: const TextStyle(
                fontSize: 11,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              invoice.amount,
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "View",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.green[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                2.widthBox,
                Text(
                  invoice.status,
                  style: TextStyle(
                    fontSize: 10,
                    color: context.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).pOnly(bottom: 12);
  }
}
