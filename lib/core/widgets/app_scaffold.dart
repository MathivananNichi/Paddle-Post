import 'package:flutter/material.dart';
import 'package:paddle_post/core/adaptive/adaptive.dart';
import 'package:paddle_post/core/constants/app_padding.dart';
import 'package:paddle_post/core/constants/app_size.dart';
import 'package:paddle_post/core/utils/extensions/context_extensions.dart';
import 'package:paddle_post/core/widgets/loading_view.dart';

/// Reusable application scaffold for PaddlePost.
///
/// Standardises background colors, safe area insets, optional header bar,
/// loading states, and layout padding across features.
class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.body,
    this.appBar,
    this.title,
    this.titleWidget,
    this.leading,
    this.showBackButton = false,
    this.onBack,
    this.actions,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.padding,
    this.safeArea = true,
    this.safeAreaTop = true,
    this.safeAreaBottom = true,
    this.safeAreaLeft = true,
    this.safeAreaRight = true,
    this.resizeToAvoidBottomInset = true,
    this.isLoading = false,
    this.drawer,
    this.endDrawer,
    this.backgroundDecorator,
    super.key,
  });

  /// The primary content of the screen.
  final Widget body;

  /// Custom app bar. If null and [title] or [titleWidget] is provided, a default
  /// [AppBar] is constructed.
  final PreferredSizeWidget? appBar;

  /// Title text for the default [AppBar] if [appBar] is not explicitly supplied.
  final String? title;

  /// Custom title widget for the default [AppBar].
  final Widget? titleWidget;

  /// Optional leading widget for the default [AppBar].
  final Widget? leading;

  /// Whether to show a styled back button when [appBar] is null and [title] is provided.
  final bool showBackButton;

  /// Optional callback invoked when the back button is pressed.
  final VoidCallback? onBack;

  /// Action widgets displayed at the end of the default [AppBar].
  final List<Widget>? actions;

  /// Floating action button.
  final Widget? floatingActionButton;

  /// Location of the floating action button.
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// Bottom navigation bar.
  final Widget? bottomNavigationBar;

  /// Persistent bottom sheet widget.
  final Widget? bottomSheet;

  /// Custom background color. Defaults to [ThemeData.scaffoldBackgroundColor].
  final Color? backgroundColor;

  /// Internal padding for the body content. Defaults to [EdgeInsets.zero].
  final EdgeInsetsGeometry? padding;

  /// Whether to wrap the body in a [SafeArea].
  final bool safeArea;

  final bool safeAreaTop;
  final bool safeAreaBottom;
  final bool safeAreaLeft;
  final bool safeAreaRight;

  /// Whether the body should resize when the on-screen keyboard appears.
  final bool resizeToAvoidBottomInset;

  /// Whether a loading overlay should be displayed over the content.
  final bool isLoading;

  /// Optional side drawer.
  final Widget? drawer;

  /// Optional end drawer.
  final Widget? endDrawer;

  /// Optional decorative widget placed behind the body (e.g. scoreboard glows or court lines).
  final Widget? backgroundDecorator;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final scaffoldBg = backgroundColor ?? theme.scaffoldBackgroundColor;

    Widget content = body;

    content = Padding(
      padding: padding ?? const EdgeInsets.only(top: AppPadding.p16),
      child: content,
    );

    if (safeArea) {
      content = SafeArea(
        top: safeAreaTop,
        bottom: safeAreaBottom,
        left: safeAreaLeft,
        right: safeAreaRight,
        child: content,
      );
    }

    if (backgroundDecorator != null || isLoading) {
      content = Stack(
        fit: StackFit.expand,
        children: [
          ?backgroundDecorator,
          content,
          if (isLoading) ColoredBox(color: context.paddleColors.scrim, child: const LoadingView()),
        ],
      );
    }

    return AdaptiveScale(
      child: Scaffold(
        backgroundColor: scaffoldBg,
        appBar: appBar ?? _buildDefaultAppBar(context),
        body: content,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        bottomNavigationBar: bottomNavigationBar,
        bottomSheet: bottomSheet,
        drawer: drawer,
        endDrawer: endDrawer,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      ),
    );
  }

  PreferredSizeWidget? _buildDefaultAppBar(BuildContext context) {
    if (title == null && titleWidget == null && actions == null && !showBackButton) {
      return null;
    }

    Widget? leadingWidget = leading;
    if (leadingWidget == null && showBackButton) {
      leadingWidget = IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded, size: AppSize.iconMedium),
        onPressed: onBack ?? () => Navigator.of(context).maybePop(),
      );
    }

    return AppBar(
      title: titleWidget ?? (title != null ? Text(title!) : null),
      leading: leadingWidget,
      actions: actions != null ? [...actions!, const SizedBox(width: AppSize.s8)] : null,
    );
  }
}
