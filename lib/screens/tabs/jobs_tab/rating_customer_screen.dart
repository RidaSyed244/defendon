import 'package:defendon/utils/extensions.dart';
import 'package:defendon/utils/padding_extensions.dart';
import 'package:defendon/utils/validators.dart';
import 'package:defendon/utils/widget_utility_extensions.dart';
import 'package:defendon/widgets/primary_button.dart';
import 'package:defendon/widgets/primary_outline_card.dart';
import 'package:defendon/widgets/primary_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RatingCustomerScreen extends HookWidget {
  const RatingCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reviewController = useTextEditingController();
    final ratedValue = useState(0);
    final formKey = GlobalObjectKey<FormState>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Rating Customer",
        ),
      ),
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            50.heightBox,
            Text(
              'Share your experience with us',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
                color: context.primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            30.heightBox,
            PrimaryOutlinedCard(
              borderRadius: 12,
              borderColor: Colors.transparent,
              backgroundColor: context.adaptive05,
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.sentiment_dissatisfied,
                    color: Colors.orange,
                  ),
                  10.widthBox,
                  Text(
                    '${ratedValue.value}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.sentiment_satisfied,
                    color: Colors.yellow,
                  ),
                  10.widthBox,
                  Text(
                    '10',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            20.heightBox,
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final isSelected = ratedValue.value == index + 1;
                return ElevatedButton(
                  onPressed: () {
                    ratedValue.value = index + 1;
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(2),
                    backgroundColor: isSelected
                        ? context.primaryColor
                        : Colors.grey.shade200,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: FittedBox(
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.grey,
                        fontSize: 24,
                      ),
                    ),
                  ),
                );
              },
            ).pSymmetric(
              h: 16,
              v: 10,
            ),
            20.heightBox,
            PrimaryTextField(
              controller: reviewController,
              hintText: 'Tell us how we can improve',
              maxLines: 4,
              minLines: 4,
              validator: (value) => Validators.reviewValidator(value),
            ),
          ],
        ).p16().safeArea().scrollVertical(),
      ),
      bottomNavigationBar: PrimaryButton(
        onTap: () {
          if (!formKey.currentState!.validate()) return;
        },
        text: 'Submit',
        textColor: Colors.white,
      ).p16().safeArea(),
    );
  }
}
