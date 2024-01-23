import 'package:flutter/material.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {

  //Bool para indicar se a tela está sendo carregada
  bool loading = false;

  @override
  Widget build(BuildContext context) {

    Widget body;
    if (loading) {
      body = WidgetLoading();
    } else {
      body = WidgetPerfil();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: body
    );


  }

  //Widgets
  Widget WidgetPerfil() {
    return Column(
      children: [
        Expanded(
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              SizedBox(
                height: double.maxFinite,
                width: double.infinity,
                child: Image.asset('assets/images/img_entregador.png', fit: BoxFit.cover,),
              ),

              Container(
                width: double.infinity,
                color: const Color(0xffcc2b76c9),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Nome", style: styleNome,),
                      Text("Cargo",style: styleCargo,),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          color: const Color(0xFF2E91FE),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  style: styleDescricao,
                ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Column(
                          children: [
                            Image.asset('assets/images/ic_entregas.png', height: 20),
                            Text("254", style: styleIndicadorTitulo),
                            Text('Entregas', style: styleIndicadorSubtitulo),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Divider(),
                          Expanded(
                            child: Center(
                              child: Column(
                                children: [
                                  Image.asset('assets/images/ic_saldo.png', height: 20),
                                  Text("R\$ 33,50", style: styleIndicadorTitulo),
                                  Text('Saldo', style: styleIndicadorSubtitulo),
                                ],
                              ),
                            ),
                          ),
                          Divider(),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Center(
                          child: Column(
                            children: [
                              Image.asset('assets/images/ic_nota.png', height: 20),
                              Text("4.7", style: styleIndicadorTitulo),
                              Text('Nota', style: styleIndicadorSubtitulo),
                            ],
                          ),
                        )
                    )

                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget WidgetLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget WidgetErro() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Ocorreu um erro ao obter os dados do perfil", style: TextStyle(fontSize: 16),),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Tentar novamente"),
            )
          ],
        ),
      ),
    );
  }

  Widget Divider() {
    return Container(
      color: const Color(0xFF82B4FE),
      width: 3,
      height: 60,
    );
  }

  //Estilos
  TextStyle styleNome = const TextStyle(
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.normal,
      color: Color(0xFFFFFFFF),
      fontSize: 24
  );

  TextStyle styleCargo = const TextStyle(
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w300,
      color: Color(0xFFDFE9F7),
      fontSize: 16
  );

  TextStyle styleDescricao = const TextStyle(
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.normal,
      color: Color(0xFFECF4FF),
      fontSize: 15
  );

  TextStyle styleIndicadorTitulo = const TextStyle(
      color: Colors.white,
      fontSize: 22,
  );

  TextStyle styleIndicadorSubtitulo = const TextStyle(
      color: Color(0xFFECF4FF),
      fontSize: 13,
  );
}
