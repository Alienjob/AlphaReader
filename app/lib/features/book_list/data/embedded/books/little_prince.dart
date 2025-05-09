import '/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import '/domain/entities/book.dart';
import 'package:flutter/foundation.dart';
import '/alpha_image_cache.dart';

class LittlePrinceBook implements IBook {
  final Uint8List _imageData;

  LittlePrinceBook._(this._imageData);

  static Future<LittlePrinceBook> init() async {
    ByteData imageDataString = await rootBundle.load('assets/LittlePrince.png');
    return LittlePrinceBook._(imageDataString.buffer.asUint8List());
  }

  @override
  String get key {
    return 'LittlePrince';
  }

  @override
  String get title {
    return 'МАЛЕНЬКИЙ ПРИНЦ';
  }

  @override
  String get description {
    return 'СКАЗКА АНТУАНА ДЕ СЕНТ-ЭКЗЮПЕРИ «МАЛЕНЬКИЙ ПРИНЦ» С ИЛЛЮСТРАЦИЯМИ АВТОРА';
  }

  @override
  Uint8List get imageData {
    return _imageData;
  }

  @override
  Image get imageObject {
    var cache = sl<AlphaImageCache>();
    var img = cache.get(key: key);
    if (img == null) {
      cache.addUint8List(key: key, value: imageData);
      img = cache.get(key: key);
    }

    return img!;
  }

  @override
  int get length {
    return 10;
  }

  @override
  Future<String> pageText(int pageIndex) async {
    return _TextSource.getText(pageIndex);
  }

  @override
  bool get ready {
    return true;
  }
}

class _TextSource {
  static const String text1 = '''
Когда мне было шесть лет, в книге под названием «Правдивые истории», где рассказывалось про девственные леса, я увидел однажды удивительную картинку. На картинке огромная змея — удав — глотала хищного зверя. Вот как это было нарисовано:
На картинке огромная змея — удав — глотала хищного зверя... Иллюстрация Антуана де Сент-Экзюпери к повести-сказке «Маленький принц»
В книге говорилось: «Удав заглатывает свою жертву целиком, не жуя. После этого он уже не может шевельнуться и спит полгода подряд, пока не переварит пищу».
Я много раздумывал о полной приключений жизни джунглей и тоже нарисовал цветным карандашом свою первую картинку. Это был мой рисунок № 1. Вот что я нарисовал:
Я много раздумывал о полной приключений жизни джунглей и тоже нарисовал цветным карандашом свою первую картинку. Это был мой рисунок № 1. Иллюстрация Антуана де Сент-Экзюпери к повести-сказке «Маленький принц»
Я показал мое творение взрослым и спросил, не страшно ли им.
— Разве шляпа страшная? — возразили мне. А это была совсем не шляпа. Это был удав, который проглотил слона. Тогда я нарисовал удава изнутри, чтобы взрослым было понятнее. Им ведь всегда нужно все объяснять. Вот мой рисунок № 2:
Удав, который проглотил слона. Иллюстрация Антуана де Сент-Экзюпери к повести-сказке «Маленький принц»
Взрослые посоветовали мне не рисовать змей ни снаружи, ни изнутри, а побольше интересоваться географией, историей, арифметикой и правописанием. Вот как случилось, что с шести лет я отказался от блестящей карьеры художника. Потерпев неудачу с рисунками № 1 и № 2, я утратил веру в себя. Взрослые никогда ничего не понимают сами, а для детей очень утомительно без конца им все объяснять и растолковывать.
Итак, мне пришлось выбирать другую профессию, и я выучился на летчика. Облетел я чуть ли не весь свет. И география, по правде сказать, мне очень пригодилась. Я умел с первого взгляда отличить Китай от Аризоны. Это очень полезно, если ночью собьешься с пути.
На своем веку я много встречал разных серьезных людей. Я долго жил среди взрослых. Я видел их совсем близко. И от этого, признаться, не стал думать о них лучше.
Когда я встречал взрослого, который казался мне разумней и понятливей других, я показывал ему свой рисунок № 1 — я его сохранил и всегда носил с собой. Я хотел знать, вправду ли этот человек что-то понимает. Но все они отвечали мне: «Это шляпа». И я уже не говорил с ними ни об удавах, ни о джунглях, ни о звездах. Я применялся к их понятиям. Я говорил с ними об игре в бридж и гольф, о политике и о галстуках. И взрослые были очень довольны, что познакомились с таким здравомыслящим человеком.  
''';

  static const String text2 = '''
 Так я жил в одиночестве, и не с кем было мне поговорить по душам. И вот шесть лет назад пришлось мне сделать вынужденную посадку в Сахаре. Что-то сломалось в моторе моего самолета. Со мной не было ни механика, ни пассажиров, и я решил, что попробую сам все починить, хоть это и очень трудно. Я должен был исправить мотор или погибнуть. Воды у меня едва хватило бы на неделю.
Итак, в первый вечер я уснул на песке в пустыне, где на тысячи миль вокруг не было никакого жилья. Человек, потерпевший кораблекрушение и затерянный на плоту посреди океана, и тот был бы не так одинок. Вообразите же мое удивление, когда на рассвете меня разбудил чей-то тоненький голосок. Он сказал:
— Пожалуйста... нарисуй мне барашка!
— А?..
— Нарисуй мне барашка...
Я вскочил, точно надо мною грянул гром. Протер глаза. Начал осматриваться. И вижу — стоит необыкновенный какой-то малыш и серьезно меня разглядывает. Вот самый лучший его портрет, какой мне после удалось нарисовать.
Вот самый лучший его портрет, какой мне после удалось нарисовать. Иллюстрация Антуана де Сент-Экзюпери к повести-сказке «Маленький принц»
Но на моем рисунке он, конечно, далеко не так хорош, как был на самом деле. Это не моя вина. Когда мне было шесть лет, взрослые внушили мне, что художника из меня не выйдет, и я ничего не научился рисовать, кроме удавов — снаружи и изнутри.
Итак, я во все глаза смотрел на это необычайное явление. Не забудьте, я находился за тысячи миль от человеческого жилья. А между тем ничуть не похоже было, чтобы этот малыш заблудился, или до смерти устал и напуган, или умирает от голода и жажды. По его виду никак нельзя было сказать, что это ребенок, потерявшийся в необитаемой пустыне, вдалеке от всякого жилья.
Наконец ко мне вернулся дар речи, и я спросил:
— Но... что ты здесь делаешь?
И он опять попросил тихо и очень серьезно:
— Пожалуйста... нарисуй мне барашка...
Все это было так таинственно и непостижимо, что я не посмел отказаться. Хоть и нелепо это было здесь, в пустыне, на волосок от смерти, я все-таки достал из кармана лист бумаги и вечное перо. Но тут же вспомнил, что учился-то я больше географии, истории, арифметике и правописанию, — и сказал малышу (немножко даже сердито сказал), что не умею рисовать. Он ответил:
— Все равно. Нарисуй барашка.
Так как я никогда в жизни не рисовал баранов, я повторил для него одну из двух старых картинок, которые я только и умею рисовать, — удава снаружи. И очень изумился, когда малыш воскликнул:
— Нет, нет! Мне не надо слона в удаве! Удав слишком опасен, а слон слишком большой. У меня дома все очень маленькое. Мне нужен барашек. Нарисуй барашка.
И я нарисовал.
Мне нужен барашек. Нарисуй барашка. И я нарисовал. Иллюстрация Антуана де Сент-Экзюпери к повести-сказке «Маленький принц»
Он внимательно посмотрел на мой рисунок и сказал:
— Нет, этот барашек уже совсем хилый. Нарисуй другого.
Я нарисовал.
Я нарисовал другого барашка. Иллюстрация Антуана де Сент-Экзюпери к повести-сказке «Маленький принц»
Мой новый друг мягко, снисходительно улыбнулся.
— Ты же сам видишь, — сказал он, — это не барашек. Это большой баран. У него рога...
Я опять нарисовал по-другому.
Я опять нарисовал барашка по-другому. Иллюстрация Антуана де Сент-Экзюпери к повести-сказке «Маленький принц»
Но он и от этого рисунка отказался.
— Этот слишком старый. Мне нужен такой барашек, чтобы жил долго.
Тут я потерял терпение — ведь надо было поскорее разобрать мотор — и нацарапал вот что:
Вот тебе ящик. А в нем сидит твой барашек. Иллюстрация Антуана де Сент-Экзюпери к повести-сказке «Маленький принц»
И сказал малышу:
— Вот тебе ящик. А в нем сидит твой барашек.
Но как же я удивился, когда мой строгий судья вдруг просиял:
— Вот такого мне и надо! Как ты думаешь, много он ест травы?
— А что?
— Ведь у меня дома всего очень мало...
— Ему хватит. Я тебе даю совсем маленького барашка.
— Не такого уж маленького... — сказал он, наклонив голову и разглядывая рисунок. — Смотри-ка! Мой барашек уснул...
Так я познакомился с Маленьким принцем.  
''';

  static const String text3 = '''
Не скоро я понял, откуда он явился. Маленький принц засыпал меня вопросами, но, когда я спрашивал о чем-нибудь, он будто и не слышал. Лишь понемногу, из случайных, мимоходом оброненных слов мне все открылось. Так, когда он впервые увидел мой самолет (самолет я рисовать не стану, мне все равно не справиться), он спросил:
— Что это за штука?
— Это не штука. Это самолет. Мой самолет. Он летает.
И я с гордостью объяснил, что умею летать. Тогда малыш воскликнул:
— Как! Ты упал с неба?
— Да, — скромно ответил я.
— Вот забавно!..
И Маленький принц звонко засмеялся, так что меня взяла досада: я люблю, чтобы к моим злоключениям относились серьезно. Потом он прибавил:
— Значит, ты тоже явился с неба. А с какой планеты?
— Так вот разгадка его таинственного появления здесь, в пустыне! — подумал я и спросил напрямик:
— Стало быть, ты попал сюда с другой планеты?
Не скоро я понял, откуда он явился. Маленький принц засыпал меня вопросами, но, когда я спрашивал о чем-нибудь, он будто и не слышал... Иллюстрация Антуана де Сент-Экзюпери к повести-сказке «Маленький принц»
Но он не ответил. Он тихо покачал головой, разглядывая самолет:
— Ну, на этом ты не мог прилететь издалека...
И надолго задумался о чем-то. Потом вынул из кармана барашка и погрузился в созерцание этого сокровища.
Можете себе представить, как разгорелось мое любопытство от странного полупризнания о «других планетах». И я попытался разузнать побольше:
— Откуда же ты прилетел, малыш? Где твой дом? Куда ты хочешь унести барашка?
Он помолчал в раздумье, потом сказал:
— Очень хорошо, что ты дал мне ящик: барашек будет там спать по ночам.
— Ну конечно. И если ты будешь умницей, я дам тебе веревку, чтобы днем его привязывать. И колышек.
Маленький принц нахмурился:
— Привязывать? Для чего это?
— Но ведь если его не привязать, он забредет неведомо куда и потеряется.
Тут мой друг опять весело рассмеялся:
— Да куда же он пойдет?
— Мало ли куда? Все прямо, прямо, куда глаза глядят.
Тогда Маленький принц сказал серьезно:
— Это ничего, ведь у меня там очень мало места.
И прибавил не без грусти:
— Если идти все прямо да прямо, далеко не уйдешь...  
''';

  static const String text4 = '''
Так я сделал еще одно важное открытие: его родная планета вся-то величиной с дом!
Впрочем, это меня не слишком удивило. Я знал, что кроме таких больших планет, как Земля, Юпитер, Марс, Венера, существуют еще сотни других, которым даже имен не дали, и среди них такие маленькие, что их и в телескоп трудно разглядеть. Когда астроном открывает такую планетку, он дает ей не имя, а просто номер. Например, астероид 3251.
Когда астроном открывает такую планетку, он дает ей не имя, а просто номер. Например, астероид 3251. Иллюстрация Антуана де Сент-Экзюпери к повести-сказке «Маленький принц»
У меня есть серьезные основания полагать, что Маленький принц прилетел с планетки, которая называется «астероид Б-612». Этот астероид был замечен в телескоп лишь один раз, в 1909 году, одним турецким астрономом.
Астроном доложил тогда о своем замечательном открытии на Международном астрономическом конгрессе. Но никто ему не поверил, а все потому, что он был одет по-турецки. Уж такой народ эти взрослые!
Астроном доложил тогда о своем замечательном открытии на Международном астрономическом конгрессе. Но никто ему не поверил, а все потому, что он был одет по-турецки. Иллюстрация Антуана де Сент-Экзюпери к повести-сказке «Маленький принц»
К счастью для репутации астероида Б-612, правитель Турции велел своим подданным под страхом смерти носить европейское платье. В 1920 году тот астроном снова доложил о своем открытии. На этот раз он был одет по последней моде — и все с ним согласились.
В 1920 году тот астроном снова доложил о своем открытии. На этот раз он был одет по последней моде — и все с ним согласились. Иллюстрация Антуана де Сент-Экзюпери к повести-сказке «Маленький принц»
Я вам рассказал так подробно об астероиде Б-612 и даже сообщил его номер только из-за взрослых. Взрослые очень любят цифры. Когда рассказываешь им, что у тебя появился новый друг, они никогда не спросят о самом главном. Никогда они не скажут: «А какой у него голос? В какие игры он любит играть? Ловит ли он бабочек?» Они спрашивают: «Сколько ему лет? Сколько у него братьев? Сколько он весит? Сколько зарабатывает его отец?» И после этого воображают, что узнали человека. Когда говоришь взрослым: «Я видел красивый дом из розового кирпича, в окнах у него герань, а на крыше голуби», — они никак не могут представить себе этот дом. Им надо сказать: «Я видел дом за сто тысяч франков», — и тогда они восклицают: «Какая красота!»
Точно так же, если им сказать: «Вот доказательства, что Маленький принц на самом деле существовал — он был очень, очень славный, он смеялся, и ему хотелось иметь барашка. А кто хочет барашка, тот уж конечно существует», — если сказать так, они только пожмут плечами и посмотрят на тебя как на несмышленого младенца. Но если сказать им: «Он прилетел с планеты, которая называется астероид Б-612», — это их убедит, и они не станут докучать вам расспросами. Уж такой народ эти взрослые. Не стоит на них сердиться. Дети должны быть очень снисходительны к взрослым.
Но мы, те, кто понимает, что такое жизнь, — мы, конечно, смеемся над номерами и цифрами! Я охотно начал бы эту повесть как волшебную сказку. Я хотел бы начать так:
«Жил да был Маленький принц. Он жил на планете, которая была чуть побольше его самого, и ему очень не хватало друга...» Те, кто понимает, что такое жизнь, сразу увидели бы, что это гораздо больше похоже на правду.
Ибо я совсем не хочу, чтобы мою книжку читали просто ради забавы. Сердце мое больно сжимается, когда я вспоминаю моего маленького друга, и нелегко мне о нем говорить. Вот уже шесть лет, как мой друг вместе с барашком меня покинул. И я пытаюсь рассказать о нем для того, чтобы его не забыть. Это очень печально, когда забывают друзей. Не у всякого был друг. И я боюсь стать таким, как взрослые, которым ничто не интересно, кроме цифр. Еще и потому я купил ящик с красками и цветные карандаши. Не так это просто — в моем возрасте вновь приниматься за рисование, если за всю свою жизнь только и нарисовал что удава снаружи и изнутри, да и то в шесть лет! Конечно, я стараюсь передать сходство как можно лучше. Но я совсем не уверен, что у меня это получится. Один портрет выходит удачно, а другой ни капли не похож. Вот и с ростом то же: на одном рисунке принц у меня чересчур большой, на другом — чересчур маленький. И я плохо помню, какого цвета была его одежда. Я пробую рисовать и так и эдак, наугад, с грехом пополам. Наконец, я могу ошибиться и в каких-то важных подробностях. Но вы уж не взыщите. Мой друг никогда мне ничего не объяснял. Может быть, он думал, что я такой же, как он. Но я, к сожалению, не умею увидеть барашка сквозь стенки ящика. Может быть, я немного похож на взрослых. Наверно, я старею.
''';

  static const String text5 = '''
Каждый день я узнавал что-нибудь новое о его планете, о том, как он ее покинул и как странствовал. Он рассказывал об этом понемножку, когда приходилось к слову. Так, на третий день я узнал о трагедии с баобабами.
Это тоже вышло из-за барашка. Казалось, Маленьким принцем вдруг овладели тяжкие сомнения, и он спросил:
— Скажи, ведь правда барашки едят кусты?
— Да, правда.
— Вот хорошо!
Я не понял, почему это так важно, что барашки едят кусты. Но Маленький принц прибавил: — Значит, они и баобабы тоже едят?
Я возразил, что баобабы — не кусты, а огромные деревья, вышиной с колокольню, и если даже он приведет целое стадо слонов, им не съесть и одного баобаба.
Услыхав про слонов, Маленький принц засмеялся:
— Их пришлось бы поставить друг на друга...
Услыхав про слонов, Маленький принц засмеялся: — Их пришлось бы поставить друг на друга. Иллюстрация Антуана де Сент-Экзюпери к повести-сказке «Маленький принц»
А потом сказал рассудительно:
— Баобабы сперва, пока не вырастут, бывают совсем маленькие.
— Это верно. Но зачем твоему барашку есть маленькие баобабы?
— А как же! — воскликнул он, словно речь шла о самых простых, азбучных истинах.
И пришлось мне поломать голову, пока я додумался, в чем тут дело.
На планете Маленького принца, как на любой другой планете, растут травы полезные и вредные. А значит, есть там хорошие семена хороших, полезных трав и вредные семена дурной, сорной травы. Но ведь семена невидимы. Они спят глубоко под землей, пока одно из них не вздумает проснуться. Тогда оно пускает росток; он расправляется и тянется к солнцу, сперва такой милый, безобидный. Если это будущий редис или розовый куст, пусть растет на здоровье. Но если это какая-нибудь дурная трава, надо вырвать ее с корнем, как только ее узнаешь. И вот на планете Маленького принца есть ужасные, зловредные семена... Это семена баобабов. Почва планеты вся заражена ими. А если баобаб не распознать вовремя, потом от него уже не избавишься. Он завладеет всей планетой. Он пронижет ее насквозь своими корнями. И если планета очень маленькая, а баобабов много, они разорвут ее на клочки.
— Есть такое твердое правило, — сказал мне после Маленький принц. — Встал поутру, умылся, привел себя в порядок — и сразу же приведи в порядок свою планету. Непременно надо каждый день выпалывать баобабы, как только их уже можно отличить от розовых кустов: молодые ростки у них почти одинаковые. Это очень скучная работа, но совсем не трудная.
Встал поутру, умылся, привел себя в порядок — и сразу же приведи в порядок свою планету. Иллюстрация Антуана де Сент-Экзюпери к повести-сказке «Маленький принц»
Однажды он посоветовал мне постараться и нарисовать такую картинку, чтобы и у нас дети это хорошо поняли.
— Если им когда-нибудь придется путешествовать, — сказал он, — это им пригодится. Иная работа может и подождать немного — вреда не будет. Но если дашь волю баобабам, беды не миновать. Я знал одну планету, на ней жил лентяй. Он не выполол вовремя три кустика...
Но если дашь волю баобабам, беды не миновать. Я знал одну планету, на ней жил лентяй. Он не выполол вовремя три кустика... Иллюстрация Антуана де Сент-Экзюпери к повести-сказке «Маленький принц»
Маленький принц подробно мне все описал, и я нарисовал эту планету. Терпеть не могу читать людям нравоучения. Но мало кто знает, чем грозят баобабы, а опасность, которой подвергается всякий, кто попадет на астероид, очень велика; вот почему на сей раз я решаюсь изменить своей обычной сдержанности. «Дети! — говорю я. — Берегитесь баобабов!» Я хочу предупредить моих друзей об опасности, которая давно уже их подстерегает, а они даже не подозревают о ней, как не подозревал прежде и я. Вот почему я так трудился над этим рисунком, и мне не жаль потраченного труда. Быть может, вы спросите: отчего в моей книжке нет больше таких внушительных рисунков, как этот, с баобабами? Ответ очень прост: я старался, но у меня ничего не вышло. А когда я рисовал баобабы, меня вдохновляло сознание, что это страшно важно и неотложно.
 ''';

  static const String text6 = '''
О Маленький принц! Понемногу я понял также, как печальна и однообразна была твоя жизнь. Долгое время у тебя было лишь одно развлечение — ты любовался закатом. Я узнал об этом наутро четвертого дня, когда ты сказал:
— Я очень люблю закат. Пойдем посмотрим, как заходит солнце.
— Ну, придется подождать.
— Чего ждать?
— Чтобы солнце зашло.
Сначала ты очень удивился, а потом засмеялся над собою и сказал:
— Мне все кажется, что я у себя дома!
Маленький принц любуется закатом. Иллюстрация Антуана де Сент-Экзюпери к повести-сказке «Маленький принц»
И в самом деле. Все знают, что, когда в Америке полдень, во Франции солнце уже заходит. И если бы за одну минуту перенестись во Францию, можно было бы полюбоваться закатом. К несчастью, до Франции очень, очень далеко. А на твоей планетке тебе довольно было передвинуть стул на несколько шагов. И ты опять и опять смотрел на закатное небо, стоило только захотеть...
— Однажды я за один день видел заход солнца сорок три раза!
И немного погодя ты прибавил:
— Знаешь... когда очень грустно, хорошо поглядеть, как заходит солнце...
— Значит, в тот день, когда ты видел сорок три заката, тебе было очень грустно?
Но Маленький принц не ответил.
''';

  static const String text7 = '''
На пятый день, опять-таки благодаря барашку, я узнал секрет Маленького принца. Он спросил неожиданно, без предисловий, точно пришел к этому выводу после долгих молчаливых раздумий:
— Если барашек ест кусты, он и цветы ест?
— Он ест все, что попадется.
— Даже такие цветы, у которых шипы?
— Да, и те, у которых шипы.
— Тогда зачем шипы?
Этого я не знал. Я был очень занят: в моторе заело один болт, и я старался его отвернуть. Мне было не по себе, положение становилось серьезным, воды почти не осталось, и я начал бояться, что моя вынужденная посадка плохо кончится.
— Зачем нужны шипы?
Задав какой-нибудь вопрос, Маленький принц уже не отступался, пока не получал ответа. Неподатливый болт выводил меня из терпенья, и я ответил наобум:
— Шипы ни за чем не нужны, цветы выпускают их просто от злости.
— Вот как!
Наступило молчание. Потом он сказал почти сердито:
— Не верю я тебе! Цветы слабые. И простодушные. И они стараются придать себе храбрости. Они думают: если у них шипы, их все боятся...
Я не ответил. В ту минуту я говорил себе: «Если этот болт и сейчас не поддастся, я так стукну по нему молотком, что он разлетится вдребезги». Маленький принц снова перебил мои мысли:
— А ты думаешь, что цветы...
— Да нет же! Ничего я не думаю! Я ответил тебе первое, что пришло в голову. Ты видишь, я занят серьезным делом.
Он посмотрел на меня в изумлении.
— Серьезным делом?!
Он все смотрел на меня: перепачканный смазочным маслом, с молотком в руках, я наклонился над непонятным предметом, который казался ему таким уродливым.
— Ты говоришь, как взрослые! — сказал он.
Мне стало совестно. А он беспощадно прибавил:
— Все ты путаешь... ничего не понимаешь!
Да, он не на шутку рассердился. Он тряхнул головой, и ветер растрепал его золотые волосы.
— Я знаю одну планету, там живет такой господин с багровым лицом. Он за всю свою жизнь ни разу не понюхал цветка. Ни разу не поглядел на звезду. Он никогда никого не любил. И никогда ничего не делал. Он занят только одним: складывает цифры. И с утра до ночи твердит одно: «Я человек серьезный! Я человек серьезный!» — совсем как ты. И прямо раздувается от гордости. А на самом деле он не человек. Он гриб.
— Что?
— Гриб!
Маленький принц даже побледнел от гнева.
— Миллионы лет у цветов растут шипы. И миллионы лет барашки все-таки едят цветы. Так неужели же это не серьезное дело — понять, почему они изо всех сил стараются отрастить шипы, если от шипов нет никакого толку? Неужели это не важно, что барашки и цветы воюют друг с другом? Да разве это не серьезнее и не важнее, чем арифметика толстого господина с багровым лицом? А если я знаю единственный в мире цветок, он растет только на моей планете, и другого такого больше нигде нет, а маленький барашек в одно прекрасное утро вдруг возьмет и съест его и даже не будет знать, что он натворил? И это все, по-твоему, не важно?
А если я знаю единственный в мире цветок, он растет только на моей планете, и другого такого больше нигде нет... Иллюстрация Антуана де Сент-Экзюпери к повести-сказке «Маленький принц»
Он густо покраснел. Потом снова заговорил:
— Если любишь цветок — единственный, какого больше нет ни на одной из многих миллионов звезд, — этого довольно: смотришь на небо — и ты счастлив. И говоришь себе: «Где-то там живет мой цветок...» Но если барашек его съест, это все равно как если бы все звезды разом погасли! И это, по-твоему, не важно!
Он больше не мог говорить. Он вдруг разрыдался. Стемнело. Я бросил работу. Я и думать забыл про злополучный болт и молоток, про жажду и смерть. На звезде, на планете — на моей планете по имени Земля, — плакал Маленький принц, и надо было его утешить. Я взял его на руки и стал баюкать. Я говорил ему: «Цветку, который ты любишь, ничто не грозит... Я нарисую твоему барашку намордник... Нарисую для твоего цветка броню... Я...» Я не знал, что еще ему сказать. Я чувствовал себя ужасно неловким и неуклюжим. Как позвать, чтобы он услышал, как догнать его душу, ускользающую от меня... Ведь она такая таинственная и неизведанная, эта страна слез...
''';

  static const String text8 = '''
Очень скоро я лучше узнал этот цветок. На планете Маленького принца всегда росли простые, скромные цветы — у них было мало лепестков, они занимали совсем мало места и никого не беспокоили. Они раскрывались поутру в траве и под вечер увядали. А этот пророс однажды из зерна, занесенного неведомо откуда, и Маленький принц не сводил глаз с крохотного ростка, не похожего на все остальные ростки и былинки. Вдруг это какая-нибудь новая разновидность баобаба? Но кустик быстро перестал тянуться ввысь, и на нем появился бутон. Маленький принц никогда еще не видал таких огромных бутонов и предчувствовал, что увидит чудо. А неведомая гостья, скрытая в стенах своей зеленой комнатки, все готовилась, все прихорашивалась. Она заботливо подбирала краски. Она наряжалась неторопливо, один за другим примеряя лепестки. Она не желала явиться на свет встрепанная, точно какой-нибудь мак. Она хотела показаться во всем блеске своей красоты. Да, это была ужасная кокетка! Таинственные приготовления длились день за днем. И вот однажды утром, едва взошло солнце, лепестки раскрылись.
И вот однажды утром, едва взошло солнце, лепестки раскрылись... Иллюстрация Антуана де Сент-Экзюпери к повести-сказке «Маленький принц»
И красавица, которая столько трудов положила, готовясь к этой минуте, сказала, позевывая:
— Ах, я насилу проснулась... Прошу извинить... Я еще совсем растрепанная...
Маленький принц не мог сдержать восторга:
— Как вы прекрасны!
— Да, правда? — был тихий ответ. — И заметьте, я родилась вместе с солнцем.
Маленький принц, конечно, догадался, что удивительная гостья не страдает избытком скромности, зато она была так прекрасна, что дух захватывало!
А она вскоре заметила:
— Кажется, пора завтракать. Будьте так добры, позаботьтесь обо мне...
Маленький принц очень смутился, разыскал лейку и полил цветок ключевой водой.
Маленький принц очень смутился, разыскал лейку и полил цветок ключевой водой. Иллюстрация Антуана де Сент-Экзюпери к повести-сказке «Маленький принц»
Скоро оказалось, что красавица горда и обидчива, и Маленький принц совсем с ней измучился. У нее было четыре шипа, и однажды она сказала ему:
— Пусть приходят тигры, не боюсь я их когтей!
— На моей планете тигры не водятся, — возразил Маленький принц. — И потом, тигры не едят траву.
Пусть приходят тигры, не боюсь я их когтей!.. Иллюстрация Антуана де Сент-Экзюпери к повести-сказке «Маленький принц»
— Я не трава, — тихо заметил цветок.
— Простите меня...
— Нет, тигры мне не страшны, но я ужасно боюсь сквозняков. У вас нет ширмы?
— Растение, а боится сквозняков... очень странно... — подумал Маленький принц. — Какой трудный характер у этого цветка.
— Когда настанет вечер, накройте меня колпаком. У вас тут слишком холодно. Очень неуютная планета. Там, откуда я прибыла...
Она не договорила. Ведь ее занесло сюда, когда она была еще зернышком. Она ничего не могла знать о других мирах. Глупо лгать, когда тебя так легко уличить! Красавица смутилась, потом кашлянула раз-другой, чтобы Маленький принц почувствовал, как он перед нею виноват:
— Где же ширма?
— Я хотел пойти за ней, но не мог же я вас не дослушать!
Тогда она закашляла сильнее: пускай его все-таки помучит совесть!
Хотя Маленький принц и полюбил прекрасный цветок, и рад был ему служить, но вскоре в душе его пробудились сомнения. Пустые слова он принимал близко к сердцу и стал чувствовать себя очень несчастным.
— Напрасно я ее слушал, — доверчиво сказал он мне однажды. — Никогда не надо слушать, что говорят цветы. Надо просто смотреть на них и дышать их ароматом. Мой цветок напоил благоуханием всю мою планету, а я не умел ему радоваться. Эти разговоры о когтях и тиграх... Они должны бы меня растрогать, а я разозлился...
И еще он признался:
— Ничего я тогда не понимал! Надо было судить не по словам, а по делам. Она дарила мне свой аромат, озаряла мою жизнь. Я не должен был бежать. За этими жалкими хитростями и уловками надо было угадать нежность. Цветы так непоследовательны! Но я был слишком молод, я еще не умел любить.
 ''';

  static const String text9 = '''
Как я понял, он решил странствовать с перелетными птицами. Иллюстрация Антуана де Сент-Экзюпери к повести-сказке «Маленький принц»
В последнее утро он старательней обычного прибрал свою планету. Он заботливо прочистил действующие вулканы. У него было два действующих вулкана. На них очень удобно по утрам разогревать завтрак. Кроме того, у него был еще один потухший вулкан. Но, сказал он, мало ли что может случиться! Поэтому он прочистил и потухший вулкан тоже. Когда вулканы аккуратно чистишь, они горят ровно и тихо, без всяких извержений. Извержение вулкана — это все равно что пожар в печной трубе, когда там загорится сажа. Конечно, мы, люди на Земле, слишком малы и не можем прочищать наши вулканы. Вот почему они доставляют нам столько неприятностей.
Он заботливо прочистил действующие вулканы. У него было два действующих вулкана. На них очень удобно по утрам разогревать завтрак... Иллюстрация Антуана де Сент-Экзюпери к повести-сказке «Маленький принц»
Потом Маленький принц не без грусти вырвал последние ростки баобабов. Он думал, что никогда не вернется. Но в то утро привычная работа доставляла ему необыкновенное удовольствие. А когда он в последний раз полил чудесный цветок и собрался накрыть колпаком, ему даже захотелось плакать.
— Прощайте, — сказал он.
Красавица не ответила.
— Прощайте, — повторил Маленький принц.
Она кашлянула. Но не от простуды.
— Я была глупая, — сказала она наконец. — Прости меня. И постарайся быть счастливым.
И ни слова упрека. Маленький принц очень удивился. Он застыл, растерянный, со стеклянным колпаком в руках. Откуда эта тихая нежность?
Он застыл, растерянный, со стеклянным колпаком в руках. Откуда эта тихая нежность? Иллюстрация Антуана де Сент-Экзюпери к повести-сказке «Маленький принц»
— Да, да, я люблю тебя, — услышал он. — Моя вина, что ты этого не знал. Да это и не важно. Но ты был такой же глупый, как я. Постарайся быть счастливым... Оставь колпак, он мне больше не нужен.
— Но ветер...
— Не так уж я простужена... Ночная свежесть пойдет мне на пользу. Ведь я — цветок.
— Но звери, насекомые...
— Должна же я стерпеть двух-трех гусениц, если хочу познакомиться с бабочками. Они, наверно, прелестны. А то кто же станет меня навещать? Ты ведь будешь далеко. А больших зверей я не боюсь. У меня тоже есть когти.
И она в простоте душевной показала свои четыре шипа. Потом прибавила:
— Да не тяни же, это невыносимо! Решил уйти — так уходи.
Она не хотела, чтобы Маленький принц видел, как она плачет. Это был очень гордый цветок...
 ''';

  static const String text10 = '''
Ближе всего к планете Маленького принца были астероиды 325, 326, 327, 328, 329 и 330. Вот он и решил для начала посетить их: надо же найти себе занятие да и поучиться чему-нибудь.
На первом астероиде жил король. Облаченный в пурпур и горностай, он восседал на троне, очень простом и все же величественном.
На первом астероиде жил король. Облаченный в пурпур и горностай, он восседал на троне, очень простом и все же величественном. Иллюстрация Антуана де Сент-Экзюпери к повести-сказке «Маленький принц»
— А, вот и подданный! — воскликнул король, увидав Маленького принца.
— Как же он меня узнал? — подумал Маленький принц. — Ведь он видит меня в первый раз!
Он не знал, что короли смотрят на мир очень упрощенно: для них все люди — подданные.
— Подойди, я хочу тебя рассмотреть, — сказал король, ужасно гордый тем, что он может быть для кого-то королем.
Маленький принц оглянулся — нельзя ли где-нибудь сесть, но великолепная горностаевая мантия покрывала всю планету. Пришлось стоять, а он так устал... И вдруг он зевнул.
— Этикет не разрешает зевать в присутствии монарха, — сказал король. — Я запрещаю тебе зевать.
— Я нечаянно, — ответил Маленький принц, очень смущенный. — Я долго был в пути и совсем не спал...
— Ну, тогда я повелеваю тебе зевать, — сказал король. — Многие годы я не видел, чтобы кто-нибудь зевал. Мне это даже любопытно. Итак, зевай! Таков мой приказ.
— Но я робею... я больше не могу... — вымолвил Маленький принц и густо покраснел.
— Гм, гм... Тогда... тогда я повелеваю тебе то зевать, то...
Король запутался и, кажется, даже немного рассердился.
Ведь для короля самое важное — чтобы ему повиновались беспрекословно. Непокорства он бы не потерпел. Это был абсолютный монарх. Но он был очень добр, а потому отдавал только разумные приказания.
— Если я повелю своему генералу обернуться морской чайкой, — говаривал он, — и если генерал не выполнит приказа, это будет не его вина, а моя.
— Можно мне сесть? — робко спросил Маленький принц.
— Повелеваю: сядь! — отвечал король и величественно подобрал одну полу своей горностаевой мантии.
Но Маленький принц недоумевал. Планетка такая крохотная. Где же тут царствовать?
— Ваше величество, — начал он, — позвольте вас спросить...
— Повелеваю: спрашивай! — поспешно сказал король.
— Ваше величество... Где же ваше королевство?
— Везде, — просто ответил король.
— Везде?
Король повел рукою, скромно указывая на свою планету, а также и на другие планеты, и на звезды.
— И все это ваше? — переспросил Маленький принц.
— Да, — отвечал король.
Ибо он был поистине полновластный монарх и не знал никаких пределов и ограничений.
— И звезды вам повинуются? — спросил Маленький принц.
— Ну конечно, — отвечал король. — Звезды повинуются мгновенно. Я не терплю непослушания.
Маленький принц был восхищен. Вот бы ему такое могущество! Он бы тогда любовался закатом не сорок четыре раза в день, а семьдесят два, а то и сто, и двести раз, и при этом даже не приходилось бы передвигать стул с места на место! Тут он снова загрустил, вспоминая свою покинутую планету, и, набравшись храбрости, попросил короля:
— Мне хочется поглядеть на заход солнца... Пожалуйста, сделайте милость, повелите солнцу закатиться...
— Если я прикажу какому-нибудь генералу порхать бабочкой с цветка на цветок, или сочинить трагедию, или обернуться морской чайкой и генерал не выполнит приказа, кто будет в этом виноват — он или я?
— Вы, ваше величество, — ни минуты не колеблясь, ответил Маленький принц.
— Совершенно верно, — подтвердил король. — С каждого надо спрашивать то, что он может дать. Власть, прежде всего, должна быть разумной. Если ты повелишь своему народу броситься в море, он устроит революцию. Я имею право требовать послушания, потому что веления мои разумны.
— А как же заход солнца? — напомнил Маленький принц: раз о чем-нибудь спросив, он уже не отступался, пока не получал ответа.
— Будет тебе и заход солнца. Я потребую, чтобы солнце зашло. Но сперва дождусь благоприятных условий, ибо в этом и состоит мудрость правителя.
— А когда условия будут благоприятные? — осведомился Маленький принц.
— Гм, гм, — ответил король, листая толстый календарь. — Это будет... гм, гм... сегодня это будет в семь часов сорок минут вечера. И тогда ты увидишь, как точно исполнится мое повеление.
Маленький принц зевнул. Жаль, что тут не поглядишь на заход солнца, когда хочется! И, по правде говоря, ему уже стало скучновато.
— Мне пора, — сказал он королю. — Больше мне здесь нечего делать.
— Останься! — сказал король: он был очень горд тем, что у него нашелся подданный, и не хотел с ним расставаться. — Останься, я назначу тебя министром.
— Министром чего?
— Ну... правосудия.
— Но ведь здесь некого судить!
— Как знать, — возразил король. — Я еще не осмотрел всего моего королевства. Я очень стар, для кареты у меня нет места, а ходить пешком так утомительно...
Маленький принц наклонился и еще раз заглянул на другую сторону планеты.
— Но я уже посмотрел! — воскликнул он. — Там тоже никого нет.
— Тогда суди сам себя, — сказал король. — Это самое трудное. Себя судить куда труднее, чем других. Если ты сумеешь правильно судить себя, значит, ты поистине мудр.
— Сам себя я могу судить где угодно, — сказал Маленький принц. — Для этого мне незачем оставаться у вас.
— Гм, гм... — сказал король. — Мне кажется, где-то на моей планете живет старая крыса. Я слышу, как она скребется по ночам. Ты мог бы судить эту старую крысу. Время от времени приговаривай ее к смертной казни. От тебя будет зависеть ее жизнь. Но потом каждый раз надо будет ее помиловать. Надо беречь старую крысу: она ведь у нас одна.
— Не люблю я выносить смертные приговоры, — сказал Маленький принц. — И вообще мне пора.
— Нет, не пора, — возразил король.
Маленький принц уже совсем собрался в дорогу, но ему не хотелось огорчать старого монарха.
— Если вашему величеству угодно, чтобы ваши повеления беспрекословно исполнялись, — сказал он, — вы могли бы отдать мне благоразумное приказание. Например, повелите мне пуститься в путь, не мешкая ни минуты... Мне кажется, условия для этого самые что ни на есть благоприятные...
Король не отвечал, и Маленький принц немного помедлил в нерешимости, потом вздохнул и отправился в путь.
— Назначаю тебя послом! — поспешно крикнул вдогонку ему король.
И вид у него при этом был такой, точно он не потерпел бы никаких возражений.
— Странный народ эти взрослые, — сказал себе Маленький принц, продолжая путь.
''';

  static String getText(int page) {
    var pages = [
      text1,
      text2,
      text3,
      text4,
      text5,
      text6,
      text7,
      text8,
      text9,
      text10,
    ];
    return pages[page];
  }
}
