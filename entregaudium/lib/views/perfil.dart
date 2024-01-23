import 'package:entregaudium/models/perfil.dart';
import 'package:entregaudium/services/api_service.dart';
import 'package:flutter/material.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {

  //Modelo Perfil para dados carregados
  Perfil? dados;

  //Bool para indicar se a tela está sendo carregada
  bool loading = true;

  //Api
  final ApiService _api = ApiService();


  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Widget body;
    if (loading) {
      body = WidgetLoading();
    } else {
      if (dados == null) {
        body = WidgetErro();
      } else {
        body = WidgetPerfil();
      }
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

  //Consulta Api
  _loadData() async {
    setState(() {
      loading = true;
    });

    try {
      var result = await _api.obterPerfil();
      if (result?.success == "true") {
        dados = result?.response;
      }
      loading = false;
    } catch (e) {
      loading = false;
    }
    setState(() {

    });
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
                      Text("${dados?.nome}", style: styleNome,),
                      Text("${dados?.cargo}",style: styleCargo,),
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
                Text("${dados?.descricao}",
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
                            Text("${dados?.totalEntregas}", style: styleIndicadorTitulo),
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
                                  Text("R\$ ${dados?.totalSaldoFormatado}", style: styleIndicadorTitulo),
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
                              Text("${dados?.nota}", style: styleIndicadorTitulo),
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
              onPressed: () {
                _loadData();
              },
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
