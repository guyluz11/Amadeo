import 'package:amadeo_flutter/pages/section_page.dart';
import 'package:amadeo_flutter/widgets/base_scaffold_widget.dart';
import 'package:amadeo_flutter/widgets/derivation_path_chooser_widget.dart';
import 'package:amadeo_flutter/widgets/paragraph_widget.dart';
import 'package:commercio_ui/commercio_ui.dart';
import 'package:commercio_ui/ui/account/commercio_account_ui.dart';
import 'package:flutter/material.dart';

class GenerateManyAddressesPage extends SectionPageWidget {
  const GenerateManyAddressesPage({Key key})
      : super('/1-account/generate-many-addresses', 'GenerateManyAddressesPage',
            key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseScaffoldWidget(
        bodyWidget: GenerateManyAddressesPageBody());
  }
}

class GenerateManyAddressesPageBody extends StatelessWidget {
  const GenerateManyAddressesPageBody();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: const [
                GeneratePairwiseWalletWidget(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class GeneratePairwiseWalletWidget extends StatefulWidget {
  const GeneratePairwiseWalletWidget();

  @override
  _GeneratePairwiseWalletWidgetState createState() =>
      _GeneratePairwiseWalletWidgetState();
}

class _GeneratePairwiseWalletWidgetState
    extends State<GeneratePairwiseWalletWidget> {
  int derivationPathValue = 0;
  static const String baseDerivationPath = "m/44'/118'/0'/0";
  String derivationPath = "$baseDerivationPath/0";

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const ParagraphWidget(
            'Choose a derivation path value',
            padding: EdgeInsets.all(5.0),
          ),
          DerivationPathChooserWidget(
            onChanged: (selectedValue) {
              derivationPathValue = selectedValue;

              setState(() {
                derivationPath =
                    "$baseDerivationPath/${derivationPathValue.toInt()}";
              });
            },
          ),
          Container(
            width: double.infinity,
            child: const Text('Derivation path'),
          ),
          Container(
            width: double.infinity,
            child: Text(
              derivationPath,
            ),
          ),
          const ParagraphWidget(
            'Press the button to generate a pairwise wallet.',
            padding: EdgeInsets.all(5.0),
          ),
          GeneratePairwiseWalletFlatButton(
            lastDerivationPath: derivationPathValue.toString(),
            color: Theme.of(context).primaryColor,
            disabledColor: Theme.of(context).primaryColorDark,
            child: () => const Text(
              'Generate pairwise wallet',
              style: TextStyle(color: Colors.white),
            ),
            loadingChild: () => const Text(
              'Generating...',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: GeneratePairwiseWalletTextField(
                readOnly: true,
                loadingTextCallback: () => 'Loading...',
                textCallback: (state) => state.wallet.bech32Address),
          ),
        ],
      ),
    );
  }
}