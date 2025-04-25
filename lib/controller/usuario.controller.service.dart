import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:transifox/model/usuario.model.module.dart';
import 'package:transifox/service/usuario.module.service.dart';

class UsuarioController extends GetxController {
  UsuarioService gestionUser = UsuarioService();

  Future<String> registrarUser(Usuario usuarioRe) async {
    try {
      return await gestionUser.registrarUsuario(usuarioRe);
    } catch (e) {
      return 'Erro al registrar el User $e';
    }
  }

  Future<List<Usuario>> consultarUsers() async {
    try {
      return await gestionUser.consultarUsuario();
    } catch (e) {
      return [];
    }
  }

  Future<bool> verificarUser(Usuario usuarioRe) async {
    try {
      return await gestionUser.verificarCuenta(usuarioRe);
    } catch (e) {
      return false;
    }
  }

  Future<Usuario> consultarUserporId(Usuario usuarioRe) async {
    try {
      return await gestionUser.getUsuarioEspecifico(usuarioRe);
    } catch (e) {
      return Usuario(Cedula: '100202', Clave: '10505', Email: '50505');
    }
  }

  /* Future<String> actualizarUsuarios(Usuario usuarioRecibido) async {
    try {
      return await gestionUser.actualizarUsuarios(usuarioRecibido);
    } catch (error) {
      return 'Error al actualizar el Usuario';
    }
  }

  Future<String> eliminarUsuarios(int idUsuario) async {
    try {
      return await gestionUser.eliminarUsuarios(idUsuario);
    } catch (error) {
      return 'Error al eliminar el Usuario';
    }
  } */
}
