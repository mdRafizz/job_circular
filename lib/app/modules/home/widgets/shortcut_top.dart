import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:job_circular/app/modules/home/controllers/home_controller.dart';
import 'package:job_circular/app/routes/app_pages.dart';

import '../../../widgets/reusable_text.dart';

class ShortcutTop extends StatelessWidget {
  final HomeController controller;

  const ShortcutTop({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    List<String> quotes = [
      "চর্যাপদ বাংলা সাহিত্যের প্রাচীনতম নিদর্শন। এটি আবিষ্কার করেন হরপ্রসাদ শাস্ত্রী। এর ভাষা সান্ধ্যভাষা নামে পরিচিত।",
      "শ্রীকৃষ্ণকীর্তন কাব্য রচনা করেন বড়ু চণ্ডীদাস। মধ্যযুগের অন্যতম শ্রেষ্ঠ কবি আলাওল। তিনি 'পদ্মাবতী' রচনা করেন।",
      "রবীন্দ্রনাথ ঠাকুর ১৯১৩ সালে গীতাঞ্জলি কাব্যের জন্য নোবেল পুরস্কার পান। কাজী নজরুল ইসলামকে বিদ্রোহী কবি বলা হয়। তার বিখ্যাত কবিতা 'বিদ্রোহী'।",
      "জীবনানন্দ দাশ 'রূপসী বাংলা' কাব্যের জন্য বিখ্যাত। মাইকেল মধুসূদন দত্ত অমিত্রাক্ষর ছন্দের প্রবর্তক। তার বিখ্যাত কাব্য 'মেঘনাদবধ কাব্য'।",
      "ফোর্ট উইলিয়াম কলেজ ১৮০০ সালে প্রতিষ্ঠিত হয়। উইলিয়াম কেরি বাংলা গদ্যের বিকাশে গুরুত্বপূর্ণ ভূমিকা রাখেন। ঈশ্বরচন্দ্র বিদ্যাসাগর বাংলা গদ্যের জনক হিসেবে পরিচিত।",
      "উইলিয়াম শেক্সপিয়র ইংরেজি সাহিত্যের শ্রেষ্ঠ নাট্যকার। তার বিখ্যাত নাটকগুলোর মধ্যে 'হ্যামলেট', 'ম্যাকবেথ', 'ওথেলো' অন্যতম।",
      "জন কিটস একজন বিখ্যাত রোমান্টিক কবি। তার বিখ্যাত কবিতা 'ওড টু এ নাইটিংগেল'। টি.এস. এলিয়ট আধুনিক যুগের একজন বিখ্যাত কবি। তার বিখ্যাত কবিতা 'দ্য ওয়েস্ট ল্যান্ড'।",
      "চার্লস ডিকেন্স ভিক্টোরিয়ান যুগের একজন বিখ্যাত ঔপন্যাসিক। তার বিখ্যাত উপন্যাসগুলোর মধ্যে 'অলিভার টুইস্ট', 'ডেভিড কপারফিল্ড' অন্যতম। আর্নেস্ট হেমিংওয়ে আধুনিক যুগের একজন বিখ্যাত ঔপন্যাসিক। তার বিখ্যাত উপন্যাস 'দ্য ওল্ড ম্যান অ্যান্ড দ্য সি'।",
      "বাংলাদেশের মুক্তিযুদ্ধের উপর রচিত কয়েকটি বিখ্যাত সাহিত্যকর্ম হলো, 'একাত্তরের দিনগুলি' (জাহানারা ইমাম), 'রাইফেল রোটি আওরাত' (আনোয়ার পাশা), 'হাঙ্গর নদী গ্রেনেড' (সেলিনা হোসেন)।",
      "বাংলাদেশের প্রথম প্রধানমন্ত্রী তাজউদ্দীন আহমেদ। বাংলাদেশের সংবিধান গৃহীত হয় ১৯৭২ সালের ৪ নভেম্বর। বাংলাদেশের জাতীয় সংসদ ভবনের স্থপতি লুই আই কান।",
      "The capital of Bangladesh is Dhaka. The largest river in Bangladesh is the Meghna. The Sundarbans, a large mangrove forest, is located in Bangladesh.",
      "A noun is a word that names a person, place, thing, or idea. A verb is a word that expresses an action or state. An adjective is a word that describes a noun.",
      "The correct use of tenses is important in English grammar. The present perfect tense is used to describe an action that started in the past and continues to the present. The past perfect tense is used to describe an action that was completed before another action in the past.",
      "The passive voice is used when the subject of a sentence is acted upon by the verb. The active voice is used when the subject of a sentence performs the action of the verb.",
      "বাংলা সাহিত্যের মধ্যযুগের অন্যতম শ্রেষ্ঠ কবি ছিলেন মুকুন্দরাম চক্রবর্তী। তার বিখ্যাত কাব্য 'চণ্ডীমঙ্গল'। ভারতচন্দ্র রায়গুণাকর মধ্যযুগের শেষ কবি। তার বিখ্যাত কাব্য 'অন্নদামঙ্গল'।",
      "ঈশ্বরচন্দ্র বিদ্যাসাগর রচিত বিখ্যাত গ্রন্থ 'বেতাল পঞ্চবিংশতি'। বঙ্কিমচন্দ্র চট্টোপাধ্যায়ের প্রথম উপন্যাস 'দুর্গেশনন্দিনী'। শরৎচন্দ্র চট্টোপাধ্যায় রচিত বিখ্যাত উপন্যাস 'শ্রীকান্ত'।",
      "মাইকেল মধুসূদন দত্তের 'মেঘনাদবধ কাব্য' বাংলা সাহিত্যের প্রথম সার্থক মহাকাব্য। রবীন্দ্রনাথ ঠাকুরের প্রথম কাব্যগ্রন্থ 'বনফুল'। কাজী নজরুল ইসলামের প্রথম কাব্যগ্রন্থ 'অগ্নিবীণা'।",
      "জীবনানন্দ দাশকে রূপসী বাংলার কবি বলা হয়। জসীম উদ্‌দীন পল্লীকবি নামে পরিচিত। শামসুর রাহমানকে নাগরিক কবি বলা হয়।",
      "বাংলাদেশের জাতীয় স্মৃতিসৌধের স্থপতি মাইনুল হোসেন। বাংলাদেশের জাতীয় পতাকার নকশাকার কামরুল হাসান। বাংলাদেশের জাতীয় সংগীতের রচয়িতা রবীন্দ্রনাথ ঠাকুর।",
      "The first English dictionary was written by Robert Cawdrey. William Shakespeare is considered the greatest writer in the English language. Jane Austen is famous for her novels of manners.",
      "The Romantic period in English literature emphasized emotion and nature. The Victorian period was characterized by social realism. The Modern period saw a break from traditional forms and styles.",
      "The parts of speech in English are noun, verb, adjective, adverb, pronoun, preposition, conjunction, and interjection. Sentence structure includes subject, verb, and object.",
      "Idioms and phrases are common in English. They often have figurative meanings. Proverbs are short sayings that express a general truth or piece of advice.",
      "বাংলাদেশের প্রথম নারী প্রধানমন্ত্রী খালেদা জিয়া। বাংলাদেশের প্রথম এভারেস্ট বিজয়ী নারী নিশাত মজুমদার। বাংলাদেশের প্রথম টেস্ট অধিনায়ক নাইমুর রহমান দুর্জয়।",
      "বাংলাদেশের সবচেয়ে বড় নদী মেঘনা। বাংলাদেশের সবচেয়ে বড় হাওর হাকালুকি হাওর। বাংলাদেশের সবচেয়ে বড় বিল চলন বিল।",
      "The longest river in the world is the Nile. The largest ocean in the world is the Pacific Ocean. The highest mountain in the world is Mount Everest.",
      "The United Nations was founded in 1945. The European Union was formed in 1993. The World Trade Organization was established in 1995.",
      "বাংলাদেশের স্বাধীনতা দিবস ২৬ মার্চ। বাংলাদেশের বিজয় দিবস ১৬ ডিসেম্বর। বাংলাদেশের শহীদ বুদ্ধিজীবী দিবস ১৪ ডিসেম্বর।",
      "The first man to walk on the moon was Neil Armstrong. The first woman to fly in space was Valentina Tereshkova. The first computer programmer was Ada Lovelace.",
      "The capital of France is Paris. The capital of Japan is Tokyo. The capital of China is Beijing.",
      "The president of the United States lives in the White House. The prime minister of the United Kingdom lives at 10 Downing Street. The president of Russia lives in the Kremlin.",
      "The most populous country in the world is China. The largest country in the world by land area is Russia. The smallest country in the world is Vatican City.",
      "The first Nobel Prize was awarded in 1901. The Nobel Prize is awarded in six categories. The Nobel Peace Prize is awarded in Oslo, Norway.",
      "The Olympic Games are held every four years. The FIFA World Cup is also held every four years. The Cricket World Cup is held every four years.",
      "The first book printed in English was 'The Canterbury Tales' by Geoffrey Chaucer. The first newspaper printed in English was 'The Daily Courant'. The first encyclopedia written in English was 'Cyclopaedia, or an Universal Dictionary of Arts and Sciences'.",
      "The first university in the world was the University of Bologna in Italy. The first public library in the world was the Alexandrian Library in Egypt. The first museum in the world was the Capitoline Museums in Rome.",
      "The first telephone was invented by Alexander Graham Bell. The first light bulb was invented by Thomas Edison. The first computer was invented by Charles Babbage.",
      "The first airplane was invented by the Wright brothers. The first car was invented by Karl Benz. The first television was invented by Philo Farnsworth.",
      "The first vaccine was invented by Edward Jenner. The first antibiotic was discovered by Alexander Fleming. The first heart transplant was performed by Christiaan Barnard.",
      "The first human to travel to space was Yuri Gagarin. The first human to walk on the moon was Neil Armstrong. The first human to orbit the Earth was John Glenn.",
      "The first woman to fly solo across the Atlantic Ocean was Amelia Earhart. The first woman to climb Mount Everest was Junko Tabei. The first woman to win a Nobel Prize was Marie Curie.",
      "The first person to write a play was Aeschylus. The first person to write an epic poem was Homer. The first person to write a novel was Murasaki Shikibu.",
      "The first person to paint a portrait was Cimabue. The first person to sculpt a statue was Donatello. The first person to compose a symphony was Joseph Haydn.",
      "The first person to invent the printing press was Johannes Gutenberg. The first person to invent the steam engine was Thomas Newcomen. The first person to invent the internal combustion engine was Nikolaus Otto.",
      "The first person to invent the radio was Guglielmo Marconi. The first person to invent the television was Philo Farnsworth. The first person to invent the internet was Tim Berners-Lee.",
    ];

    final quickButtonLists = [
      [
        'Circular',
        'assets/images/svg/job.svg',
        () {
          controller.tabController.animateTo(1);
        },
      ],
      [
        'Results',
        'assets/images/svg/results.svg',
        () {
          controller.tabController.animateTo(2);
        },
      ],
      [
        'Notice',
        'assets/images/svg/notice.svg',
        () {
          Get.toNamed(
            Routes.SHARED_POSTS,
            arguments: {
              'title': 'Notice',
              'posts': controller.getOnlyNotices(),
            },
          );
        },
      ],
      [
        'Notes',
        'assets/images/svg/notes.svg',
        () {
          Get.toNamed(Routes.NOTES);
        },
      ],
    ];

    return Container(
      color: const Color(0xfff4f4f4),
      height: MediaQuery.sizeOf(context).height * .54,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * .465,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.r),
                bottomRight: Radius.circular(25.r),
              ),
              color: const Color(0xff128d70),
              image: const DecorationImage(
                image: AssetImage('assets/images/png/top_cover.png'),
                colorFilter: ColorFilter.mode(
                  Color(0xff21836c),
                  BlendMode.srcIn,
                ),
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 65.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: SvgPicture.asset(
                              'assets/images/svg/menu.svg',
                              height: 18.h,
                              colorFilter: ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                        const ReusableText(
                          'Job Circular',
                          family: 'ferdoka',
                          size: 22.22,
                          weight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              Routes.SEARCH,
                              arguments: {'posts': controller.postLists},
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: SvgPicture.asset(
                              'assets/images/svg/search.svg',
                              height: 17.5.h,
                              colorFilter: ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 250.h,
                    child: PageView.builder(
                      controller: controller.pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: quotes.length,
                      itemBuilder: (_, i) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.w),
                          child: Center(
                            child: ReusableText(
                              quotes[i],
                              color: Colors.white,
                              textAlign: TextAlign.center,
                              family: 'bn',
                              size: 19,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 65.h,
            bottom: 220.h,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  5,
                  (i) => Container(
                    width: 5.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white.withValues(alpha: .05),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 15.h,
            left: 15.w,
            right: 15.w,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25.r)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.05),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:
                    quickButtonLists.map((item) {
                      return GestureDetector(
                        onTap: item[2] as void Function(),
                        child: Column(
                          spacing: 4.h,
                          children: [
                            SvgPicture.asset(item[1].toString(), height: 31.h),
                            ReusableText(
                              item[0].toString(),
                              family: 'ferdoka',
                              size: 14.2,
                            ),
                          ],
                        ),
                      );
                    }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
