// ignore_for_file: depend_on_referenced_packages

import 'package:flighter/features/flighter_assistant_bot/views/widgets/messages_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';
import '../../../../constants.dart';
import '../../../offers/presentation/view_model/get_offer_cubit/get_offer_cubit.dart';
import '../../models/message_model.dart';

class BotViewBody extends StatefulWidget {
  const BotViewBody({super.key});

  @override
  State<BotViewBody> createState() => _BotViewBodyState();
}

class _BotViewBodyState extends State<BotViewBody> {
  final TextEditingController _userMessage = TextEditingController();

  static const apiKey = flighterAssistantApiKey;

  final model =
      GenerativeModel(model: 'gemini-1.5-flash-latest', apiKey: apiKey);

  final List<ChatMessageModel> _messages = [];
  @override
  void initState() {
    super.initState();
    _messages.add(
      ChatMessageModel(
        isUser: false,
        message:
            "Welcome to Flighter App! How can I help you?\n\nWe can assist you with:\n- How to use the application\n- What offers are available right now\n- How to request a refund (if available)\n\n Feel free to ask a question about Flighter or anything else – we can help!\n",
        date: DateTime.now(),
      ),
    );
  }

Future<void> sendMessage() async {
  final message = _userMessage.text.trim();
  if (message.isEmpty) return;

  _userMessage.clear();
  setState(() {
    _messages.add(ChatMessageModel(
      isUser: true,
      message: message,
      date: DateTime.now(),
    ));
  });

  final lowerMsg = message.toLowerCase();
  final offersModel =
      BlocProvider.of<GetOfferCubit>(context).offersModel; // <-- here

  // 🔍 Any wording that implies “suggest an offer”
  final suggestRegex = RegExp(
    r'\b(suggest|recommend|propose|best|cheap|deal|discount|offer|promotion)\b',
    caseSensitive: false,
  );

  String botResponse;

  /* ────────── Case 1: How to use the app ────────── */
  if (RegExp(
          r'\b(use|usage|how to use|how do i|how can i use (the )?(application|app))\b')
      .hasMatch(lowerMsg)) {
    botResponse = """
Here’s a quick guide to using Flighter:

1. **Search Flights:** Choose origin, destination, dates, travellers and class.  
2. **Pick a Ticket:** Select the flight that suits your schedule and budget.  
3. **Choose Seats:** Tap the seat you like.  
4. **Pay Now or Later:** Pay immediately *or* within 5 days.  
5. **Download Ticket:** Your PDF ticket is ready once payment completes.  
6. **Refunds:** Cancel within 2 days of booking *if* the flight is ≥ 5 days away.
""";

  /* ────────── Case 2: Offer Inquiry *or* Suggestion ────────── */
  } else if (lowerMsg.contains('offer') || suggestRegex.hasMatch(lowerMsg)) {
    if (offersModel.data?.isNotEmpty ?? false) {
      // Sort by price ascending
      final sorted = [...offersModel.data!]
        ..sort((a, b) => (double.tryParse(a.price ?? '0') ?? 0)
            .compareTo(double.tryParse(b.price ?? '0') ?? 0));

      // Take top 3 cheapest
      final top = sorted.take(3);

      botResponse = "Here are our best‑value tickets right now:\n";
      for (var t in top) {
        botResponse +=
            "• **${t.companyName}** | ${t.from} → ${t.to} on ${t.departureDate} at ${t.departureTime} | "
            "EGP ${t.price}${t.offerPercentage != null ? ' (‑${t.offerPercentage}% off)' : ''}\n";
      }
      botResponse +=
          "\nNeed something else? Just tell me your preferred route or date!";
    } else {
      botResponse = "There are currently no offers available.";
    }

  /* ────────── Case 3: Refund / Cancel ────────── */
  } else if (lowerMsg.contains('refund') || lowerMsg.contains('cancel')) {
    botResponse = """
You can request a refund **within 2 days** of payment *and* if the flight date is more than 5 days away.

**How to cancel:**
1. Open **Bookings**.  
2. Tap **Cancel Ticket** next to the eligible flight.  
3. Confirm with your password – we’ll refund to the original payment method.
""";

  /* ────────── Case 4: Profile management ────────── */
  } else if (lowerMsg.contains('profile') ||
      lowerMsg.contains('edit profile') ||
      lowerMsg.contains('change password')) {
    botResponse = """
**Profile actions**

• **Edit Profile:** Profile → *Edit Profile*  
• **Change Password:** Profile → *Change Password*
""";

  /* ────────── Case 5: Delete account ────────── */
  } else if (lowerMsg.contains('delete account')) {
    botResponse = """
**Delete your account**

1. Go to **Profile** → *Delete Account*.  
2. Enter your password to confirm.  

⚠️  *This is permanent – all data will be removed.*
""";

  /* ────────── Default: Ask Gemini ────────── */
  } else {
    try {
      final response =
          await model.generateContent([Content.text(message)]);
      botResponse = response.text ?? "Sorry, I couldn’t find an answer.";
    } catch (_) {
      botResponse = "Sorry, I couldn’t answer right now. Try again later!";
    }
  }

  setState(() {
    _messages.add(ChatMessageModel(
      isUser: false,
      message: botResponse,
      date: DateTime.now(),
    ));
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          backgroundColor: kPrimaryColor,
          title: const Text(
            'Flighter Assistant',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Messages(
                    isUser: message.isUser,
                    message: message.message,
                    date: DateFormat('HH:mm').format(message.date),
                  );
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
              child: Row(
                children: [
                  Expanded(
                    flex: 15,
                    child: TextFormField(
                      controller: _userMessage,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(20)),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(20)),
                        label: const Text(
                          "Ask Flighter Assistant...",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    padding: const EdgeInsets.all(15),
                    iconSize: 30,
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(kPrimaryColor),
                      foregroundColor: WidgetStateProperty.all(Colors.white),
                      shape: WidgetStateProperty.all(
                        const CircleBorder(),
                      ),
                    ),
                    onPressed: () {
                      sendMessage();
                    },
                    icon: const Icon(Icons.send),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
