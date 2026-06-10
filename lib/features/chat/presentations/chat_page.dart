import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_circle_avatar.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_text_form_field.dart';
import 'package:sport_flutter_app/features/chat/presentations/widgets/chat_bubble.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> messages = [
      "سلام مربی! تمرین امروز رو چطور شروع کنم؟",
      "سلام پسر جان. اول ۱۵ دقیقه نرمش سبک و حرکات کششی انجام بده، بعد برو سراغ وزنه‌ها.",
      "باشه مربی. راستی دیروز نتونستم تمرین کنم، کمرم کمی درد می‌کرد.",
      "درد کمر جای نگرانی نداره؟ مگه نگفتم همیشه حرکات رو اصولی انجام بده تا آسیب نبینی.",
      "نه دردش زیاد نیست، فقط یه کمی احساس خستگی می‌کنم. فکر می‌کنم زیاده‌روی کردم.",
      "باشه امروز سبک‌تر تمرین کن. هیچوقت نباید به بدن خودت آسیب بزنی، حرفه‌ای بودن یعنی بدونی کی باید کم بگیری.",
      "چشم مربی. راستی مسابقه هفته دیگه چه برنامه‌ای داریم؟ خیلی استرس دارم نمی‌دونم چطور خودمو آماده کنم.",
      "برنامه دقیق رو برات می‌فرستم. مهمترین چیز آرامش روانیه. باید به توانایی‌هات اعتماد کنی چون من تو رو به خوبی می‌شناسم.",
      "مرسی مربی. واقعاً از همه زحماتتون ممنونم. بدون راهنمایی شما من هیچوقت نمی‌تونستم به این مرحله برسم.",
      "خواهش می‌کنم، این وظیفه منه. وظیفه من اینه که بهترین ورزشکار رو از وجود تو پرورش بدم و بهت کمک کنم به اهدافت برسی.",
      "راستی مربی، نظرتون راجع به رژیم جدیدم چیه؟ می‌خوام یه کم وزن کم کنم ولی نمی‌دونم درست تصمیم گرفتم یا نه.",
      "رژیم تو رو خودم کنترل می‌کنم، لطفاً خودسرانه هیچ تغییری توش نده. کاهش وزن بی‌برنامه باعث ضعف عضلانی و تحلیل رفتنش می‌شه و برات خطرناکه.",
      "باشه مربی، حتماً طبق برنامتون پیش می‌رم. فقط نگرانم که به وزن ایده‌آل برسم یا نه چون مسابقه نزدیکه و هنوز چند کیلو مونده.",
      "نگران نباش، با برنامه‌ای که داریم به موقع به وزن ایده‌آلت می‌رسی. مهمترین چیز اینه که سالم باشی و بتونی بهترین عملکردت رو توی مسابقه نشون بدی.",
      "مرسی مربی. واقعاً اعتماد به نفسی که به من می‌دید باورنکردنیه. گاهی فکر می‌کنم اگه شما نبودید من کجا بودم و چیکار می‌کردم.",
      "تو استعداد خاصی داری، من فقط راه رو بهت نشون می‌دم. اما تلاش و پشتکار خودته که باعث پیشرفتت شده، فراموش نکن هیچ موفقیتی بی‌زحمت به دست نمیاد.",
      "راستی مربی، فردا چه ساعتی تمرین داریم؟ یادم رفت بنویسم و می‌ترسم دیر برسم براتون دردسر درست کنه.",
      "فردا صبح ساعت ۷ صبح باشیم ورزشگاه. اول تمرین هوازی، بعد وزنه، و آخرشم ۲۰ دقیقه کشش و یوگا برای ریکاوری عضلات.",
      "چشم مربی، حتماً رأس ساعت هفت میام. راستی استراحت امروز رو چطور بگذرونم؟ یعنی می‌تونم برم بیرون با دوستام یا نه؟",
      "بهتره امروز استراحت کامل بکنی و زیاد بیرون نری. یه پیاده‌روی سبک عصر انجام بده و زود بخواب. فردا روز مهمیه و باید پر انرژی باشی.",
    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          spacing: 12,
          children: [
            AppCircleAvatar(username: 'مصطفی گریزمان', radius: 20),
            Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .start,
              children: [
                Text(
                  'مصطفی گریزمان',
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: .w600,
                    height: 1.2,
                  ),
                ),
                Text(
                  'مربی بدنسازی',
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: .w500,
                    color: context.colors.onBackgroundSecondary,
                    height: 1,
                  ),
                ),
              ],
            ),
          ],
        ),
        titleSpacing: 4,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                reverse: true,
                padding: EdgeInsets.fromLTRB(16, 16, 16, 96),
                itemBuilder: (context, index) =>
                    ChatBubble(messages: messages, index: index),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 24),
                itemCount: 20,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        color: context.colors.background,
        child: AppTextFormField(
          hintText: context.l10n.chat_text_field_hint,
          maxLines: 6,
          minLines: 1,
          keyboardType: .multiline,
          textInputAction: .newline,
        ),
      ),
      floatingActionButtonLocation: .miniCenterDocked,
      floatingActionButtonAnimator: .scaling,
    );
  }
}
