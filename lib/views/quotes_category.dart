import 'package:bimir_lock/repos/quotes_repo.dart';
import 'package:flutter/material.dart';

class SelectQuotesCategory extends StatefulWidget {
  SelectQuotesCategory({super.key});

  @override
  State<SelectQuotesCategory> createState() => _SelectQuotesCategoryState();
}

class _SelectQuotesCategoryState extends State<SelectQuotesCategory> {
  @override
  void initState() {
    QoutesRepo.getQuotes(category: "love");
    super.initState();
  }

  final List quoteItems = [
    "art",
    "beauty",
    "business",
    "communications",
    "computers",
    "dreams",
    "education",
    "failure",
    "fear",
    "fitness",
    "freedom",
    "friendship",
    "future",
    "happiness",
    "hope",
    "imagination",
    "inspirational",
    "intelligence",
    "knowledge",
    "leadership",
    "life",
    "love",
    "money",
    "morning",
    "success"
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            highlightColor: Colors.transparent,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: theme.colorScheme.onSurfaceVariant,
              size: 30,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        title: const Text(
          "Select Quotes category",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 50,
                ),
              ),
              const SliverToBoxAdapter(
                child: Text(
                  'Select your favourite quotes category to get quotes recommendation',
                  textAlign: TextAlign.center,
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 50,
                ),
              ),
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 1,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Stack(
                      children: [
                        Card(
                          margin: const EdgeInsets.only(
                            right: 10,
                            bottom: 20,
                            left: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          elevation: 10,
                          semanticContainer: false,
                          surfaceTintColor: theme.colorScheme.surfaceTint,
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              quoteItems[index][0].toString().toUpperCase() +
                                  quoteItems[index].toString().substring(1).toLowerCase(),
                            ),
                          ),
                        ),
                        const Positioned(
                          right: 15,
                          top: 10,
                          child: Icon(
                            Icons.task_alt_rounded,
                          ),
                        )
                      ],
                    );
                  },
                  childCount: quoteItems.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
