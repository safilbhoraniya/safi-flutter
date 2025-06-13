import 'package:flutter/material.dart';
import 'package:nymra/project.dart';

class payment extends StatefulWidget {
  const payment({super.key});

  @override
  State<payment> createState() => _paymentState();
}

class _paymentState extends State<payment>
{
  bool _processing = false;

  void _submitPayment() {
    if (!_formkey.currentState!.validate()) {
      return;
    }

    setState(() {
      _processing = true;
    });

    // Mock delay to simulate payment processing
    Future.delayed(const Duration(seconds: 2), ()
    {
      setState(() {
        _processing = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Payment successful! Project unlocked.')),

      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => project()));
    });
  }



  TextEditingController _cardNumberController = TextEditingController();
   TextEditingController _cardNameController = TextEditingController();
   TextEditingController _expiryController = TextEditingController();
   TextEditingController _cvvController = TextEditingController();
   final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 3,
        shadowColor: Colors.black12,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Text(
                  'Unlock Paid Project',

                ),
                const SizedBox(height: 16),
                const Text(
                  'Enter your payment details below to unlock access to this premium project.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF6B7280),
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
                 SizedBox(height: 24),
                TextFormField
                  (
                  controller: _cardNumberController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Card Number',
                    hintText: '1234 5678 9012 3456',
                    prefixIcon: Icon(Icons.credit_card),
                  ),
                  validator: (value)
                    {
                      if(value!.isEmpty)
                        {
                          return "Please Enter A Card Number";
                        }
                      if(value.replaceAll(' ', '').length < 16)
                      {
                        return "Wrong Card Number";

                      }
                      return null;
                    }
                ),
                 SizedBox(height: 16),
                TextFormField
                  (
                  controller: _cardNameController,
                  decoration: const InputDecoration(
                    labelText: 'Name on Card',
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                  validator: (value)
                    {
                      if(value!.isEmpty)
                        {
                          return "Please Enter A Card Name";
                        }
                    }
                ),

                 SizedBox(height: 16),
                Row
                  (
                  children:
                  [
                    Expanded
                      (
                      child: TextFormField
                        (
                        controller: _expiryController,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          labelText: 'Expiry Date',
                          hintText: 'MM/YY',
                          prefixIcon: Icon(Icons.calendar_today_outlined),
                        ),
                          validator: (value)
                          {
                            if(value!.isEmpty)
                            {
                              return "Please Enter A Expiry Date";
                            }
                            if (!RegExp(r'^\d{2}/\d{2}$').hasMatch(value))
                              {
                                return "Use MM/YY Format";

                              }
                          }
                      ),
                    ),
                     SizedBox(width: 16),
                    Expanded
                      (
                      child: TextFormField
                        (
                        controller: _cvvController,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'CVV',
                          prefixIcon: Icon(Icons.lock_outline),
                        ),
                        validator: (value)
                        {
                          if(value!.isEmpty)
                            {
                              return "Enter a Cvv";
                            }
                          if(value.length < 3 || value.length > 4)
                          {
                            return "Invalid Cvv";
                          }
                        },
                      ),
                    ),
                  ],
                ),
                 SizedBox(height: 32),
                SizedBox
                  (
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _processing ? null : _submitPayment,
                    child: _processing
                        ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2.5,
                      ),
                    )
                        : Text('Unlock Project'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
