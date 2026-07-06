import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/constant/assets_icons.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/custom_app_bar.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';
import 'package:sport_flutter_app/core/ui/widgets/image_loader.dart';
import 'package:sport_flutter_app/features/search/presentation/widgets/class_location.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1C8qqKTIIwRr4lHxsi6p2ySmr1f58AcoIUFgV-xMhQw&s=10',
      'https://cdn.fararu.com/thumbnail/76OvMfg4XMug/fCohl8MdDeqLuUiNxwx9X4gYrgKL9XBZBWdbZWUJQbHweEbOeibJ3lKhwCXPcymMenByfMSSpsbh46ioIqLjxbHMRm21_h7HQpcPeRTlTup9Fg2BIMEOf3jclM_4J6zeNSYMgfXaohulu-5sw13OzgLVa--jwrBG/%D8%A8%D8%AF%D9%86%D8%B3%D8%A7%D8%B2%DB%8C.jpg',
      'https://cdn.tabnak.ir/files/fa/news_albums/1219516/52232/resized/resized_1770153_880.jpg',
      'https://kalavarzesh.com/wp-content/uploads/2025/06/%D9%88%D8%B1%D8%B2%D8%B4-%D9%87%D9%88%D8%A7%D8%B2%DB%8C.jpg.webp',
      'https://ichef.bbci.co.uk/ace/ws/800/cpsprodpb/7d17/live/e3902d60-a4a5-11ee-91bf-230bfab3fcba.jpg.webp',
      'https://kalavarzesh.com/wp-content/uploads/2025/06/ae566aa07d5e44d1b0ce431f789ed8eb.jpg.webp',
      'https://kalavarzesh.com/wp-content/uploads/2025/06/%D9%88%D8%B1%D8%B2%D8%B4-%D9%87%D8%A7%DB%8C-%D9%BE%D8%B1%D8%B4%DB%8C.jpg.webp',
      'https://cdn.asriran.com/files/fa/news/1404/7/27/2336874_140.jpg',
    ];
    final List<String> title = <String>[
      'کلاس حرفه ای والیبال پیشرفته',
      'سنگ کاغذ قیچی مبتدی',
      'بسکتبال حرفه ای فرکانس',
      'باشگاه دوندگی تیزپا',
      'کلاس شنای بزرگسالان',
      'کشتی گیران ایران زمین',
      'کلاس طناب زنی ممد قلی',
      'کلاس تکواندوی جاوید',
    ];
    final List<String> coachName = <String>[
      'مطظفی گریزمان',
      'سعید بهرامی',
      'راستین حسن زاده',
      'سپنتا فکوری',
      'پرهام حسن پور قاسم آبادی چابکسری',
      'میعاد جاوید',
      'امیرمحمد مهرورز دیلمانی',
      'سهند فکوری',
    ];
    final List<String> rates = <String>[
      '4.1',
      '4.6',
      '3.9',
      '4.9',
      '3.8',
      '4.6',
      '3.9',
      '4.9',
    ];
    final List<String> price = <String>[
      '180.000',
      '890.000',
      '1.250.000',
      '500.000',
      '2.250.000',
      '890.000',
      '450.000',
      '360.000',
    ];
    final List<String> address = <String>[
      'تهران، سعادت آباد',
      'قزوین، شهرک مهرگان',
      'خراسان رضوی، قوچان',
      'کهکیلویه و بویر احمر، سنندج',
      'گلستان، کردکوی کیانوش اینا',
      'قزوین، تاکستان',
      'گیلان، رحیم آباد، ترشکوه',
      'مازندران، شهسوار',
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: SizedBox(
          height: 48,
          child: SearchBar(
            padding: const WidgetStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16.0),
            ),
            onTap: () {},
            onChanged: (_) {},
            leading: const Icon(Icons.search),
            shadowColor: WidgetStatePropertyAll(Colors.transparent),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) => ClassTile(
                  onTap: () {},
                  image: images[index],
                  title: title[index],
                  coachName: coachName[index],
                  coachRate: rates[index],
                  address: address[index],
                  price: price[index],
                ),
                itemCount: 8,
                padding: const .symmetric(vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClassTile extends StatelessWidget {
  final String image;
  final String title;
  final String coachName;
  final String coachRate;
  final String address;
  final String price;
  final VoidCallback? onTap;

  const ClassTile({
    super.key,
    required this.image,
    required this.title,
    required this.coachName,
    required this.coachRate,
    required this.address,
    required this.price,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const .symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          crossAxisAlignment: .center,
          mainAxisSize: .max,
          spacing: 12,
          children: [
            Container(
              decoration: BoxDecoration(
                color: context.colors.background,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: context.colors.secondary.withValues(alpha: 0.12),
                    offset: const Offset(0, 1),
                    blurRadius: 2,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: ImageLoader(
                imageUrl: image,
                height: 150,
                width: 150,
                radius: 18,
              ),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: .spaceEvenly,
                crossAxisAlignment: .start,
                spacing: 4,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: .ellipsis,
                    style: context.textTheme.titleMedium,
                  ),
                  Row(
                    spacing: 4,
                    children: [
                      Flexible(
                        child: Text(
                          coachName,
                          maxLines: 1,
                          overflow: .ellipsis,
                          style: context.textTheme.labelLarge?.copyWith(
                            color: context.colors.onBackgroundSecondary,
                          ),
                        ),
                      ),
                      Text(
                        '\u2022',
                        style: context.textTheme.labelLarge?.copyWith(
                          color: context.colors.onBackgroundSecondary,
                        ),
                      ),
                      IconWidget(
                        icon: AssetIcons.starFilled,
                        height: 12,
                        width: 12,
                        color: context.colors.onBackgroundSecondary,
                      ),
                      Text(
                        coachRate,
                        style: context.textTheme.labelLarge?.copyWith(
                          color: context.colors.onBackgroundSecondary,
                        ),
                      ),
                    ],
                  ),
                  ClassLocation(location: address),
                  RichText(
                    text: TextSpan(
                      text: price,
                      children: [
                        WidgetSpan(child: SizedBox(width: 4)),
                        TextSpan(
                          text: 'تومان',
                          style: context.textTheme.titleMedium,
                        ),
                      ],
                      style: context.textTheme.titleLarge?.copyWith(
                        fontWeight: .w600,
                      ),
                    ),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
