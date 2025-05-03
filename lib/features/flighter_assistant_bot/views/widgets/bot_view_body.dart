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

  static const apiKey =flighterAssistantApiKey; 

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
      _messages.add(
        ChatMessageModel(isUser: true, message: message, date: DateTime.now()),
      );
    });

    final lowerMsg = message.toLowerCase();
    String botResponse;

    // Case 1: App usage explanation
    if (RegExp(
            r'\b(use|usage|how to use|how do i|how can i use the application)\b')
        .hasMatch(lowerMsg)) {
      botResponse = """
Here's how to use the Flighter app:

1. Search Flights: Enter the origin and destination countries, your start date, and optionally an end date for round trips. Select the number of travelers and choose Economy or Business class.

2. Select a Ticket: Pick the most suitable flight from the available offers.

3. Choose Your Seat: Select your preferred seat.

4. Payment Options: You can either pay immediately or choose to pay later (within 5 days).

5. Get Your Ticket: Once payment is complete, you’ll be able to download a PDF ticket.

6. Refund Policy: You can request a refund within 2 days of booking only if the flight is more than 5 days away.

Flighter gives you flexible payment and a seamless booking experience.
""";

      // Case 2: Offers inquiry
    } else if (lowerMsg.contains("offer")) {
      if (BlocProvider.of<GetOfferCubit>(context)
          .offersModel
          .data!
          .isNotEmpty) {
        botResponse = "Here are the current offers:\n";
        for (var ticket
            in BlocProvider.of<GetOfferCubit>(context).offersModel.data!) {
          botResponse +=
              "- ${ticket.companyName} from ${ticket.from} to ${ticket.to} on ${ticket.departureDate} at ${ticket.departureTime}, price: \$${ticket.price}, offer: ${ticket.offerPercentage ?? '0'}% off.\n";
        }
      } else {
        botResponse = "There are currently no offers available.";
      }

      // Case 3: Refund policy explanation
    } else if (lowerMsg.contains("refund") || lowerMsg.contains("cancel")) {
      botResponse = """
Refund is available only within 2 days after payment, and only if your flight date is more than 5 days from the payment date.

To request a refund:
1. Go to the Bookings page.
2. If you're eligible, you'll see a Cancel Ticket button with a Click Here option.
3. Tap Click Here to proceed with cancellation. The refund amount will be returned to the same account for security.
""";

      // Case 4: Profile management
    } else if (lowerMsg.contains("profile") ||
        lowerMsg.contains("edit profile") ||
        lowerMsg.contains("change password")) {
      botResponse = """
You can manage your profile in the following ways:

- To edit your profile: Go to Profile, then select Edit Profile.
- To change your password: Go to Profile, then choose Change Password.
""";

      // Case 5: Delete account
    } else if (lowerMsg.contains("delete account")) {
      botResponse = """
To delete your Flighter account:

1. Go to Profile.
2. Select Delete Account.
3. Enter your password to confirm deletion.

This action is permanent, so please be sure before proceeding.
""";

      // Default: Use Gemini
    } else {
      final content = [Content.text(message)];
      final GenerateContentResponse response;
      try {
        response = await model.generateContent(content);

        botResponse = response.text ?? "Sorry, I couldn't find an answer.";
      } catch (e) {
        botResponse =
            "Sorry, I couldn't answer right now.\nTry again later!!";
      }
    }

    setState(() {
      _messages.add(
        ChatMessageModel(
          isUser: false,
          message: botResponse,
          date: DateTime.now(),
        ),
      );
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
