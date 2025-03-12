import 'package:transifox/model/usuario.model.module.dart';
import 'package:transifox/service/Crudeco.riverpod.dart';

class UsuarioService extends CrudProvider<Usuario> {
  Future<String> registrarUsuario(Usuario usuarioRe) async {
    try {
      return await agregar(usuarioRe, 'addUsuarios');
    } catch (e) {
      return "Error al Registrar el Usuario";
    }
  }

  Future<List<Usuario>> consultarUsuario() async {
    try {
      List<Map<String, dynamic>> usermap = await consultar('getUser');
      List<Usuario> listaUser =
          usermap.map((map) => Usuario.fromJson(map)).toList();
      return listaUser;
    } catch (e) {
      print('Error al consultar los usuarios $e');
      return [];
    }
  }

   Future<Usuario> getUsuarioEspecifico(Usuario usuarioRe) async {
    try {
      Map<String, dynamic> usuarioVeri =
          await busquedaPersonalizada(usuarioRe, 'getUsuarioEspecifico');

      Usuario usuario = Usuario.fromJson(usuarioVeri);

      return usuario;
    } catch (e) {
      print(' el error es  $e');
      return Usuario(cedula: '1010',clave: '12455',correo: 'null@gmail' );
    }
  }

  Future<String> actualizarUsuarios(Usuario usuarioRe) async {
    try {
      return await actualizar(usuarioRe, 'UpdateUser');
    } catch (error) {
      return 'Error al actualizar los Usuarios';
    }
  }

  Future<String> eliminarUsuarios(int id) async {
    try {
      return await eliminar(id, 'DeleteUser');
    } catch (error) {
      return 'Error al eliminar los Usuarios';
    }
  }



  Future<bool> verificarCuenta(Usuario usuarioRe) async {
    try {
      bool usuarioVeri =
          await busquedaPersonalizada(usuarioRe, 'getUsuarioBase');

      return usuarioVeri;
    } catch (e) {
      print(' el error es  $e');
      return false;
    }
  }
}
