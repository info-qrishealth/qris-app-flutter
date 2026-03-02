import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/all_scans_module/models/test_package_model/test_package_model.dart';
import 'package:qris_health/modules/all_scans_module/services/test_service.dart';
import 'package:qris_health/modules/health_article_module/cubits/health_article_category_cubit/health_article_category_cubit.dart';
import 'package:qris_health/modules/health_article_module/cubits/health_articles_cubit/health_article_cubit.dart';
import 'package:qris_health/modules/health_article_module/models/health_article/health_article.dart';
import 'package:qris_health/modules/health_article_module/screens/health_articles_screen.dart';
import 'package:qris_health/modules/home_module/components/package_tile_horizontal.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/common_category_container.dart';
import 'package:qris_health/shared/components/common_network_image.dart';
import 'package:qris_health/shared/components/contact_us_container.dart';
import 'package:qris_health/shared/components/heading_text.dart';
import 'package:qris_health/shared/components/navigation_row.dart';
import 'package:qris_health/shared/extensions/date_time_extension.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';
import 'package:qris_health/shared/utils/hex_color.dart';
import 'package:qris_health/shared/utils/mixins/general_helper_mixin.dart';
import 'package:qris_health/styles/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../screens/blood_test_detail_screen.dart';
import '../components/health_article_list_tile_horizontal.dart';

class HealthArticleDetailScreen extends StatefulWidget {
  final HealthArticle healthArticle;
  const HealthArticleDetailScreen({super.key, required this.healthArticle});

  @override
  State<HealthArticleDetailScreen> createState() =>
      _HealthArticleDetailScreenState();
}

class _HealthArticleDetailScreenState extends State<HealthArticleDetailScreen>
    with GeneralHelperMixin {
  final _textTheme = Get.textTheme;
  final _categoryScrollController = ScrollController();
  List<HealthArticle> _relatedArticles = [];

  @override
  void initState() {
    super.initState();
    _relatedArticles =
        BlocProvider.of<HealthArticleCubit>(context).getTopArticles();
  }

  List<Widget> _buildArticleContent() {
    final commonFontSize = FontSize.medium;
    final description = widget.healthArticle.description ?? '';
    
    // First decode HTML entities to get the actual content
    final decodedDescription = description.htmlString;
    
    // Pattern to match [PRDCARD ID=X] with optional whitespace
    final prdcardPattern = RegExp(r'\[PRDCARD\s+ID\s*=\s*(\d+)\s*\]', caseSensitive: false);
    
    final List<Widget> widgets = [];
    int lastIndex = 0;
    final matches = prdcardPattern.allMatches(decodedDescription).toList();
    
    for (final match in matches) {
      // Add HTML content before the PRDCARD
      if (match.start > lastIndex) {
        final htmlContent = decodedDescription.substring(lastIndex, match.start);
        // Remove trailing/leading whitespace and check if there's actual content
        final trimmedContent = htmlContent.trim();
        if (trimmedContent.isNotEmpty) {
          widgets.add(Html(
            data: trimmedContent,
            style: _getHtmlStyles(commonFontSize),
            onLinkTap: (url, _, __) async {
              if (url != null && await canLaunchUrl(Uri.parse(url))) {
                await launchUrl(Uri.parse(url),
                    mode: LaunchMode.externalApplication);
              }
            },
          ));
        }
      }
      
      // Add product card for the PRDCARD
      final testId = int.tryParse(match.group(1) ?? '');
      if (testId != null) {
        widgets.add(SizedBox(height: 16));
        widgets.add(FutureBuilder<TestPackageModel>(
          future: TestService.getTestByTestId(id: testId),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return PackageTileHorizontal(
                testPackageModel: snapshot.data,
                onSeeDetailsTap: () async {
                  await Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => BloodTestDetailScreen(
                        testId: snapshot.data!.id,
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const SizedBox.shrink();
            }
            return FadeShimmer(
              width: 152,
              height: 200,
              fadeTheme: FadeTheme.light,
            );
          },
        ));
        widgets.add(SizedBox(height: 16));
      }
      
      lastIndex = match.end;
    }
    
    // Add remaining HTML content after the last PRDCARD
    if (lastIndex < decodedDescription.length) {
      final htmlContent = decodedDescription.substring(lastIndex);
      final trimmedContent = htmlContent.trim();
      if (trimmedContent.isNotEmpty) {
        widgets.add(Html(
          data: trimmedContent,
          style: _getHtmlStyles(commonFontSize),
          onLinkTap: (url, _, __) async {
            if (url != null && await canLaunchUrl(Uri.parse(url))) {
              await launchUrl(Uri.parse(url),
                  mode: LaunchMode.externalApplication);
            }
          },
        ));
      }
    }
    
    // If no PRDCARD found, render the entire description as HTML
    if (widgets.isEmpty) {
      widgets.add(Html(
        data: decodedDescription,
        style: _getHtmlStyles(commonFontSize),
        onLinkTap: (url, _, __) async {
          if (url != null && await canLaunchUrl(Uri.parse(url))) {
            await launchUrl(Uri.parse(url),
                mode: LaunchMode.externalApplication);
          }
        },
      ));
    }
    
    return widgets;
  }

  Map<String, Style> _getHtmlStyles(FontSize commonFontSize) {
    return {
      'p': Style(
        fontWeight: FontWeight.w400,
        color: AppColors.lightText,
        fontSize: commonFontSize,
        lineHeight: LineHeight.number(1.4),
        margin: Margins.zero,
      ),
      'strong': Style(
        color: AppColors.textColor,
        fontWeight: FontWeight.bold,
        display: Display.inline,
        fontSize: commonFontSize,
        lineHeight: LineHeight.number(1.4),
      ),
      'li': Style(
        color: AppColors.lightText,
        fontWeight: FontWeight.w400,
        margin: Margins.symmetric(horizontal: 8, vertical: 5),
        fontSize: commonFontSize,
        lineHeight: LineHeight.number(1.4),
      ),
      'ul': Style(
        padding: HtmlPaddings.only(left: 16),
        fontSize: commonFontSize,
        lineHeight: LineHeight.number(1.4),
        margin: Margins.only(bottom: 8),
      ),
      'ol': Style(
        padding: HtmlPaddings.only(left: 16),
        fontSize: commonFontSize,
        lineHeight: LineHeight.number(1.4),
        margin: Margins.only(bottom: 8),
      ),
      'em': Style(
        fontStyle: FontStyle.italic,
        color: AppColors.textColor,
        fontSize: commonFontSize,
        lineHeight: LineHeight.number(1.4),
      ),
      'h1': Style(
        fontWeight: FontWeight.bold,
        color: AppColors.textColor,
        margin: Margins.only(bottom: 12),
        fontSize: commonFontSize,
        lineHeight: LineHeight.number(1.4),
      ),
      'h2': Style(
        fontWeight: FontWeight.bold,
        color: AppColors.textColor,
        margin: Margins.only(bottom: 10),
        fontSize: commonFontSize,
        lineHeight: LineHeight.number(1.4),
      ),
      'h3': Style(
        fontWeight: FontWeight.w600,
        color: AppColors.textColor,
        margin: Margins.only(bottom: 8),
        fontSize: commonFontSize,
        lineHeight: LineHeight.number(1.4),
      ),
      'h4': Style(
        fontWeight: FontWeight.w600,
        color: AppColors.textColor,
        margin: Margins.only(bottom: 6),
        fontSize: commonFontSize,
        lineHeight: LineHeight.number(1.4),
      ),
      'h5': Style(
        fontWeight: FontWeight.w500,
        color: AppColors.textColor,
        margin: Margins.only(bottom: 4),
        fontSize: commonFontSize,
        lineHeight: LineHeight.number(1.4),
      ),
      'h6': Style(
        fontWeight: FontWeight.w500,
        color: AppColors.textColor,
        margin: Margins.only(bottom: 2),
        fontSize: commonFontSize,
        lineHeight: LineHeight.number(1.4),
      ),
      'a': Style(
        color: Colors.blue,
        textDecoration: TextDecoration.underline,
        fontSize: commonFontSize,
        lineHeight: LineHeight.number(1.4),
      ),
      'blockquote': Style(
        fontStyle: FontStyle.italic,
        backgroundColor: Colors.grey.shade200,
        padding: HtmlPaddings.all(12),
        margin: Margins.symmetric(vertical: 12),
        border:
            Border(left: BorderSide(color: Colors.grey, width: 4)),
        fontSize: commonFontSize,
        lineHeight: LineHeight.number(1.4),
      ),
      'code': Style(
        fontFamily: 'monospace',
        backgroundColor: Colors.grey.shade200,
        padding: HtmlPaddings.all(4),
        color: Colors.deepPurple,
      ),
      'pre': Style(
          fontFamily: 'monospace',
          backgroundColor: Colors.black87,
          color: Colors.white,
          padding: HtmlPaddings.all(12),
          margin: Margins.symmetric(vertical: 12)),
      'table': Style(
        border: Border.all(color: Colors.grey),
        padding: HtmlPaddings.all(8),
        margin: Margins.symmetric(vertical: 8),
      ),
      'thead': Style(
        backgroundColor: Colors.grey.shade200,
      ),
      'tbody': Style(),
      'tr': Style(
        border:
            Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      'td': Style(
        padding: HtmlPaddings.all(8),
      ),
      'th': Style(
        padding: HtmlPaddings.all(8),
        fontWeight: FontWeight.bold,
      ),
      'img': Style(
        margin: Margins.symmetric(vertical: 8),
      ),
      'hr': Style(
        border: Border(
            bottom:
                BorderSide(color: Colors.grey.shade400, width: 1)),
        margin: Margins.symmetric(vertical: 12),
      ),
      'br': Style(
        display: Display.block,
        height: Height(8),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final commonFontSize = FontSize.medium;

    return Scaffold(
        appBar: CommonAppBar(title: 'Article'),
        body: SafeArea(
            child: ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.scaffoldPadding, vertical: 16),
                children: [
              HeadingText(text: widget.healthArticle.title),
              SizedBox(height: 14),
              Text(
                  '${widget.healthArticle.dateTime.toDateTime.getFormattedDatedMMMy}',
                  style: _textTheme.labelSmall!.copyWith(
                      color: AppColors.primaryPink,
                      fontWeight: FontWeight.w500)),
              SizedBox(height: 16),
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CommonNetworkImage(
                      name: '${widget.healthArticle.pic}',
                      fit: BoxFit.fill,
                      height: null)),
              SizedBox(height: 16),
              ..._buildArticleContent(),
              SizedBox(height: 16),
              ContactUsContainer(),
              // SizedBox(height: 16),
              // PackageListTile(
              //     onSeeDetailsTap: () {},
              //     onBookNowTap: () {
              //       Navigator.of(context).push(CupertinoPageRoute(
              //           builder: (context) =>
              //               BloodTestDetailScreen(testId: )));
              //     }),
              SizedBox(height: 16),
              if (!widget.healthArticle.relatedPackage.isNullOrEmpty)
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  HeadingText(text: 'Related blood test packages'),
                  SizedBox(height: 16),
                  FutureBuilder<List<TestPackageModel>>(
                      future: TestService.getTestsByTestIds(
                          testIds: getIntsFromString(
                              string: widget.healthArticle.relatedPackage)),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final packages = snapshot.data!;

                          return SizedBox(
                              height: 150,
                              child: ListView.separated(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return PackageTileHorizontal(
                                        testPackageModel: packages[index],
                                        onSeeDetailsTap: () async {
                                          await Navigator.of(context).push(
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      BloodTestDetailScreen(
                                                          testId:
                                                              packages[index]
                                                                  .id)));
                                        });
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(width: 8);
                                  },
                                  itemCount: packages.length));
                        }

                        return FadeShimmer(
                            width: double.infinity,
                            height: 145,
                            fadeTheme: FadeTheme.light);
                      }),
                ]),
              SizedBox(height: 16),
              HeadingText(text: 'You may also like'),
              SizedBox(height: 12),
              SizedBox(
                  height: 260,
                  child: BlocBuilder<HealthArticleCubit, HealthArticleState>(
                      builder: (context, state) {
                    if (state is HealthArticleLoaded) {
                      final articles = _relatedArticles;

                      return ListView.separated(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return HealthArticleListTileHorizontal(
                                healthArticle: articles[index]);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(width: 8);
                          },
                          itemCount: articles.length);
                    }

                    return CircularProgressIndicator.adaptive();
                  })),
              SizedBox(height: 16),
              Row(children: [
                Expanded(child: HeadingText(text: 'Other Categories')),
                NavigationRow(
                    onPreviousTap: () async {
                      await _categoryScrollController.animateTo(
                          _categoryScrollController.position.pixels - 150,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeIn);
                    },
                    onNextTap: () async {
                      await _categoryScrollController.animateTo(
                          _categoryScrollController.position.pixels + 150,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeIn);
                    },
                    activeColor: AppColors.primaryBlue)
              ]),
              SizedBox(height: 12),
              BlocBuilder<HealthArticleCategoryCubit,
                  HealthArticleCategoryState>(builder: (context, state) {
                return SingleChildScrollView(
                    controller: _categoryScrollController,
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                        height: 100,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: state.categories
                                .map((category) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6),
                                    child: CommonCategoryContainer(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      HealthArticlesScreen(
                                                          selectedCategory:
                                                              category)));
                                        },
                                        backgroundColor:
                                            category.iconBg == null ||
                                                    category.iconBg!.isEmpty
                                                ? Colors.white
                                                : HexColor.hexToColor(
                                                    category.iconBg!),
                                        networkImagePath: '${category.icon}',
                                        title: category.title)))
                                .toList())));
              })
            ])));
  }
}
