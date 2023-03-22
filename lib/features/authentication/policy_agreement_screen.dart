import 'package:flutter/material.dart';
import 'package:surfify/features/authentication/register_profile.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

class PolicyAgreementScreen extends StatefulWidget {
  const PolicyAgreementScreen({super.key});

  @override
  State<PolicyAgreementScreen> createState() => _PolicyAgreementScreenState();
}

class _PolicyAgreementScreenState extends State<PolicyAgreementScreen> {
  var agree1 = false;
  var agree2 = false;
  var agree3 = false;
  var agreeAll = false;
  var agreeNecessary = false;

  final ChangeNotifier changeNotifier = ChangeNotifier();
  void tapAgree1() {
    setState(() {
      agree1 = !agree1;
    });
  }

  void tapAgree2() {
    setState(() {
      agree2 = !agree2;
    });
  }

  void tapAgree3() {
    setState(() {
      agree3 = !agree3;
    });
  }

  void tapAgreeAll() {
    setState(() {
      if (agreeAll) {
        agree1 = false;
        agree2 = false;
        agree3 = false;
        agreeAll = false;
      } else {
        agree1 = true;
        agree2 = true;
        agree3 = true;
        agreeAll = true;
      }
    });
  }

  void onNextTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const RegisterProfile(),
    ));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(Sizes.size16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text(
                  '약관/정책 동의',
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gaps.v20,
                Row(
                  children: [
                    GestureDetector(
                      onTap: tapAgreeAll,
                      child: agreeAll
                          ? Icon(Icons.check_circle_outline,
                              color: Theme.of(context).primaryColor)
                          : Icon(Icons.circle_outlined,
                              color: Theme.of(context).primaryColor),
                    ),
                    Gaps.h4,
                    const Text('전체동의',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        )),
                  ],
                ),
                Gaps.v20,
                Row(
                  children: [
                    GestureDetector(
                      onTap: tapAgree1,
                      child: agree1
                          ? Icon(Icons.check_circle_outline,
                              color: Theme.of(context).primaryColor)
                          : Icon(Icons.circle_outlined,
                              color: Theme.of(context).primaryColor),
                    ),
                    Gaps.h4,
                    const Text('[필수] 서비스 이용약관 동의', style: TextStyle()),
                  ],
                ),
                const TextBox(
                    text:
                        "이용약관\n가. 동영상 책임은 사용자에게 있음 동영상 책임은 사용자에게 있음\n나. 동영상 책임은 사용자에게 있음 동영상 책임은 사용자에게 있음\n다. 동영상 책임은 사용자에게 있음 동영상 책임은 사용자에게 있음\n"),
                Gaps.v20,
                Row(
                  children: [
                    GestureDetector(
                      onTap: tapAgree2,
                      child: agree2
                          ? Icon(Icons.check_circle_outline,
                              color: Theme.of(context).primaryColor)
                          : Icon(Icons.circle_outlined,
                              color: Theme.of(context).primaryColor),
                    ),
                    Gaps.h4,
                    const Text('[필수] 개인정보 수집 및 이용에 관한 동의 ', style: TextStyle()),
                  ],
                ),
                const TextBox(
                    text:
                        "개인정보 수집에는 이런 것들을 함.                                    \n\n\n\n\n\n\n\n"),
                Gaps.v10,
                Row(
                  children: [
                    GestureDetector(
                      onTap: tapAgree3,
                      child: agree3
                          ? Icon(Icons.check_circle_outline,
                              color: Theme.of(context).primaryColor)
                          : Icon(Icons.circle_outlined,
                              color: Theme.of(context).primaryColor),
                    ),
                    Gaps.h4,
                    const Text('(선택) 이벤트 등 프로모션 알림 메일 및 푸시 알림 수신',
                        style: TextStyle()),
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                onNextTap(context);
              },
              child: FractionallySizedBox(
                widthFactor: 1,
                child: AnimatedContainer(
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.size16,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.size5),
                      color: (agree1 && agree2)
                          ? Theme.of(context).primaryColor
                          : Colors.grey.shade300),
                  duration: const Duration(milliseconds: 300),
                  child: const Text(
                    '다음',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class TextBox extends StatelessWidget {
  final String text;
  const TextBox({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // adding margin
      margin: const EdgeInsets.all(15.0),

      // adding padding
      padding: const EdgeInsets.all(3.0),

      // height should be fixed for vertical scrolling
      height: 80.0,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
      ),
      child: Expanded(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: Sizes.size16,
            ),
          ),
        ),
      ),
    );
  }
}
