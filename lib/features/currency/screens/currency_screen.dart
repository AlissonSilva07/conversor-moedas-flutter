import 'package:conversor_moedas/core/constants/colors.dart';
import 'package:conversor_moedas/domain/entities/currency_model.dart';
import 'package:conversor_moedas/features/currency/bloc/currency_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons_named/ionicons_named.dart';

class CurrencyPage extends StatelessWidget {
  const CurrencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CurrencyBloc, CurrencyState>(
        listener: (context, state) => {
          if (state is CurrencyError)
            {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Erro ao trazer as moedas.')),
              ),
            },
        },
        builder: (context, state) {
          if (state is CurrencyLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CurrencyLoaded) {
            return _buildUi(context, state);
          } else {
            return const Center(child: Text('Something went wrong!'));
          }
        },
      ),
    );
  }
}

void _showMyBottomSheet(
  BuildContext context,
  CurrencyState state, {
  required String inputType,
}) {
  final loadedState = state as CurrencyLoaded;
  final List<Currency> currencies = loadedState.currencies;
  final String chosenFrom = loadedState.currencyFrom;
  final String chosenTo = loadedState.currencyTo;

  showModalBottomSheet(
    context: context,
    builder: (BuildContext modalContext) {
      return BlocProvider.value(
        value: BlocProvider.of<CurrencyBloc>(context),
        child: SizedBox(
          height: 500, // Customize the height as needed
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        inputType == 'from' ? 'Moeda origem' : 'Moeda alvo',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Add your button press logic here
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 36,
                          width: 36,
                          decoration: BoxDecoration(
                            color:
                                accentColor, // Your button's background color
                            shape:
                                BoxShape.circle, // Makes the container a circle
                          ),
                          child: Icon(
                            ionicons['close_outline'],
                            color: primaryLight, // Your icon
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 1,
                    child: ListView.builder(
                      itemCount: currencies.length,
                      itemBuilder: (BuildContext context, int index) {
                        final current = currencies[index];
                        return GestureDetector(
                          onTap: () {
                            final currencyBloc = BlocProvider.of<CurrencyBloc>(
                              context,
                            );
                            currencyBloc.add(
                              UpdateCurrency(
                                selectedCode: current.code,
                                inputType: inputType,
                              ),
                            );
                            Navigator.of(context).pop();
                          },
                          child: Padding(
                            padding: EdgeInsetsGeometry.symmetric(
                              vertical: 8,
                              horizontal: 0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  ionicons['flag_outline'],
                                  color: primaryLight,
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        current.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              fontWeight: FontWeight.w700,
                                            ),
                                      ),
                                      Text(
                                        current.code,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                                if (inputType == 'from' &&
                                    chosenFrom == current.code)
                                  Icon(
                                    ionicons['checkmark_circle_outline'],
                                    color: primaryLight,
                                  ),
                                if (inputType == 'to' &&
                                    chosenTo == current.code)
                                  Icon(
                                    ionicons['checkmark_circle_outline'],
                                    color: primaryLight,
                                  ),
                              ],
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
        ),
      );
    },
  );
}

Widget _buildUi(BuildContext context, CurrencyState state) {
  final loadedState = state as CurrencyLoaded;
  final TextEditingController amountController = TextEditingController();

  return SafeArea(
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Conversor\nde Moedas',
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Converta moedas de maneira fácil e prática.',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: 32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Taxa de câmbio comercial',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 8),
                            Text(
                              '1 BRL = 0,1586 EUR',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Quantia',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 8),
                            Column(
                              children: [
                                TextField(
                                  controller: amountController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    suffixIcon: TextButton(
                                      style: Theme.of(
                                        context,
                                      ).textButtonTheme.style,
                                      onPressed: () {
                                        _showMyBottomSheet(
                                          context,
                                          loadedState,
                                          inputType: 'from',
                                        );
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            state.currencyFrom,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w700,
                                                ),
                                          ),
                                          Icon(ionicons['chevron_down']),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                            100.0,
                          ), // Adjust radius as needed
                          child: Container(
                            height: 40,
                            width: 40,
                            color: accentColor,
                            child: Icon(
                              ionicons['swap_vertical_outline'],
                              color: primaryLight,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Converter para',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 8),
                            Column(
                              children: [
                                TextField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    suffixIcon: TextButton(
                                      style: Theme.of(
                                        context,
                                      ).textButtonTheme.style,
                                      onPressed: () {
                                        _showMyBottomSheet(
                                          context,
                                          loadedState,
                                          inputType: 'to',
                                        );
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            state.currencyTo,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w700,
                                                ),
                                          ),
                                          Icon(ionicons['chevron_down']),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: Theme.of(context).elevatedButtonTheme.style,
                            onPressed: () {},
                            child: Text('Converter'),
                          ),
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            style: Theme.of(context).outlinedButtonTheme.style,
                            onPressed: () {},
                            child: Text('Resetar'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Dados obtidos da API Frankfurter',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                'frankfurter.dev',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
