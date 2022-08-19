import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../core/shared_preferences/bilibili_shared_preference.dart';
import '../../../core/shared_preferences/shared_preference_util.dart';
import '../../shared/params_sign.dart';
import 'login_state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();
  changeLoginType() {
    state.loginTypeIsMessage = !state.loginTypeIsMessage;
    update();
  }
  updateUserName(String text) {
    state.userNameText = text;
  }
  updatePassword(String text) {
    state.passwordText = text;
  }
  updateTel(String text) {
    state.telText = text;
  }
  ///发送短信
  void sendSMS() {
    SmartDialog.showToast("已发送验证码短信");
    ///格式必须加入单引号，key和value都要加，否则格式有误
    Map<String, dynamic> originalQuery = {
      'appkey': state.appKey,
      'build': '6720300',
      'buvid': 'XZBF5D5B82C2D9D36FA139ED863534AC258FF',
      'c_locale': 'zh_CN',
      'channel': 'html5_search_baidu',
      'cid': '86',
      'device_tourist_id': '20096420566197',
      'disable_rcmd': '0',
      'local_id': 'XZBF5D5B82C2D9D36FA139ED863534AC258FF',
      'login_session_id': '0423050c1436b3354f14ef999b581179',
      'mobi_app': 'android',
      'platform': 'android',
      's_locale': 'zh_CN',
      'spm_id': 'main.my-information.my-login.0',
      'statistics': '{"appId":1,"platform":3,"version":"6.72.0","abtest":""}',
      'tel': state.telText,
      'ts': '1658880357'
    };

    ///加上sign字段
    final signEntry = <String, dynamic>{
      'sign': ParamsSign.getSign(originalQuery)
    };
    originalQuery.addEntries(signEntry.entries);

    ///表单格式提交数据(FormData为dio包里的）
    FormData data = FormData.fromMap(originalQuery);
    HYLoginRequest.sendSMSMessage(data).then((value) {
      state.captchaKey = jsonDecode(value)["data"]["captcha_key"];
    });
  }

  ///短信验证码登录
  void messageVerifyLogin(
      String tel, String code, String captchaKey, String cid) {
    ///获取公钥key和盐值hash
    HYLoginRequest.getPassportLogin().then((value) {
      Map<String, dynamic> originalQuery = {
        'appkey': state.appKey,
        'bili_local_id':
        'b7728df0958a2ea81523b27e974a2fd2202207211020261e67b331a310d1da6c',
        'build': '6720300',
        'buvid': 'XZBF5D5B82C2D9D36FA139ED863534AC258FF',
        'c_locale': 'zh_CN',
        'captcha_key': captchaKey,
        'channel': 'html5_search_baidu',
        'cid': cid,
        'code': code,
        'device': 'phone',
        'device_id':
        'b7728df0958a2ea81523b27e974a2fd2202207211020261e67b331a310d1da6c',
        'device_meta':
        'C35D369BE3FD8409C3E56EC5B9F02BA98CEC89439D32C383A1A0EA7267DE91891D3086D0004416EDF8BEABFC20116B5BCBAAB574CE5502FCCB8624D130B047C3B86206706708B5254B17C3F3C431F776A50546FBF5B8F29D457A4D8101C8D76998E3C0DAAB652AD2FBC9CFF467AED7B0BC0DB96A1854ED355FE7164A861E03F009AE9A34D0346186B16C56FA427D1D5A383A45886332CDF25AB8C95EBCF09E7551B089A2C12F1C381A0C647BB3EBE0C3BF80EB69EDB7268027C79DC348D012897DB6D7367F6FD69F66A88E894085F8F5882255C4A9643A5D1366217DADCD46EA75DAA1D9D75EA65C8AD2DC608455EDA8E7F47BCBC0A53E025AED01DD1FE6E1ED6F55C8869583DDD2115D0EDC51AF0BB56B5AE3D40B16E6D812BC184396EB3C1633B7055CC1AC2BC5A92D7BD8BC0B9BF02FCF0DF4FE145DC32DBA01B6E15975CED431CECD8AACD67CEE64443E205A115AFFAE10A8F780BAB748FDBB67B11BEA52BE3FC7F364EE1691B10F0A63A049788E6C78374C057DD6FD51E1596450A7F16DDEF14B61F66E51D5FD726420BBBD89DB849B8A0F82B7866AA43F84359BD6CA2FC4B2FE2F09634D1EF57B08154B3AA548791F5387B5720469860C6458D63D56338C9945EAE86D0CB71F0ED28BD3B190E77A86D2DA6B65777EB5D1CF5CDC83053C6A47EF161822CC4A6C95B9ACE6F8CB86631D511E29CDAD931FC8BD21C07158F26D3B7C445CFD0EAB139989E08B0EDA3F76AB3050CAB6D4873F249BB881D7330A53074CCCC9748FAB259BDB81978E0B7C1AE21ED80D61E0467BCA33AF39FF189D517362C05D1DCF351965D6AEB069A2D5289809C056DE25134782B1FFE3828B96B3A2F01B17D75AE48B7D0FD9C285DAE25803B4D5E366CE61B91A8BD01054F75EA9F7A42E0E5EA5B255429EE3029EFA1E5A875F5274FCB9E8C4D4FD2EDCCAAF13B35BB5316A0AD50BA44DE0B068FA8DEC787626FC5F1FD1490D67F1E9C6CFF579E25E1926FC7CC41F7F05442EC2E98F05158671B67EC6D12760EFDD240B56E06F0895B64F33982393CB88EF51CE4849F87CAA25B8A8DA0E44706FFE3F969A8990E94DE08C6189441C1A80204A2BE3F3829E65BFC06B4600FF6AD1C68C0A4E496E15C868DBC58F5CF0DF67794A574B557AC08BEF50CC2EC231931B66D079DFCBC4EB96B656C773345446B47C8A17EC7B1DEB94866D0EED3DE54708CFACA195AF6A7991D3399860985EFD52F4468C4F5B7CA874B3512B30588F353570DE4224D510980DB3AE444A645CEABD4FC580C5D25A230BC9D58591398A1B2B3F40627A08E46B1415612ED38EAD83370F84AF6094066E7FB242D5D06FBB78105E7CC3B60010462F89224377C24C19F44FC0070F6BB231AB4F3766EC1D72B1DF06638344BC0908C37F9FAF1B6B59C316C22A34C6EAF0EE8F9E4894C07F3F03A5A2F287EB468964E1621E51FD98DE5641E6696E8CA7FA046386B99AF60D7A70A7F9682E702B4742DD74C16BFFCA5703BD7C7EBB495B1373DD0DEA41D60AA047C782B759068CC8653C104B1665647F42F6CC48D8AB2BFE48205C42F58AE3023F5DF428FB9CF913C49D7B2E19ADD76FD7A10F381D284A612869F1560B1F384447AA982D7B329D292B538ADE024030D89A6362EFED5254B64ECD2C9FEA1EDA0879151BEB39BD8BB12F832B1EAACB657F00FEF2ECD4A45B360C8D9AE1D7C70A07E60F534E927C7AD044EBC4A26CA411F68AF7C5D0985FBABB22BC9AD2678B2ABC0058D326861FF530BA99C215383079E263D73EFA95B732A0B2763F2A6E087D18422C4E1CB210145337391CB734F4DB354B0FAA1DD6A63157CB01D64829BA78E1FAA59965B4A30F0D98E77D1D4F515D29557E3909EBE568966ABBCBE8071ADBB709943EA80A31B225916C739538DEB8F85ACFCBCEA3DAAF9D8CD1FEDC19A4289726FAC5086996173700BEE98138E4B2E473E8C735189E06013F1E44DD134C4E2AE6684B22C5DA02BCB9D9F98293B1996B86257EB36EEE989904ADB312D9C3977595355D7635B1D55D568307D4BB3375DDD50A92C4BAC28C0DDC12B0E6B4530505A79BF9CBC92E211C904193D204C8E819F260F0108513742B15E7B4241DB1490C257E6A53EEDB339688FDCED8DCAA9B09415A48FB8036C843DE038D3CB0184904C7A238598D7FA16CAF55658936EF884498E945161E9329895E2D22B1B420C02DADE7FE494DB243550F0E58D03D1DE9D1F517449CBA7DB1825DEF45B555D652C9AEF86B2980C881F406E868493C363B12F7855FDE2C60DC947926CAD7E7EC976FBE7E22387F01A4AA2ABA6265564FD5A8E05BDD770489090D9E71DDD96AB9AFBC68B9AB27E892A76C8477D12E02380405A9D4FC195C008F18884C001E5EC1AAC4A9547AA04F637AA149E6872920928DA2B8C93D5AF40BDEB82FDE3F1C30D4460C875EA7E56BD9F20A7000DC6E5C20BFD4063E892E6E6462DBBC39BB1116ABE994AB24839EAD6B0CEEBF71DA70C94665A5F2E01DFDC2C1A67CBBC1AD667212A5D96D6C4F8340052005EDC1C7A3B05893139775AE4D855A38CAC85DCF37D9F47D3180DEA77DA98343233D331B729755614D9484B0AF49C8E64F047DB977DE605DAD0869EA4B0F8B79501B1EF69DA5DBFD889074289A0E36FAEEEBB96AEA693DC75CB2F75C4EE176669B728915A703D4190CC2EDCA2DE6980F5AF413E276238E3B9F4B293422AEACA3EE42032551794A72EC4E235BF25FA0C5805D9F01940607F873EF99F0E18D8883999A4A2ECE20974EB7CE826EBCAA2A31618D2FD67B91A5F0E5DBAC769931821677BDA46E587651B10DB04811D81CD9D431CB104FBDBFA47D029097D473ACB54B9AB1EA653EAE94A59B27B7A40B98F7A3A6428A0608E7C34ABEF2BB7D72767F80175647EF66A9B4089B999BF61222D7BFDC1AB4C1AF17398C7C80981FA90A76AE3ACB52D3E8BFF553201E6C55E1CE3E7F59FAF2BF233166FDB518FF598FA92AE4199202B8511937FD5224C90D17E45051E4E861DB898DDAE86D1B7102B5A7FF38E922A5DFE593AC9080C4DC9C1A5292D476A89576DC789D6EDC47D9B77E9FCAD2CA0AD6EDC8EE0AF631110D97192B50EC0936B5CB1D7B650F611D5395F7BE3B2F39D722014A3F7BE63DDA9A0F36FC14A916225CBA92B0C74A1572E2BADD8EF760DB1D7F3620C963C8BA9B2B2EAC23D98B124AF34264AFDA67487BC262347AC7AF9A677CB113E8FE2246F6E84CB777BE411FD3632F339A772E51BF8C6FC3E38359FF1D86F76A1AADD353CEAF7BD5CFBFD4CF4E077A361C89BCBDF31E55BE51416A8C84B4A379467AEEECF2CB56957F326AEF2E0E4DDAE078312A10CFC9998436A58339BEFDF453F4988A6A5392B7AE975FDFACD7EA3705AD0E7CA9FEE770D4BE9CF5343EAB86EAC1F1C5B32804BDF23864BF856A74E4C15893F88A05690AD5F486B4ED33FBB8BAA7D2EECF725DA076DA0D1605D76303721EC40DD0555A61A03AC9CBE0DDAB362E5ED7605E13BD5D40F9426FB22F54F0090F600B5BF628588D1834BE67D25C3AD41C8A655B8D658052F35F839FEEB2F546CFE53628E8B46CC904E1F99703F058AEF948B966DC8C9C7E669553A4450721E559F0C5087CA101ABC882BE91301B025E68BE6F901E9E408A88195209DABAA0475BBFD201FF2005CCE8BE739C6F135AC79BD4E4AF17B66DCA7CD124089425162C41970311B11338DFE778841F2F6B4AFD7957B6C66A882945D6C8A4A520B63E107DAA845D98BC5720C8AAFBD3B5B8B559ACC4575354D602F4F59636A32CCCB7883A74FC33916935CFCB6A63DA7EC9472BA53897A1B0CD903C9FB27EE7482BBCF1E855BEEA6992BCD623425B454611EE7016DF1AF04AD646140AEE10712B3696AABA4CEE4969E79381DBD7CAF10CB4BFC8EBD5C3E79410DC4E29171AE5106EB08D23E3AE20394D0CEC722E5FAC26CB06E0629D015AB5A5C67F55379FCFD434557C0950A4FC2C4FC633E39A8042A0211ADBE28A6A2DF5B30822BF37766249FCDAB532D2EB5C0C22C6DA798611C4D8B612A747E22734F2EF184EF5272BF2229546995CDA768D1359540E7C06546E09F059F7B02FE3AFF600DCD63B580979B65142B09BB374D229B5892EA3E24BC139CA4CD9D4991EA31086189C1C5D6AB6838AE7A53949D7F3BCB522C3601DF6C1C905D1AB898FD7D0211451D9EEACF2AF751BB20734184954B77DB3BAE67314B9F470DF05DE135F766CFD5E93AA05ECCBC65DEAEBD6FDA411424425C3D5862EE7F88632251CEA5E0CF5EADED098481A95FFE6F14B503475B2E9F002F7115E3524BEDEB6EE90910CAE84749448BB6F7F2CF3E5532E5E278A4EA2CD75D87AC4B9EB1D2E6605CDF7DB891644B722C6C0E6422D3F457C6F18F5770EA6ECD15C851AD944CF58AF6EAC86347AE7EEC01B65018417537ABDB6DEA2E3439ABEA649C0A957248BC19D07056D03637037BD5B2AC39D04A60B00AE013C7FAB7AD14FA413BC15967C8C3247C1CEBD68CB144CF841609C5A0D4296B8985C3F39A00FB7FAEEC6574434E741252786FA6B7B32BBEC765CBA9A19BC6B7FE33A3EDCA722B34D58F4402A3F03963B8EF2941EC01E6448E5307FC2B21FA3DA14A19649ABA780F83626B49652ACEC54802DD2E6A8D30C406C5CABD7AF2557A40DA9A6979D735365920EFDA28ECD0E7E635774FAFF58379DDED0F00DC2B98D33261FD67E7DE2D19E0814EDCDBD7B2EA8194469F6B661F8375A971DCE0E77CBC2FE075FF1F819881B568B25B22DD80C67D34D89205ABB25163627F6086FC04A1B141398A91F9B0CD4DE6C39B60CF25E935F9A817B0EE1522C7738B28B121F5A65B5E213905067E94FE3393F2C11E550A436D36A12D5752A3F8BB033C660DE59114A5919E73DD3C4A03F96412CB6BAEBB1EF4524DE3E68589BCA2FD04628C9B287C89CBB2C8376E5BC58B697FF93B597AB93A06C93DCEBB1099FE920C1AFF2CB9243E40655A0AB988CD257DFAB241584A659BA5AF73474DCA77DAF75DA205512B749480C7061B65B985A3C5A95CAA118A95C7C65D48A5A2CDB18CC5EBD61752FEA5BF42D6A061C8C81AA6E15BF99C2E90AC2612CB270CD0B4B7303A36B328D7B00A7847C482DCACC90A2FBC732DA74E45E0BFB20C428729967A6CC9CA0054134E74724E9FD4692B62C0BC826DF6D0428CC9A535C379AF500B88DC7692ACDB702FEAA148F905EE450F2CDA72F06D222270EEC9C72F098B20C1B79087477F8F49FD42859D02D51C5286A8608CFDBA45DACE75F618A32C1D7AF68B50E6D77462174DEA7108E85DF1E78C3B79054842663B81C35894A9DBA005CCCF51A1CCEA6304E4AE1D5C1CA78AAA7A3621A294DD7B89AF0DC66E8F2BD0474770DFF2E112D7BD02763D2ED30F6D49AABB1F87E3E5DDAD9C0286F872C8CAAA19F8CC641DD77E02D4F78F26E35455D80AD1F3A01C415790A257BA3297E38D8A7670549F6D04A9E5E3D29152DCF7F673FB850602A61B840F09B6C1D7804747B3661BDD8821599291A9C2DB3126A2F9FD860BBE0D910F27956C2FE9103D3C2E2A7607BBD5B2A5EB6ABADE3B82FA5F0B32D4243112D0D7AB20C8C639EDEF71E911B804D8FD83B89F21CE01FF7013AC4B8E16CB5A5FD04006108F6C1EE31FD6F004ABE99A5D461D5AF9C4E20E868990421B084A88BB56981F260DBA08D8C66DDA5D805408BB0D180358CDDC4F38B9A303A3C76D8569D4398812AC7FE2A708783AEAAE0003D02B743DCD736924FD67F72624F71BD50DD8D37C04309BD548160C590501E204606B2B12058B45B98137620DDA309CA77CC92C74FC5D86DC44DADF0D63B53B79B7D1B3FC3F90E59226024B847D825E803842BC649F38238AB7AB938F5EDD39B0EC4CE65EB9EFAB1D02E9A7D195F57C4E394A6FF101F4FE43157E5F7F3FFB1C1C03DBA035785919EC51C72E0A0642020C53D61296DF35E8BCEDE9EE324CC9EA3BA01CB3517A4F30C2F8B70B47DE89965E91B78AEF779D718DFBB04D46961B3A703895FD9504F7E054EBC5E4B89BAB900B6307BA1C539D1FFD8C5C4DC63B1D49CC7BF39FD6A04C27D47792A387E3D965C13E4C89A72B959100EF41014567119A52B165474C3479DC67BD5C509B603D586859523062F6CE007B543CCBD1BD8F0420641981CACF60604ED844C9D42AF0397744B8EC025C71B4178EC40E5F1D82C189BF6B993B13749F0EDA8738DDB59933C7FDDD338C104EE74A19910D72AC2CEAB5E7677FE460B466BC8E880FA1B59966280B87F3E9D02F4E4001BEC56B30E3BD5164CB8C99F9A5FA528FAEADF736531F583A9742C83C9FA973EA28F8F74BA7A9DB2FF99BCACC10E1BD6ACDE49C1BD4B065500F55B7AAD4567BF0DD72BFC423039540D38578F612C7BF42FBBDB87A7A7118899ECE3C035344845B403343998B67A8223DA1D538BDE8148B6CD50D7E618C888D6C3AB32D5E9B03B4493A14278F437B3F0E7757105CC15BD5457AA2C28DF453219D1597217DFEAC5DE6CD44A9EF4F4507C67DA5070D8AA7CE319BE9559DCEE0783ED8510E854722E6E79E5A3BC866D0396B652191B41E164762EA2D03C8FE283DB2EAE242EEACB2148E34BCF031418BDB137182A4EFAA5970407893E7EE4D36BFF7231F0EDDA5002F9ED1F11024EACFD4A8857512F0A751540D092D95FBCDBD7CE5961B9E64C6F384800BD62C36CB00A6F42FE103EA89EC52FC8603EF91DAF0EAE14B6AD7E21C6602E83ACE524087D65EC707679758A793F9BFF6A4A798E15F1F4906109FF6D79FD3205F02192865FA87BB2F3BA9F0E3DF76DA01AD2C97D4DDFB10C3D57F1509DD5FCC2BA027B278F78AE612BA89B9A49C27F08BC812FE84FF84616FC7CD04B8DA47A367D6563940B72C2495F2CD3D5226432F2D6F7D7637B4B573A1AB3A21A4D07CFFEF41302178D72935E857AC855FC71C7B6EA2DF0CC95553A72FB80F57693AAD5ACAA7F2896008CC5AC39B24EE0483F15B4F74AF7F1BCCA7506A2C1014DB982A63ACB21AFCF7D99A3EAC4B2E7AAEB31217F4FE3010BCDF8C67C4DB786F241A39F0D4625CE10C75E307B050C977C27C374C9F35C1FE483EBF3195029A8CE1C7482F8CBBEA76A0BBCC5E4219A2CD9C597D40BAC49BF5BBE29FCCB67150199AE44919DA59EAAD04B3B5781949477BFF78A24BB0971CF82649A151B7CB1094A536D38F9B7F6BECBAFF9DE72680B346C4CD98352CEACC5047064DB096A12B9589213E9ADE941DF22348899B9E5EFAABA475BE5DA163E59CEC4843312DA491907D837BF1A7A79C708B7EA199A79087C1C83961708638F5F4EEB255215D184341D476C4AD8EA6D70D165CCE818809655625207266C44FFE0CAB4503B9469E79C08195BFB5BDAA5F5F940CF5384A52BF71703E1EF7E598BB3DE716A16E5E2603830FB7479A499E290F25BE303E60D510E050CCAE21B9A00F0116B4629DAF92F5857D0E7213F74EDE9FE4D28CBF3508E03332B619C39331DBC08835B21C51861314A6635862509B1AD92E5EB3A823177CE8078C1D523A13B835ADDDA50050859EE1E03E0E3DDE877A20837D678C4C16C14C16EA10A4F196E77EAC03D3AFA09DB097D828C6F3D74AEA4EF370AAF1C451A25F052BCE7192E50ED20C38A57BA441CBF95F77E7114D8B43BDFF6F4CCF2CB4250FE5C767626E88406560AA623326DB9A929D66CA4CA522C0CA7402D0F116D04B3D3B55A691E172921486AD9563A4AFFA9114B0F2F639D155DD862D88D7EB4AB33C1D44F9B7E4CFBDC81D4C71C08FAA516C7E73A90662D8C255293B8D54F76096CFB362C11E18AF953F80FF849BD95F4797574948D45E2585C3092C065B4683BD1AEA0CC6B329134B4B26EB7D52528FFAB92AE9B4DE9D3FDF5DC22E1A5A82BBAD07E98521CF0F4A3BC419F0841059FDDE80DFB2D26DE5513466687758E60A719A46B2CF3A2896273EDD33AC7FB424DE928E0A633C332E50FD54993C4FA3E605874F8C3729D38273268B0490CD89A0D6214ADBF81012EAD33A979C920D1E72BC84DC0A92501D853536C4FDB2EFFD1872D08E25790067FEE50F112BBAA2EB4C5D44E82EAD2DE73A470764DA2D1EE28A9A58DFF829D8DF252422230A6922100E639F5DA92ECE48B6925C14D2E82A28D5442B3077C0599A06CAC304147998D111279B1E8D496D3F601A6FF0897D366B1B0F750B8F26E0418EDDE6561ADE6FE1D43303A7AE51A97F746D054681442A5FAB06BD468CE54C82A57FA8755086CB0157186D37C0016B51B6033742F70E1DDB6DA681DECA9383982715F32572AE0875A76BAF8330FF49342A755B5CB0BE9A8A69BD500C3B076A1EB86C7BCC24E88FAEF8E71996B0C051BD2EB741F595E0B19C68D4C170D85B4DBFC4C1110D2ACD1D635D6CCD712522122F1D758E15E586C561FF498602CC20B2465E615AEC2C1F5DE05583D59E3DAD82F8789526D3FD3856408CF49A4D8A955B37D916684A56AF1F46102C6E9BD7F7F9F0CC43D3F7C19C1E690798C05A670063D37A056AA5EB352A65B2B94F2F5A3129DF6EE926810F6CB5C036DF1829FC55F5AFB3311F405088CB15A65A1EAF8983B622B4492E003E20FEC570398DBDE74590F77C4199B914AFEFFF7DD75CBD81DEA403D9A661E434BB4939C9D6A1903C15F6FC52A43CE85B2F0576842678EE0D56A4EB71C3E8A15C440E86FF14D5B411D74634DD5A7921E68AD2F760220E6F8F9B7B6F8D4A2CFD65ED58305EC632283052ED05802D421D43C0EC28152876AC74C71C6B45547158C8CFF2A99C63908CCBC1CB2266661989FDC9BB4BAE132AAA0C0A13D46EE99BF6DBEBEBA95508E0FFBB17AD72F3354C5D6C0AD51D247DC8D2A728A86D906DABC62F664186D86999B465290E38CA2D719BEDBA117F3580C97E3417C7AE6D93BDC1EDD1B757EA629FE85459A414A344646D768C655FD2C86E3B55A3DDCDC934008C66F053528ECCF054570495D0D17399DB82D3DA6BF66D2BFF3FF5CDC21C5C308F4FE4D961DBAD6E2E59ACA8172B8CA47CC02FFE25E9EC1A2527B5B5ED42A8EAD8674D2558930DC05C3351DFF6EF56BDFA7D65A2F5EE339A2B12F4BF1BB0FC5EB0709F857970B6B2E7EB5A3BFA6E1E2D0710C6E4020E30A003EAD9BD0D06797208A8BAF5410DF9A10B43B808252B394ED3232C33F9899B092E0074DD019E6ED7E82A1C5474886FCC28D2DC5115C529C8149C612731C39360317C602754F477CBBDE29961F9FF7B667E1FAB987915F994AD3DD750E0A6E2FBEB40080322949D7DDF0DA5204C3CE441B2B32C888C7E92BF33025104ACCB9883B31A7117BA7618EF489E13CC3964D50D1ADE06B90C436876AC2DAD2BA2D0EF669AE76CB1E3F9E740D6EBFD72A417DB43BB7DCB684358E02CF8055040698ED2ECE0415C0FE1F7AF2BBE2D357C640E15A6F41A892E332E31E96A4A22EF4EFD51EC9639E1AAA2CB08DC8E599C69A1E19F32C3487BD75D7936607FBB3FC6CE8778A962C17256F14D41D010EEA2B04B8541685B038E69C8658C2AE814E47612295D757AF78FD43529C13994E708250E17EC0B90B95D1897A5FEE8C44993E221760BB6F9A63B87E73C8E83E33FCC666918A3D871421375EBDDE5520BA56E1F0E16483E8E18137FFBFECDC9AFDE3522C9393D2EEE4A1AAEB987994DAAC286FEB4E4C472F0DD22C981551DBEDF91EA0572D8BCBF24713E3EFEDBDB103FB68C460A65C405B2F6F0C0C1E8DF894A8946AF19BA16FCDA637916B53734E9A650DAF856AA9B9D1F2195BAC37B3B876530E284C48073BF90AD5CA6EE9E3E5F79A88B7A5AF6735A210EFF09591A6682F456066C97814831ABFE332DE3E20F29E421098D06CEFFF8FAF69F67D9AA5CCFF10EE0E0032C56584653A5B8517D5A3F304D59DB801A383A632759B1C91E9EDC1088343A352A63D952B92EB5987033069B0D27EAC8EF50A066250F22E14B24D30E39DA83FF60D0F2D3A6D486AA72A7160926E38EF3BE8F14250A3BA1E6FC1A87EFD0DFDCC806B0A776CCE85E66D6916FB9C4505CD78F0CF406FED39CD7264DBAEBAE926B6B715C89C035977E9210CDD6CD6146AD1B8D5F30B20CFAE5BC72548F8314BB287DB74714FE992A9E4DCCA7C59A191A064930C79874220FCA0C6551EBC18A04C6AA21560B3116F661B1749657125AC55BA19A810D3B64CD3819E761E4DAFF402161D07B6FD6EFC41DD848FFD56DC4C09FD437B92AB235E7F0B89A8A0B546DC39C50B7C0CD36CD7F93C29727059EB0FD1D47ED4088559FAAA31BEFF2B59C081FAECC4260EFD8064047168FFEEA40CB37A40070C78BAC76BF248E2C83B0A02B4E8859E56D8EBB78B36F32692CD47D161F4877A94DE1F842AE936A25572C197312BB5E8A1A4DEC9F1DF4501835E35B19C097B000A93C0D588A1E0A01BA534A0C847FC6A25C34A60E19BC6D872A878DBA32512043E98CA54550E84ECF1F98F075C07D33C6BE439FC17677585A9B5B46F6454D60EEF4F44F6035C4D348D85EB0F052BB50B6A47D987D0805212615AEF93D717640109736E66BE96E1DAF1B6746944F49703784AB6356A9138549FAC5197B05FB5C4CF79860C76B5247B8C70E8AD52045E80B12392B9775CD990E9971D6830FDFF14C1FB79798622B6B4B2D234BCCBE5AE1849A6B5A985FC877B3935A051EB0832B6EDA49F633AFF83034A543C1DCB5EC4E26892DD671BFF73284C23987154EA7248138659F6EB9BE0EDDBF8842325CD17741A0E563DC32CBE5B84155DC7FE2CDE496755DF4F902453967FA2BD596586DDF6BB4ED187BDCB2EF8F545E85F66589334EC351470019D4710F6C6D47B031B5B7C0360596B6A6773D2C6529D065033BCF81498C0E1FD46356A8E99A9AB81D7954D483B9D66CC2932B68E558D7FCBD06A481F1C7B0B3C70027A525AEAA6F7BFFC2FA1AA9F2080F6605E051517A338A188F651D576426BF9851FD6DC80B9D96E79B49ADF2A0F49A23717469D3FC5653CA9FB65555287128CEF1A252F44276576811DA72A8CDF7878597626131E7E0085F65B5051D680768E013B58C83FFCC0390CFCB2A73CA38DCA5C35D4E08E812EA5198461534F2C4B3D67E2BA81EB13D8DF310638F95E7DECE440B2C130234E941EFDE50BA2AF4ED130B78121DB4551E41A4B555DD266196E8BDD106B682435CB46E551BDEAAFBB2FA3E7CDE43DE8FC2B854548E46E29973FB0C780C8D6B54DA62370920E3973A5823E7A4D76BA7F2497B9A4751A7418653A472AC43D6F5812816A52A4629F763010ED1DEECBE3E9FF148455CF7BC39128EEB10C723D6DAD4255DD86BD5FB77A82B29E5DDC88F45CACE7C730703286856B6083CE01197246B87FF393F182FF4FE50F4615EF1F91CB877B6BAB71BF72856E6BE19F05E90CA0FBD9E6700C24EC5AB8C89222DDA2EDC3EE9BFF449239AC01E963D50AAED83EFA841DEB8BD2AAE15B74EF6F8F4F94DDE40D8E3B61226C37962870FD1836EC2CF9FA6B1ABE01DCF0CE6B3532236985421FAFE317609D7EBDEB163444FA848A36BE23CCF58580D9FCB317DC6D4193317339CD51771917E385C31D33AB01CC0522BC356237A8850DDF52E7F5E6D080D07694D6EE4E2706687174C4DFC3FD188B3E088D1D45E27DEFD1E164106D5B960A764E944B8577E57B5526D152610C796D4A2F7AB77E3843326C408DE3B318F4869518DA0E350493BE91712F71E6712786B27E6ED7CECD8258C9B02C4F6437235AECC880A05390379E84BE71137C6D259C22B30E4CED766AA9917066B08443CCDC4E57053862E830842453D580B3F9BF618C0F55911BDF7DD67493815590734D882B771F924E77A8F322CBD7754C994F27BD83686DF60E56588FD0811E6FF632FB3E82CBFDF8C38902746723DC961FF290B79AC4CD1C20A1924C6CF524A83A0A20BAE20598B46BBFCC9B7CE47668C33AC97C34C4C1F0787506FB46F0DE02480EE22F9054C27703C5654128305618810CFD15010A7C22FE9679547C7523F254F1AA9A11E2FDE8AF2FE1199C0BC74D338F4AB0DAD8733DCCCA8237A924C80A6BBEA96BA793A1F4CB7D4C9E3AEF683859A96BA4EB67B5416F3D0C6C725A8F3A490AA63508AA6863CA07516EAEFA693A5F1AB23B4C1ED955181E4220CE4537BFD0EB7EA1E3D5D6988F6BA82462D0F7217DB55B859598AEA7450C0C0EB79E34C38727EC5C84B3EB0ED6165B4194361A7FB7133329B6507A4B297B560134690D6F383CAFAA073E7342DE4A1D367A938B172B1C79EBDC9BD64A44CF4BF698073B58C69254C9568D46F89431925905E92DB2EEBBCDE07F57D034',
        'device_name': 'NeteaseMuMu',
        'device_platform': 'Android6.0.1NeteaseMuMu',
        'device_tourist_id': '20096420566197',
        'disable_rcmd': '0',
        'dt':
        'ZRugblkbHqzfOXfy4vE/BYgHUZkBTziyqq7r/HWFDG4kVQU+d+0EOqjEkoBdRtZO1ZvCV6L+0XVP3I3OQBzXKDlgmX1vJ16cDhginaA9+/bSHY2J+N2aZXcvZTFgQyiuJz2IfkbCPUIGhY9q0wMGRWSB7VZRTwsQPnXJOxUoz8M=',
        'from_pv': 'main.my-information.my-login.0.click',
        'from_url': 'bilibili://user_center/mine',
        'local_id': 'XZBF5D5B82C2D9D36FA139ED863534AC258FF',
        'login_session_id': 'ee4ede33ed3575d536ca23b605542b55',
        'mobi_app': 'android',
        'platform': 'android',
        's_locale': 'zh_CN',
        'spm_id': 'main.my-information.my-login.0',
        'statistics': '{"appId":1,"platform":3,"version":"6.72.0","abtest":""}',
        'tel': tel,
        'ts': '1658974686'
      };

      ///加上sign字段
      final signEntry = <String, dynamic>{
        'sign': ParamsSign.getSign(originalQuery)
      };
      originalQuery.addEntries(signEntry.entries);

      ///表单格式提交数据
      FormData data = FormData.fromMap(originalQuery);

      ///短信验证码登录
      HYLoginRequest.messageCodeLogin(data).then((value) {
        int _code = jsonDecode(value)["code"];
        if (_code == 0) {
          ///保存重要数据到本地
          int mid = jsonDecode(value)["data"]["token_info"]["mid"];
          String accessToken =
          jsonDecode(value)["data"]["token_info"]["access_token"];
          String refreshToken =
          jsonDecode(value)["data"]["token_info"]["refresh_token"];
          SharedPreferenceUtil.setBool(BilibiliSharedPreference.isLogin, true);
          SharedPreferenceUtil.setInt(BilibiliSharedPreference.mid, mid);
          SharedPreferenceUtil.setString(
              BilibiliSharedPreference.accessToken, accessToken);
          SharedPreferenceUtil.setString(
              BilibiliSharedPreference.refreshToken, refreshToken);

          ///获取用户基本数据(用户的头像、粉丝....)
          Map<String, dynamic> params = {
            'access_key': accessToken,
            'appkey': state.appKey,
            'bili_link_new': '1',
            'build': '6720300',
            'c_locale': 'zh_CN',
            'channel': 'html5_search_baidu',
            'disable_rcmd': '0',
            'mobi_app': 'android',
            'platform': 'android',
            's_locale': 'zh_CN',
            'statistics':
            '%7B%22appId%22%3A1%2C%22platform%22%3A3%2C%22version%22%3A%226.72.0%22%2C%22abtest%22%3A%22%22%7D',
            'ts': '1658974686',
          };

          ///加上sign字段
          final signEntry = <String, dynamic>{
            'sign': ParamsSign.getSign(params)
          };
          params.addEntries(signEntry.entries);

          HYLoginRequest.getAccountMineData(params).then((value) {
            print(value);
            // ///将数据发往主页
            // accountMineEventBus.fire(value);
            // Navigator.of(context).pop();
          });
        } else {
          String message = jsonDecode(value)["message"];
          SmartDialog.showToast(message);
        }
      });
    });
  }
}
