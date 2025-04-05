import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:poc/screens/order_book/order_book_page.dart';
import 'package:poc/screens/todo/todo_screen.dart.dart';
import 'package:poc/screens/top_gain/top_gain_page.dart';

import '../screens/home_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
      GoRoute(path: '/second', builder: (context, state) => const TodoScreen()),
      GoRoute(
        path: '/topgain',
        builder: (context, state) => const TopGainersPage(),
      ),
      GoRoute(
        path: '/orderbook',
        builder: (context, state) => const OrderBookPage(),
      ),
    ],
  );
});
