import 'package:alpha_reader/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:alpha_reader/domain/entities/book.dart';
import 'package:flutter/foundation.dart';
import 'package:alpha_reader/alpha_image_cache.dart';

class TheSevenMadmenBook implements IBook {
  final Uint8List _imageData;

  TheSevenMadmenBook._(this._imageData);

  static Future<TheSevenMadmenBook> init() async {
    ByteData imageDataString =
        await rootBundle.load('assets/TheSevenMadmenBook.jpg');
    return TheSevenMadmenBook._(imageDataString.buffer.asUint8List());
  }

  @override
  String get key {
    return 'TheSevenMadmen';
  }

  @override
  String get title {
    return 'The Seven Madmen';
  }

  @override
  String get description {
    return '''
    <p>Remo Erdosain's Buenos Aires is a dim, seething, paranoid hive of hustlers and whores, scoundrels and madmen, and Erdosain feels his soul is as polluted as anything in this dingy city. Possessed by the directionlessness of the society around him, trapped between spiritual anguish and madness, he clings to anything that can give his life meaning: small-time defrauding of his employers, hatred of his wife's cousin Gregorio Barsut, a part in the Astrologer's plans for a new world order… but is that enough? Or is the only appropriate response to reality &mdash; insanity?</p>
    <p>Written in 1929, The Seven Madmen depicts an Argentina on the edge of the precipice. This teeming world of dreamers, revolutionaries and scheming generals was Arlt's uncanny prophesy of the cycle of conflict which would scar his country's passage through the twentieth century, and even today it retains its power as one of the great apocalyptic works of modern literature.</p>
   <h1>
    ABOUT THE AUTHORS <br/>
   </h1>
   <p>n in Buenos Aires in 1900. He had a deeply unhappy childhood and was brought up in the city’s crowded tenement houses &mdash; the same tenements which feature in <em class="calibre11">The Seven Madmen</em>. As a journalist, Arlt described the rich and vivid life of Buenos Aires. As an inventor, he patented a method to prevent ladders in women’s stockings.</p>
   <p>Roberto Arlt died suddenly of a heart attack in Buenos Aires in 1942. He was the author of the novels <em class="calibre11">The Enraged Toy, The Flamethrowers, Love the Enchanter</em> and several plays. First published in 1929, <em class="calibre11">The Seven Madmen</em> perfectly captures the conflict of Argentine society at a crucial moment in its history.</p>
   <br class="calibre1" />
   <p>Nick Caistor is the translator of <em class="calibre11">The Seven Madmen</em>. His “Arlt’s Life and Times” is included as the first of two Afterwords.</p>
   <p>Roberto Bolaño’s “The Vagaries of the Literature of Doom” is the second Afterword.</p>
   <br class="calibre1" />
   <p><strong class="calibre12">Praise for <em class="calibre11">The Seven Madmen</em></strong></p>
   <p>“If great means anything at all, then Arlt is surely a great writer … he is Latin America’s first truly urban novelist … this is the power which inspired literature possesses” <em class="calibre11">Guardian</em></p>
   <p>“The reader is possessed almost demonically by these characters … an indestructible force of great literature” Julio Cortázar</p>
   <p>“Let’s say, modestly, that Arlt is Jesus Christ. Argentina, of course, is Israel and Buenos Aires is Jerusalem … Arlt is quick, a risk taker, adaptable, a born survivor … Arlt is a Russian, a character from Dostoyevsky, while Borges is an Englishman, a character from Chesterton or Shaw or Stevenson … without doubt an important part of Argentinian and Latin American literature” Roberto Bolaño</p>
   <p>“Arlt is, plain and simple, the father of the modern Argentinian novel … he is the most important Argentinian novelist, the greatest” Ricardo Piglia</p>
   <p>“If ever anyone from these shores could be called a literary genius, his name was Roberto Arlt … I am talking about a novelist who will be famous in time … and who, unbelievably, is almost unknown in the world today” Juan Carlos Onetti</p>
    ''';
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
  String pageText(int pageIndex) {
    return _TextSource.getText(pageIndex);
  }
}

class _TextSource {
  static const String title1_1 = 'CHAPTER ONE : THE SURPRISE (1)';
  static const String text1_1 = '''
    <div class="paragraph">As soon as he opened the frosted glass door to the manager’s office, Remo Erdosain wanted to turn back; he realised he was a lost man, but it was too late.</div>
    <div class="paragraph">Waiting for him were the director, a short squat man with the head of a wild boar, grey hair cropped short in the style of Umberto I of Italy, and an implacable gaze that filtered through grey fish eyes; Gualdi, small, skinny, sweet-tongued, but with a calculating stare; and the assistant manager, son of the man with the boar’s head, a handsome young fellow of thirty, with a shock of white hair and a cynical aspect, his voice gruff and his look as harsh as his father’s. None of the three: the director bending over some accounts, his assistant lolling back in an armchair with one leg dangling over the arm, or Gualdi hovering respectfully next to the desk, bothered to return Erdosain’s greeting. Only the assistant manager lifted his head and said:</div>
    <div class="paragraph">“We’ve been told you’re a swindler, who has robbed us of 600 pesos.”</div>
    <div class="paragraph">“And seven cents,” Gualdi added, as he passed a blotter over the director’s signature on one of the accounts. It was only then that the latter, as if making a great effort with his huge bull’s neck, raised his eyes. With his thumbs thrust through his waistcoat buttonholes, the director exuded an air of wisdom, but his eyes narrowed as he pored without apparent ill-feeling over Erdosain’s scrawny, expressionless features.</div>
    <div class="paragraph">“Why are you so badly dressed?” he wanted to know.</div>
    <div class="paragraph">“I earn nothing as a collector.”</div>
    <div class="paragraph">“What about the money you stole from us?”</div>
    <div class="paragraph">“I haven’t stolen anything. It’s all lies.”</div>
    <div class="paragraph">“So you’re in a position to account for everything, are you?”</div>
    <div class="paragraph">“If you wish, by midday today.”</div>
    ''';
  static const String title1_2 = 'CHAPTER ONE : THE SURPRISE (2)';
  static const String text1_2 = '''
    <div class="paragraph">This answer won him a brief respite. The three men exchanged inquiring glances, then finally the assistant manager shrugged his shoulders and said, with his father’s approval:</div>
    <div class="paragraph">“No … you have until tomorrow at three. Bring all your tally books and your receipts … You can go now.”</div>
    <div class="paragraph">The decision took Erdosain so completely by surprise that he remained standing there abjectly, staring at the three of them. Yes, all three of them. At Gualdi, who had humiliated him despite calling himself a socialist; at the assistant manager, who had scornfully stared at his ragged tie; at the director whose bristling boar’s head was now tilted in his direction, his cynical, obscene gaze screened by the grey slit of his narrowed eyes.</div>
    <div class="paragraph">Yet Erdosain did not budge … He wanted to say something to them, without knowing what, something that would make them see the crushing misfortune that made his life a misery; so he just stood there, forlorn, the black cube of the safe on a level with his eyes, feeling his back bending further and further with the passing minutes while he nervously twisted the brim of his black hat, and his own look became more and more furtive and sad. Finally, he blurted out:</div>
    <div class="paragraph">“So, can I leave?”</div>
    <div class="paragraph">“Yes …”</div>
    <div class="paragraph">“No, I mean can I draw my wages today and …”</div>
    <div class="paragraph">“No … hand your receipts over to Suarez and bring everything else here tomorrow at three, without fail.” “Yes … everything.” Turning on his heel, Erdosain left without another word.</div>
    <div class="paragraph">He walked down Chile to the Paseo Colon. He felt himself hemmed in by invisible pressures. The sun picked out the disgusting interiors as the street sloped downwards. Such a jumble of disparate thoughts raced through his mind, it would have taken him hours of hard work to unravel them. Later he recalled that not for one moment had it occurred to him to wonder who might have betrayed him.</div>
''';

  static const String title2_1 = 'CHAPTER ONE : STATES OF MIND (1)';
  static const String text2_1 = '''
    <div class="paragraph">He knew he was a thief. But the category he was labelled with did not interest him. Besides, the word “thief” had little resonance with what he felt inside. There, he was aware of a different feeling, of a kind of circular silence that pierced the mass of his skull like a steel rod, leaving him deaf to anything but his own wretched despair.</div>
    <div class="paragraph">This circle of silence and darkness shattered the continuity of Erdosain’s ideas. As his reasoning faltered, he found it impossible to trace the link between the place he called home and an institution that bore the name of prison.</div>
    <div class="paragraph">He was thinking telegraphically, omitting prepositions, and this jangled his nerves still further. He lived endless empty hours when he could have committed any crime without feeling in the least responsible. Logically, no judge would have understood what was going on. But Erdosain was already a hollow man, a shell moved simply by the force of habit.</div>
    <div class="paragraph">If he had gone on working in the Sugar Company, it had not been to steal even more money, but because he was hoping for some extraordinary event, something absolutely extraordinary, which would give his life an unexpected twist and save him from the catastrophe he could see knocking at his door.</div>
    <div class="paragraph">The name Erdosain gave to this mood of dreams and disquiet that led him to roam like a sleepwalker through the days was “the anguish zone”.</div>
    <div class="paragraph">He imagined this zone floating above cities, about two metres in the air, and pictured it graphically like an area of salt flats or deserts that are shown on maps by tiny dots, as dense as herring roe.</div>
    <div class="paragraph">This anguish zone was the product of mankind’s suffering. It slid from one place to the next like a cloud of poison gas, seeping through walls, passing straight through buildings, without ever losing its flat horizontal shape; a two-dimensional anguish that left an after-taste of tears in throats it sliced like a guillotine.</div>
    ''';
  static const String title2_2 = 'CHAPTER ONE : STATES OF MIND (2)';
  static const String text2_2 = '''
    <div class="paragraph">This was the explanation Erdosain reached when he felt the first nauseas of despair.</div>
    <div class="paragraph">“What am I doing with my life?” he would ask himself, trying with that question to shed light on the origins of this anxiety which led him to long for an existence where the next day would not be merely time measured out in a repetition of today, but something different and totally unexpected, like in the plots of North American films, where yesterday’s tramp suddenly becomes today’s secret society boss, and the gold-digging secretary turns out to be a multimillionairess in disguise.</div>
    <div class="paragraph">In the miserable uncertainty that followed, this need for marvels that he could not possibly satisfy &mdash; since he was no more than a failed inventor and a criminal on the threshold of gaol &mdash; left the acid taste of frustration in Erdosain’s mouth, setting his teeth on edge as if he had been chewing lemons.</div>
    <div class="paragraph">When in this mood, he dreamt up the wildest nonsense. He even imagined that the rich, tired of having to listen to the moans of the wretched, built huge cages pulled by teams of horses. Gaolers chosen for their strength hunted the poor with dogcatchers’ poles, and Erdosain could clearly see one scene where a tall, dishevelled woman was chasing after a cage where her one-eyed son was calling out to her, until finally a “dogcatcher”, weary of hearing her cries, beat her senseless with the handle of his pole.</div>
    <div class="paragraph">As this apparition faded, Erdosain said, horrified at himself: “But what soul, what kind of soul do I have?” and since his mind was still being propelled by the impulse that had produced the nightmare, he added: “I should have been born a lackey, one of those vile, perfumed lackeys whom rich prostitutes use to do up their bodices, while their lover is lolling on the sofa smoking a cigarette.”</div>
    <div class="paragraph">His thoughts flew off once more, this time down into a kitchen in the basement of a luxury mansion. Around the table were gathered two maids, a chauffeur and a levantine trader selling garters and perfumes. On this occasion, Erdosain himself would be wearing a short black jacket not long enough to cover his backside, and a white tie. All of a sudden the “master” would call him, a man who was his mirror image, except that he did not shave his moustaches and wore glasses. Erdosain had no idea what his master wanted of him, but would never forget the strange look he gave him as he left the room. Then he went back to the kitchen to swap dirty stories with the chauffeur, who to the maids’ great amusement, and complete silence from the Arab pederast, was telling of how he had seduced the daughter of a high society lady, a girl of tender years.</div>
    <div class="paragraph">Erdosain said again to himself: “Yes, I am a lackey. I have the soul of a true lackey,” and clenched his teeth in satisfaction as he insulted and degraded himself in this way.</div>
    <div class="paragraph">At other times he saw himself leaving a devout old spinster’s bedroom, unctuously carrying a heavy chamberpot. Suddenly he was accosted by a priest &mdash; a regular visitor to the house &mdash; who asked him, smiling beatifically: “And how are your religious duties going, Ernesto?” And he, Ernesto, Ambrosio or Jose, was living the sordid life of an obscene, hypocritical servant.</div>
    <div class="paragraph">Whenever he thought like this, a spasm of madness ran right through him.</div>
    <div class="paragraph">Erdosain knew only too well he was gratuitously offending and fouling his soul. As he deliberately delved into the mire, he suffered the same terror as someone who dreams they are falling into an abyss but knows they will not die.</div>
    <div class="paragraph">Sometimes he felt compelled to humiliate himself, like saints do when they kiss the wounds of plague-bearers; not out of compassion, but so that they will be more worthy of God’s mercy, even though He is revolted at the way they are seeking heaven through such disgusting tests of faith.</div>
    ''';
  static const String title2_3 = 'CHAPTER ONE : STATES OF MIND (3)';
  static const String text2_3 = '''
    <div class="paragraph">But once these images had vanished and all that was left in his mind was the “desire to know the meaning of life”, he would say to himself: “No, I’m not a lackey … truly, I’m not …” and he wished only to go and beg his wife to take pity on him for all these horrible, sordid thoughts. But the memory that he had been forced to sacrifice himself so often for her filled him with a blind rage, and soon he found himself wanting to kill her.</div>
    <div class="paragraph">He knew for certain that one day she would give herself to another man, and this was a further element he could count on to add to all his other anguish.</div>
    <div class="paragraph">When he stole the first twenty pesos, Erdosain was amazed at the ease with which “that” could be done &mdash; perhaps because before he did so, he thought he would have to overcome a whole host of scruples which given his circumstances he could not possibly accommodate. So he said to himself:</div>
    <div class="paragraph">“It’s simply a question of having the will power and doing it.”</div>
    <div class="paragraph">And there was no doubt “that” made life easier; thanks to “that” he had money, which made him feel strange, because it had cost him no effort to get it. And what disturbed Erdosain most was not the theft as such, but that his being a thief might show on his face. He was forced to rob because he earned such a pittance each month. Eighty, a hundred, or a hundred and twenty pesos, according to how much he collected, because his wage included a commission for every cent he brought in.</div>
    <div class="paragraph">Some days he carried around four or five thousand pesos, while he went hungry, and had to bear the stench of an imitation leather bag inside which lay happiness in the form of banknotes, cheques, money transfers, payment orders.</div>
    <div class="paragraph">For a long while, despite the misery gradually eating away at his house and home, the idea of stealing from the company had never occurred to him.</div>
    <div class="paragraph">His wife reproached him for having to scrimp and save every day; he listened to her reproaches in silence, but when he was on his own would say to himself: “What would she have me do?”</div>
    <div class="paragraph">When he had the idea, when the glimmer of an idea occurred to him that he could cheat on his bosses, he felt as delighted as if he had thought of a new invention. Stealing? Why hadn’t he thought of it before?</div>
    <div class="paragraph">Erdosain was dismayed at his own feebleness. He even criticised himself for lacking initiative &mdash; at that time (this was three months prior to the events narrated here) he was having to do without most things, even though large sums of money passed through his hands every day.</div>
    <div class="paragraph">And what aided and abetted his fraudulent dealings was the Sugar Company’s negligence.</div>
''';

  static const String title3_1 = 'CHAPTER ONE : TERROR IN THE STREET (1)';
  static const String text3_1 = '''
    <div class="paragraph">Without doubt Erdosain led a strange life, because sometimes a sudden hope propelled him into the street.</div>
    <div class="paragraph">He would catch a bus and get off in Palermo or Belgrano. As he walked along the silent avenues lost in thought, he would say to himself: “A young woman will see me, a tall, pale, intense girl out driving her Rolls-Royce just for the sake of it. She will be driving round sadly. All at once she will spot me and understand I am the love of her life, and that look of hers &mdash; until that moment, an insult to the unfortunate &mdash; will settle on me &mdash; and her eyes will fill with tears.”</div>
    <div class="paragraph">This was how Erdosain’s foolish fantasy played itself out as he walked slowly along in the shade of the tall house fronts and the green plane trees, which cast their triangular shadows on to the pavement’s white mosaics.</div>
    <div class="paragraph">“She’ll be a millionairess, but I’ll say to her: ‘I’m sorry, but I can’t touch you. Even if you wanted to give yourself to me, I would not have you.’ She would look at me in astonishment, and I would tell her: ‘It’s no use, you see, it’s no use because I’m married.’ But she’ll offer Elsa a fortune to divorce me, and then we will wed, and sail off to Brazil on her yacht.”</div>
    <div class="paragraph">That word “Brazil” gave his naive dream an exotic richness; rough and warm, it conjured up for him a pink and white coastline with cliffs and rocks plunging into a warm blue sea. Soon the young maid had lost her tragic air &mdash; beneath the white silk of a simple schoolgirl’s dress she was a happy, smiling creature, timorous yet daring.</div>
    <div class="paragraph">And Erdosain thought: “We’ll never have sexual contact. To make our love last, we’ll keep our desire in check; I won’t even kiss her on the mouth, only on the hand.”</div>
    <div class="paragraph">He went on to imagine the happiness that would purify his life if something impossible like this were to happen: yet he knew it was easier to stop the earth turning than for such an unlikely event to take place. So he would say to himself with a sudden flash of resentful pride: “Well then, I’ll become a pimp.” At this thought, a terror far worse than any other unhinged his mind. He felt as though blood was pouring from every cranny of his soul &mdash; as if it was being torn into by a drill. With his powers of reasoning numbed, stunned with anguish, he set out on a wild search for a brothel. It was then he experienced the horror of empty nothingness, that luminous horror like the dazzling brilliance of the sun as it bounces off the curved surface of a salt-flat.</div>
    <div class="paragraph">He gave in to the kind of impulse that grips those who for the first time in their lives realise they may be at the prison gate, blind impulses that lead the wretched to stake everything on a card or a woman, searching perhaps for some sad, shocking confirmation of their existence, hoping to find in all that is vile and low some affirmation of purity that will save them for ever.</div>
''';

  static const String title3_2 = 'CHAPTER ONE : TERROR IN THE STREET (2)';
  static const String text3_2 = '''
    <div class="paragraph">So beneath a yellow sun during the sweltering afternoon hours, Erdosain roamed the scorching pavements in search of the most disgusting brothels.</div>
    <div class="paragraph">He preferred those whose porches were full of orange peel and trails of ashes, the ones with windows covered in red or green cloth and protected by wire netting.</div>
    <div class="paragraph">He went in with death in his soul. Usually there was a single dull brown bench out in the patio with its square of blue sky up above. He would collapse exhausted on to it, enduring the madam’s icy stare until the girl, inevitably either excessively fat or skinny, came out to him.</div>
    <div class="paragraph">Then the whore would shout to him from the half-open door to the bedroom, from where the sounds of another man getting dressed could be heard: “Are you coming, sweetheart?” And Erdosain would go into the other room, his ears ringing and a mist swirling before his eyes.</div>
    <div class="paragraph">Then he lay back on the bed varnished the colour of liver, on top of a bedcover soiled by one pair of boots after another.</div>
    <div class="paragraph">All of a sudden he felt like bursting into tears, and asking this ghastly slut what love was, that angelic love the celestial hosts sang of at the foot of the throne of the living God &mdash; but he could not bring himself to do so, because anguish gripped his throat while a wave of revulsion made his stomach clench like a fist.</div>
    <div class="paragraph">And while the prostitute’s hand paused in its movements among his clothes, Erdosain thought again to himself: “What have I done with my life?”</div>
    <div class="paragraph">A ray of sun slanted down through the cobweb-smeared transom, and the whore, on her side on the pillow with one leg crossed over his, slowly moved her hand while he gloomily reflected: “What have I done with my life?”</div>
    <div class="paragraph">Suddenly a feeling of remorse stiffened his soul; he was remembering how being penniless forced his sick wife to wash all her own clothes, and so in a rush of self-loathing he leapt from the bed, paid the prostitute, and fled without having touched her to the next hell to spend money that was not his, to sink ever deeper into the madness howling without respite around him.</div>
''';

  static const String title4_1 = 'CHAPTER ONE : A STRANGE MAN (1)';
  static const String text4_1 = '''
    <div class="paragraph">At ten in the morning Erdosain was on the corner of Peru and Avenida de Mayo. He knew there was no way out of his dilemma but gaol, because he was sure Barsut would not lend him the money. All of a sudden he got a shock.</div>
    <div class="paragraph">Sitting at a café table was Ergueta, the pharmacist.</div>
    <div class="paragraph">His hat was pulled down over his ears; his thumbs stuck out across his huge belly, and a sour, bloated expression filled his sallow, nodding face.</div>
    <div class="paragraph">The glazed look in his bulging eyes, the flat hooked nose, pouched cheeks and drooping lower lip all went to create the impression of a congenital idiot.</div>
    <div class="paragraph">Ergueta’s enormous bulk was stuffed inside a cinnamon-coloured suit, and from time to time he lowered his face and rested his teeth on the marble pommel of his cane.</div>
    <div class="paragraph">This eccentric gesture and the generally loathsome air his boredom conferred on him gave Ergueta the appearance of a white-slave trader. By chance, the pharmacist’s eyes met Erdosain’s as the latter walked over to him, and a childish smile lit up his face. He was still smiling as he shook hands, and Erdosain thought: “How many women have loved him for that smile!”</div>
    <div class="paragraph">Unable to stop himself, Erdosain blurted out the question:</div>
    <div class="paragraph">“So, did you marry Hipólita …?”</div>
    <div class="paragraph">“Yes, but you can’t imagine the fuss it caused at home …”</div>
    <div class="paragraph">“What? … Did they find out she was on the game?”</div>
    <div class="paragraph">“No … she told them that herself later on. Did you know that before she was a streetwalker, Hipólita worked as a housemaid?”</div>
''';

  static const String title4_2 = 'CHAPTER ONE : A STRANGE MAN (2)';
  static const String text4_2 = '''
    <div class="paragraph">“So?”</div>
    <div class="paragraph">“Soon after our wedding, my mother, Hipólita, my sister and I went to visit a family. You can’t imagine what good memories they had! Even after ten years they recognised Hipólita as one of their maids. Unbelievable! She and I came back one way, my mother and Juana another. The whole story I’d invented to explain my marriage was ruined.”</div>
    <div class="paragraph">“Why did she confess she’d been a prostitute?”</div>
    <div class="paragraph">“It was in a moment’s anger. But she was right, wasn’t she? Hadn’t she made a new life for herself? Wasn’t she putting up with me &mdash; me, who had always brought them nothing but heartache?”</div>
    <div class="paragraph">“Apart from that, how are things?”</div>
    <div class="paragraph">“Fine … the pharmacy brings in sixty pesos a day. There’s no-one in Pico who knows the Bible the way I do. I challenged the priest to a debate, but he wasn’t having any of it.”</div>
    <div class="paragraph">“Are you still gambling?”</div>
    <div class="paragraph">“Yes, and thanks to my great innocence, Jesus has revealed the secret of roulette to me.”</div>
    <div class="paragraph">“What d’you mean?”</div>
    <div class="paragraph">“You can’t imagine … the big secret … the law of static synchronicity … I’ve been to Montevideo twice and won a lot of money, but tonight I’m taking Hipólita, and we’ll break the bank.”</div>
    <div class="paragraph">All of a sudden he launched into a complicated explanation:</div>
    <div class="paragraph">“Listen, say you place a certain sum on the first three balls, one in each line of twelve. If none of the three groups come up, then there’s an incredible imbalance. So you score one point to each twelve that didn’t come up. For the next three balls, your first twelve stays the same. Obviously zero doesn’t count and you play the groups in series of three balls. Then you add another point to the dozen that doesn’t have any crosses against it, you take off one or rather two points from the group that has come up three times, and on this basis you can calculate the greater or lesser probability, so you bet all you’ve got on the dozen or dozens that are left.”</div>
''';

  static const String title4_3 = 'CHAPTER ONE : A STRANGE MAN (3)';
  static const String text4_3 = '''
    <div class="paragraph">Erdosain had not understood a word. As his hopes grew, he stifled his desire to laugh &mdash; there was no doubt about it, Ergueta was completely mad. So he replied:</div>
    <div class="paragraph">“Jesus only reveals such secrets to pious souls.”</div>
    <div class="paragraph">“And also to holy fools,” Ergueta retorted, fixing him with a mocking smile while he winked his left eye: “Ever since I’ve been caught up in these mysteries I’ve made huge mistakes &mdash; like marrying that slut, for example …”</div>
    <div class="paragraph">“But aren’t you happy with her?”</div>
    <div class="paragraph">“… believing in people’s goodness when everybody is simply trying to do you down and spread the word that you’re mad …”</div>
    <div class="paragraph">Erdosain frowned impatiently and said: “How can you expect them not to? You yourself have said you were a great sinner. Then suddenly you become religious, you marry a prostitute because that’s what the Bible says, you talk to people about the Fourth Seal and the Pale Horsemen … of course people will think you’re crazy, because they haven’t the faintest idea what you’re talking about. Don’t they reckon I’m mad because I say there should be hair salons for dogs, and that it would be a good idea to make metal shirtcuffs? But I don’t think you’re crazy. I really don’t. What you have is an over-abundance of life, of charity and of love for your neighbour. But I must say that the idea of Jesus revealing the secret of roulette to you does seem a bit far-fetched to me …”</div>
    <div class="paragraph">“I won 5,000 pesos both times …”</div>
    <div class="paragraph">“That may be so. But what saves you is not the secret of roulette but the fact that you have a noble soul. You’re capable of doing good, of taking pity on a man who’s at the gates of prison …”</div>
    <div class="paragraph">“You’re right there,” Ergueta cut in. “In our town there’s another pharmacist, an old skinflint. His son stole 5,000 pesos from him … and then came to me to ask my advice. Do you know what I said? I told him to threaten his father with gaol for dealing cocaine if he reported the theft.”</div>
    <div class="paragraph">“You see how I understand you? You wanted to save that old man’s soul by making the son commit a sin, one he would repent of for the rest of his life. Isn’t that right?”</div>
    <div class="paragraph">“Yes, in the Bible it is written: ‘and the father shall rise up against the son, and the son against the father …’”</div>
    <div class="paragraph">“See? I understand you. I don’t know what your destiny will be … man’s destiny is always uncertain. But I think you have a magnificent path before you. A strange path …”</div>
    <div class="paragraph">“I’ll be king of this world. Can you see it? I’ll win all the money I could wish for at every roulette table. I’ll go to Palestine, to Jerusalem and rebuild the great temple of Solomon …”</div>
''';

  static const String title4_4 = 'CHAPTER ONE : A STRANGE MAN (4)';
  static const String text4_4 = '''
    <div class="paragraph">“And you’ll rescue many people from despair. How many of them have been forced to steal from their bosses, have taken money entrusted to them! Can you imagine their anguish? An anguished person has no idea what he is doing … one day he steals a peso, the next it’s five, the day after, twenty … and by the time he realises it, he owes hundreds of pesos. So then he thinks … it’s not much, and suddenly he finds that 500 &mdash; no, 600 pesos and seven cents have vanished. Can you imagine it? Those are the people you must save … the anguished, the swindlers.”</div>
    <div class="paragraph">The pharmacist thought it over for a moment. A serious look flitted across his bloated face; then he said: “You’re right … the world is full of riff-raff, of unhappy wretches … but what’s to be done about it? That’s what worries me. How can we present the sacred truths anew to these faithless people?”</div>
    <div class="paragraph">“But what people need is money, not sacred truths.”</div>
    <div class="paragraph">“No, that’s what you get for neglecting the holy scriptures. A man who carries the sacred truths inside him will not steal from his boss, will not swindle the firm he works for, will not find himself having to go to gaol from one day to the next.”</div>
    <div class="paragraph">He scratched his nose thoughtfully and went on: “Besides, who is to say it’s not all for the best? Who is going to make the social revolution if it’s not the swindlers, the wretched, the murderers, the cheats, all the scum that suffer here below without the slightest sign of hope? Or do you reckon it’s the penpushers and the shopkeepers who are going to make the revolution?”</div>
    <div class="paragraph">“All right, all right … but while he’s waiting for the revolution to arrive, what does that poor unfortunate do? What do I do?”</div>
    <div class="paragraph">Erdosain gripped Ergueta’s arm and shouted at him: “Because I’m only a step away from prison, you know. I’ve stolen 600 pesos and seven cents.”</div>
    <div class="paragraph">The pharmacist gave a slow wink of his left eye and replied: “Don’t get so upset. The times of tribulation that the scriptures speak of are upon us. Didn’t I marry the Cripple, the Harlot? Hasn’t the son been divided against the father, the father against the son? The revolution is closer than men could wish. Aren’t you the deceiver, the wolf which tears at the flock …?”</div>
    <div class="paragraph">“Just tell me … couldn’t you see your way to lending me the 600 pesos?” Ergueta shook his head slowly. “D’you think just because I read the Bible I’m a dolt?” Erdosain stared at him in despair: “I swear to you that’s what I owe.”</div>
    <div class="paragraph">All at once something unforeseen happened.</div>
    <div class="paragraph">The pharmacist stood up, clicked his fingers dismissively, and while the waiter looked on in astonishment, growled at Erdosain:</div>
    <div class="paragraph">“Get lost, you bum, get lost.”</div>
    <div class="paragraph">Scarlet with shame, Erdosain slunk away. When he reached the corner and looked back, Ergueta was waving his arms about as he talked to the waiter.</div>
''';

  static const String title5_1 = 'CHAPTER ONE : HATRED (1)';
  static const String text5_1 = '''
     <div class="paragraph">Erdosain’s life was bleeding away. All his pent-up despair drained out towards the horizon he glimpsed beyond telephone cables and trolley-bus wires; he suddenly had the feeling he was treading on his anguish as if it were a carpet. Just as horses who have had their guts ripped out by a bull slither about in their own intestines, so every step that Erdosain took left him with a little less lifeblood in his lungs. His breathing came slower and slower; he thought he would never arrive. Where? He had not the faintest idea.</div>
    <div class="paragraph">He sat on the doorstep of an empty house on Piedras. He stayed there for several minutes, then got up and began to walk so quickly the sweat poured down his face as though it was a boiling hot day.</div>
    <div class="paragraph">He reached the comer of Cerrito and Lavalle.</div>
    <div class="paragraph">Plunging his hand into his pocket, he discovered a fistful of notes, so he slipped into the Japanese bar. Cabbies and thugs were clustered round the tables. A negro with a wing collar and black rope sandals was picking nits out of his armpit, and three Polish pimps, wearing huge gold rings on their fingers, were busy discussing brothels and madams in their own slang. In one corner several taxi drivers were playing cards. The negro delousing himself looked round him, as if inviting everyone to check his progress, but nobody paid him any attention.</div>
    <div class="paragraph">Erdosain ordered a coffee, held his head in his hands and stared down at the counter. “Where can I get those 600 pesos?”</div>
    <div class="paragraph">Then he thought of Gregorio Barsut, his wife’s cousin.</div>
    <div class="paragraph">All at once Ergueta’s rejection was forgotten. Erdosain conjured up a mental picture of this other man, Gregorio Barsut, with his shaved head, bony bird of prey nose, his green-tinged eyes and pointed wolf ears. The image made his hands tremble and left his throat dry. He would ask him for money that same night. He was bound to turn up as usual around half-past nine. Erdosain pictured him there, gabbling vague excuses for his visit, torrents of words that engulfed Erdosain like rushing sand.</div>
    <div class="paragraph">He remembered how Barsut would go on endlessly, jumping with feverish agility from one topic to another, fixing his depraved gaze on Erdosain who, mouth parched and hands trembling, did not have the courage to throw him out of the house.</div>
    <div class="paragraph">And Gregorio Barsut must have been aware of the revulsion he caused in Erdosain, because more than once he had said to him:</div>
    <div class="paragraph">“My conversation isn’t much to your liking, is it?” &mdash; not that this in any way stopped him being an annoyingly frequent visitor to their home.</div>
    <div class="paragraph">Erdosain always quickly denied the charge, and tried to give the impression he was interested in the other man’s chatter, which went on aimlessly hour after hour, while the whole time Barsut stared at the south-east corner of the room. What on earth did he mean by doing that? At such unpleasant moments, Erdosain consoled himself with the thought that Barsut lived consumed by jealousy and suffered terribly for no apparent reason.</div>
    <div class="paragraph">One night, on one of the rare occasions that Erdosain’s wife had not locked herself in the next room to avoid having to listen to them, Gregorio said: “How amazing it would be if I went mad and shot you both, then killed myself too!”</div>
    <div class="paragraph">His slant eyes were still fixed on the south-east corner of the room. He smiled and showed his pointed teeth, as if to dismiss what he had said as a joke. But Elsa looked at him grim-faced and replied: “Let that be the last time you say such a thing in my house. Otherwise, you’ll never set foot here again.”</div>
''';

  static const String title5_2 = 'CHAPTER ONE : HATRED (2)';
  static const String text5_2 = '''
    <div class="paragraph">Gregorio tried to apologise. But Elsa left and they did not see her again that night.</div>
    <div class="paragraph">The two men carried on talking. Barsut was paler than ever, his low forehead a mass of nervous twitches, and he kept running his broad hand through the bristles of his bronze-coloured hair.</div>
    <div class="paragraph">Erdosain could find no explanation for the hatred Barsut inspired in him. He imagined him to be a coarse, vulgar man, but this did not tally with certain dreams Gregorio had, which revealed a strange, ill-defined but delicate nature governed by the most inexplicable feelings.</div>
    <div class="paragraph">Sometimes though, his apparent or real vulgarity became openly repugnant, and Erdosain had to bite back his indignation with a twist of his pallid lips, while Barsut poured out indescribable obscenities for the sole pleasure of wounding the other man’s sensibility.</div>
    <div class="paragraph">Theirs was an invisible, underhand duel, fought without any immediate aim, but so unnerving that whenever Barsut left, Erdosain swore he would not receive him the next day. Yet a few hours before nightfall, Erdosain found himself already thinking of him.</div>
    <div class="paragraph">Often Barsut arrived and started talking even before he had sat down: “Know something? I had the strangest dream last night.”</div>
    <div class="paragraph">Unsmiling, his gaze fixed on the south-east corner of the room, an almost doleful expression on his face grimy with a three days’ beard, Barsut launched into a tedious monologue that revealed the terrors a twenty-seven-year-old may have: for example how he had been scared by a one-eyed fish winking at him in the dream, then how he had linked the one-eyed fish to the snooping gaze of an ancient madam hooked on spiritualism who was trying to get him to marry her daughter, and then spinning out his conversation in so many absurd directions that soon Erdosain forgot his loathing and instead wondered if the other man were not stark, staring mad. While Erdosain listened, paralysed and deeply disturbed, Elsa sat sewing in the next room, oblivious to it all.</div>
    <div class="paragraph">Erdosain could feel a quiver of impatience setting his knuckles knocking, and the effort he made to conceal this spasm exhausted him. It was only with the utmost difficulty that he could get out any words at all, as if his lips were stuck together with glue.</div>
    <div class="paragraph">Propping himself up at the table on one elbow, and straightening the crease in his trousers with the other hand, Barsut sometimes complained that nobody loved him. He stared straight at Erdosain as he said this. At other times, he scoffed at his own fears &mdash; and at a ghost he said he saw in the corner of the lavatory of his rooming-house, the ghost of a giant woman with bony arms, who carried a broom, and stared at him like a harpy. On other evenings he admitted that if he was not already a sick man he would end up being so. Feigning concern for his state of health, Erdosain would enquire about the symptoms and recommend he rest and stay in bed; once, when he insisted, Barsut maliciously retorted: “Does my being here bother you that much?”</div>
    <div class="paragraph">Other nights Barsut was sinisterly cheerful when he came in, like some sour drunk who has set fire to a petrol station. He would reel around the dining-room, slapping Erdosain on the back so often it set his teeth on edge, and asking him over and over: “How’s it going? How are you?”</div>
    <div class="paragraph">Barsut’s eyes would flash, while Erdosain stood there forlorn and hunched, wondering what it was that so inhibited him in the other man’s presence, like now as he sat perched on the edge of his chair, still relentlessly spying out the corner of the room.</div>
    <div class="paragraph">They always avoided each other’s eyes.</div>
    <div class="paragraph">There was an ill-defined, obscure link between them, of the kind that two men who heartily loathe each other endure for reasons they cannot fathom.</div>
    <div class="paragraph">Erdosain hated Barsut, but with an insipid, cowardly rancour made up of wicked fantasies and even more terrible possibilities. And his hatred was all the more intense for not having any specific focus.</div>
''';

  static const String title5_3 = 'CHAPTER ONE : HATRED (3)';
  static const String text5_3 = '''
    <div class="paragraph">Sometimes he found himself imagining a ghastly revenge, and he frowned deeply as he conjured up the worst catastrophes. But the following day when Barsut knocked at the street door, Erdosain would tremble like an adulterous woman caught out by her husband, and he once even flew into a rage at Elsa because she was slow in opening it, commenting in a way aimed at disguising his cowardice: “He’ll think we don’t want to invite him in. If that’s the case, we should tell him not to come any more.”</div>
    <div class="paragraph">Lacking any real motive, this subterranean loathing spread in Erdosain like a cancer. Barsut’s every gesture gave him an excuse to feel outraged, to wish him a horrible death. And as if sensing these feelings, Barsut seemed unconsciously to respond in the most revolting way. Erdosain never forgot the following instance:</div>
    <div class="paragraph">It was one evening when they had gone out for a cocktail. With their drinks, the waiter brought a plate of potato salad and mustard. Barsut stuck the toothpick so greedily into a piece of potato that he spilt the salad all over the marble table-top, filthy from cigarette ash and other people’s dirty hands. Erdosain watched in disgust as Barsut mockingly scooped up the salad piece by piece, and then when he reached the last one, smeared it in the mustard spilt on the marble, and popped it in his mouth with an ironic smile.</div>
    <div class="paragraph">“Why don’t you lick the table-top?” Erdosain observed with distaste. Barsut threw him a wild, provocative glance. Then he bent over and licked the whole marble top spotless.</div>
    <div class="paragraph">“Satisfied?”</div>
    <div class="paragraph">Erdosain had turned white.</div>
    <div class="paragraph">“Have you gone crazy?”</div>
    <div class="paragraph">“What’s the matter? Don’t tell me you’re upset.”</div>
    <div class="paragraph">Then all at once Barsut burst out laughing and was all smiles again, suddenly released from the fury that had gripped him all evening. Soon he got up and continued talking his usual nonsense.</div>
    <div class="paragraph">Erdosain never forgot that sight: the bronze bristles of Barsut’s head bent over the marble top, a tongue stuck in the viscous grime of the yellow stone.</div>
    <div class="paragraph">He often thought that Barsut must hate him because of all he had confided in him. And yet he could not contain himself &mdash; no sooner did he arrive at Erdosain’s house than he began to pour out his unhappiness by the bucketful into his host’s ear, even though he knew this only made Erdosain rejoice all the more.</div>
    <div class="paragraph">The fact was that Remo drew out these confessions, encouraging them with a fleeting but real compassion which made Barsut’s hatred of him dissolve whenever he offered serious advice. But the loathing came rushing back whenever he caught one of Erdosain’s rapid, furtive glances which showed his pity had given way to an evil glee at the proof of Barsut’s miserable existence because although he had enough money to get by without working, Barsut was terrified at the thought he might go insane as his father and brothers had done before him.</div>
    <div class="paragraph">Suddenly, Erdosain straightened up. The negro with the wing collar had stopped picking at himself; the three pimps were sharing out bundles of money while the cab drivers at the other table shot them avid looks out of the corner of their eyes. The negro was staring so pathetically at the pimps it seemed as though the magic of the money was about to make him sneeze.</div>
    <div class="paragraph">Erdosain stood up and paid. Then he left, saying to himself: “If Gregorio fails, I’ll ask the Astrologer for the money.”</div>
''';

  static const String title6_1 = 'CHAPTER ONE : THE INVENTOR’S DREAMS (1)';
  static const String text6_1 = '''
    <div class="paragraph">If anyone had forewarned Erdosain that a few hours later he would be plotting to kill Barsut and that he would be watching passively as his wife left him, he would never have believed it.</div>
    <div class="paragraph">He wandered around the whole afternoon. He needed to be on his own, to forget human voices and to feel as cut off from all that surrounded him as someone who has missed his train in a strange city.</div>
    <div class="paragraph">He walked along the lonely arcades of Arenales and Talcahuano, the corners of Charcas and Rodríguez Peña, the crossroads at Montevideo and Quintana, enjoying this magnificent architectural spectacle for ever denied to the poor and wretched. Leaves from the plane trees crunched under his feet as he stared up at the rounded panes of the huge windows, silvered by the gleaming white of their lace curtains. This was a world far from the brutish city he knew, another world he could feel his heart yearning for with a slow, heavy, beat.</div>
    <div class="paragraph">He came to a halt to peer at garages as splendid as silver dishes for mass, or the green plumes of cypresses protected behind crenellated walls, or railings thick enough to stop a charging lion. Red gravel curled among ovals of green flowerbeds. Occasionally a governess in a grey cap strolled along a garden path.</div>
    <div class="paragraph">And he owed 600 pesos and seven cents!</div>
    <div class="paragraph">He stared fascinated at balustrades highlighting black balconies with the round warmth of gold, at windows painted pearl grey or café-au-lait, at panes of glass so thick they must make all passers-by look as if they were walking underwater, at lace curtains so flimsy even their names must be as fascinating as the geography of distant lands. How different love must be in the shade of those tulle curtains, filtering the light and softening every sound …!</div>
    <div class="paragraph">But he owed 600 pesos and seven cents. And the pharmacist’s words reverberated in his ears: “You’re right … the world is full of riff-raff … of unhappy wretches … but what’s to be done about it? … How can we present the sacred truths anew to these faithless people …?”</div>
    <div class="paragraph">Like one of those plants whose growth is stimulated by electric light, despair sprouted from deep within his chest until it almost choked him.</div>
    <div class="paragraph">Standing there, it seemed to Erdosain that each worry was an owl that flitted from one branch of his suffering to the next. He owed 600 pesos and seven cents, and even though he tried to forget it by pinning his hopes on Barsut or the Astrologer, his thoughts drifted off again down a dark street. Strings of lights were hung from the rooftops. Below, a cloud of dust filled the black well of the street. Yet he was walking towards a land of happiness, with the Sugar Company behind him. What had he done with his life? Was this the moment to ask himself the question? How could he walk if his body was a deadweight of seventy kilos? Or was he simply a ghost, recalling events that had happened during its life on earth?</div>
    <div class="paragraph">So many things were rushing around deep inside him! What to make of the pharmacist who had married a prostitute? And Barsut, pursued by the one-eyed fish and the spiritualist’s daughter? And Elsa, who would not surrender herself to him, but threatened to throw him out? Was he mad or not?</div>
    <div class="paragraph">He asked himself this because there were moments when a strange hope sprang up in him.</div>
''';

  static const String title6_2 = 'CHAPTER ONE : THE INVENTOR’S DREAMS (2)';
  static const String text6_2 = '''
    <div class="paragraph">He imagined that through a spyhole in the blinds of one of these magnificent palaces, a “melancholy, taciturn millionaire” (those were Erdosain’s exact words) was examining him through a pair of opera glasses.</div>
    <div class="paragraph">The strange thing was that when Erdosain thought the “melancholy, taciturn millionaire” might be observing him, he put on a sorrowful, intent expression and stopped looking at the legs of maids passing by, pretending to be caught up in a tremendous inner tussle. He put on this show because he reckoned that if the “melancholy, taciturn millionaire” saw him looking at maids’ legs, he would conclude he was not sufficiently troubled to merit his compassion.</div>
    <div class="paragraph">Erdosain even went so far as to believe that having seen the countless years of suffering etched into the taut muscles of his face, the “melancholy, taciturn millionaire” might send for him at any moment.</div>
    <div class="paragraph">This obsession grew so strong this particular afternoon that he was even suddenly convinced that a flunkey in a red and yellow striped waistcoat who was staring at him brazenly from a hotel door must be the go-between for the “melancholy, taciturn millionaire”.</div>
    <div class="paragraph">Then the butler called him. He followed. He walked across a garden full of spiky cactuses, they went into a large room, where he was left alone for a few minutes. The whole building was in darkness. A single lamp shone in a comer of the room. On the piano bracket, music sheets gave off a scent that showed they were always played by female hands. A woman’s marble bust stood neglected on the sill of a window draped in purple. The cushions on the easy chairs were covered with material like Cubist paintings, and on the desk were burnished bronze ashtrays and a small harlequin statue.</div>
    <div class="paragraph">When in his life had Erdosain ever been in a room like the one that now appeared in his imagination? He had no recollection of it. Nevertheless, he saw a huge ebony frame with parallel borders that rose towards a gleaming white ceiling. Its plaster glow lit a marine landscape depicting a dreary wooden bridge beneath whose gigantic arches toiled a mass of indistinct figures, blotched with rusty shadows as they hauled along huge loads, against the background of a bloody, cast-iron sea out of which in the distance loomed a stone wharf cluttered with an assortment of cranes, rails and capstans.</div>
    <div class="paragraph">This was the room Elsa had glided through when she was his fiancee. Yes, perhaps, but why recall it now? He was the swindler, the man with the down-at-heel boots, the ragged tie, the greasestained suit, the man who earned his living in the street while his sick wife had to take in laundry. He was all this and nothing more. That was why the “melancholy, taciturn millionaire” had sent for him.</div>
    <div class="paragraph">Carried away by his fantasy &mdash; which had become almost real thanks to the scenes and images recreated by his great, invisible benefactor &mdash; Erdosain could scarcely be bothered to linger over the details of his meeting with the “melancholy, taciturn millionaire” who was offering him the money to put his inventions into practice but, like those readers of thrillers who in their hurry to reach the climax of the plot skip the “boring bits”, he omitted several less interesting episodes his imagination suggested, and portrayed himself as out on the street once more, even though that was where he actually was.</div>
    <div class="paragraph">At that, leaving the corner of Charcas and Talcahuano, or Arenales and Rodriguez Pena, he would stride off purposefully agam.</div>
    <div class="paragraph">The depths of despair gave way to the wildest hopes.</div>
    <div class="paragraph">He would triumph &mdash; yes, he would! With the money from the “melancholy, taciturn millionaire” he would set up an electrical laboratory, where he would dedicate himself to the study of betarays, the cordless transmission of energy and electro-magnetic currents. He would grow old, like the absurd character in an English novel, without losing his youth; the only sign would be that his face grew gradually whiter until it took on the pale sheen of marble, while his flashing wizard’s eyes would seduce every young woman on earth.</div>
    <div class="paragraph">Night was falling, and Erdosain suddenly remembered that the only one who could save him from his dreadful predicament was the Astrologer. This thought drove everything else from his mind. Perhaps he had money. Erdosain even suspected he might be a bolshevik agent sent to spread communist propaganda in Argentina, because he had an extraordinary plan to set up a revolutionary society. Without hesitating, Erdosain hailed a cab and told the driver to take him to Constitución station. There he bought a ticket to Temperley.</div>
''';

  static const String title7_1 = 'CHAPTER ONE : THE ASTROLOGER (1)';
  static const String text7_1 = '''
    <div class="paragraph">The house the Astrologer lived in stood at the centre of a weekend farm. Its red tiles were visible from far away through the surrounding trees. In the clearings between their weighty trunks, deep in huge waves of grasses and creepers, fat, black-rumped insects spent the entire day buzzing about in a constant shower of weeds and stalks. Not far from the house, the three blades of a wind-pump limped round on its rusty iron support, while further off, the blue and red glass panes of a stable door shone dully. Behind the wind-pump and the house, on the other side of low walls, loomed the dark bottle-green crests of a eucalyptus grove, silhouetted against a navy-blue sky.</div>
    <div class="paragraph">Chewing on a honeysuckle, Erdosain strode across to the house. He felt as if he were far from the city, in the middle of the countryside, and the sight of the building came as a relief. Although it had a low outline, it had two floors, with a crumbling balcony around the top floor, and a ridiculous Greek column affair at the entrance, approached by steps flanked by palm trees.</div>
    <div class="paragraph">The red tiles angled down so that the house eaves sheltered the attic skylights and small windows; through the dainty foliage of chestnut trees, above pomegranate trees starred with their scarlet asterisks, a zinc weathervane swung its twisted tail at the mercy of the winds. The subtleties of the garden, laid out like a grove, unfolded all around Erdosain. In the still evening air, with the sun lending a mother-of-pearl sheen to everything, the rose bushes gave off such a strong and penetrating scent that it seemed the whole garden was tinged with a red shimmer as cool as a mountain stream.</div>
    <div class="paragraph">Erdosain thought:</div>
    <div class="paragraph">“Even if I had a silver boat with golden sails and ivory oars and the ocean shone with seven colours, and a millionairess was blowing me kisses from the moon, I would still be as sad as I am now … But what am I saying? I could live better here than in the city. Here at least I could have a laboratory.”</div>
    <div class="paragraph">A leaky tap dripped into a barrel. A dog lay dozing at the front of a summerhouse &mdash; and when Erdosain stopped to call out from the foot of the steps, the giant figure of the Astrologer soon appeared in the doorway, dressed in a yellow smock and with his hat tilted forward over his brow so that his broad flat face was in shadow. A few stray curls hung down the sides of his face, and his nose, broken in the middle, was squashed to the left in an extraordinary fashion. A pair of round, darting black eyes shone from beneath bushy eyebrows, and this, together with the harsh lines scouring his rough cheeks, made it look as if the Astrologer’s face was sculpted in lead. How heavy that head must have been!</div>
    <div class="paragraph">“Oh, it’s you, is it? Come in. You can meet the Melancholy Thug.”</div>
    <div class="paragraph">They crossed a dark and dank hallway and went into a study decorated with a faded green flowered wallpaper.</div>
    <div class="paragraph">Cobwebs dangling from the high ceiling, and the studded grille covering the narrow window gave the room a frankly sinister look. In one corner, the metalwork of an old-fashioned wardrobe refracted the bluish atmosphere into dark and light shadows. A man dressed in grey was sitting in a threadbare green velvet armchair. A shock of dark hair hung down his forehead; he was wearing tan spats. As he approached this stranger, the Astrologer’s smock billowed out.</div>
    <div class="paragraph">“Erdosain, let me introduce you to Arturo Haffner.”</div>
    <div class="paragraph">On another occasion, the swindler would have enjoyed a long talk with the man whom in private the Astrologer called The Melancholy Thug, and who now, after shaking hands with Erdosain, crossed his legs in the armchair and leaned his blue-tinged cheek on three fingers with manicured nails. Erdosain took stock of his almost perfectly round, relaxed face, where only the mocking, evasive gleam deep in his eyes and the habit of raising one eyebrow when listening betrayed that he was a man of action. Between the jacket and the silk shirt the Thug was wearing, Erdosain caught a glimpse of a black revolver butt. Faces don’t give much of a clue to people, really.</div>
    <div class="paragraph">Then the Thug turned back to look at a map of the United States of America, which the Astrologer was striding towards, pointer in hand. He stopped in front of it, his yellow arm blocking out the blue Caribbean Sea. He announced:</div>
    <div class="paragraph">“In Chicago alone, the Ku-Klux-Klan had 150,000 members … In Missouri, 100,000. It’s said that in Arkansas there are more than 200 ‘caverns’. In Little Rock, the Invisible Empire claims that every single Protestant preacher is a member of the brotherhood. In the state of Texas, it enjoys absolute control in the cities of Dallas, Fort Worth, Houston and Beaumont. In Binghamton, the birthplace of Smith the Great Dragon of the Order, there were 75,000, while in Oklahoma the Klan forced the legislature to pass a bill suspending Governor Walton for attacking them, with the result that until a short while ago the state was practically run by the Klan.”</div>
    <div class="paragraph">The Astrologer’s yellow smock looked like a Buddhist monk’s robe.</div>
    <div class="paragraph">He went on:</div>
    <div class="paragraph">“Do you know they burnt a lot of people alive?”</div>
    <div class="paragraph">“Yes,” the Thug said, “I read the cables.”</div>
    <div class="paragraph">Erdosain considered the Melancholy Thug again. The Astrologer had given him the nickname because once many years earlier the pimp had tried to kill himself. It remained a mysterious episode. From one day to the next, Haffner, who had been living off prostitutes for a long while, suddenly fired a shot into his chest, close to the heart. His life was saved only due to the fact that this organ contracted at the precise moment the bullet whizzed by. After that, naturally enough, he went on with his life as before, perhaps enjoying an even greater reputation in the eyes of his rapacious comrades, none of whom could explain his strange gesture. The Astrologer went on:</div>
''';

  static const String title7_2 = 'CHAPTER ONE : THE ASTROLOGER (2)';
  static const String text7_2 = '''
    <div class="paragraph">“The Ku-Klux-Klan collected millions …”</div>
    <div class="paragraph">The Thug stirred and protested:</div>
    <div class="paragraph">“Yes, and the Dragon … some dragon he is! And the Dragon is being tried for embezzlement …” The Astrologer pretended he had not heard: “What is to prevent there being a secret society as powerful as the Klan here in Argentina? I’m telling you honestly &mdash; I don’t know if our society would be bolshevik or fascist. Sometimes I think the best thing would be to concoct such an unholy mixture that not even God could untangle it. I’m being completely frank with you now. For the moment, what I’m aiming for is a huge undefined mass which could accommodate every possible human aspiration. My plan is to target young bolsheviks, students and intelligent proletarians. We will also welcome all those who have some grandiose scheme for reshaping the universe, all those clerks who dream of becoming millionaires, all the failed inventors &mdash; don’t take that personally, Erdosain &mdash; all those who have lost their job, whatever it might have been, those who are being taken to court and have no idea where to turn …”</div>
    <div class="paragraph">Erdosain remembered the mission he had come on, and broke in: “I need to talk to you …”</div>
    <div class="paragraph">“Just a moment … I’ll be with you right away,” said the Astrologer, and then he went on: “The strength of our society won’t depend so much on what its members donate as on the earnings from the brothel each cell will run. And when I talk of a secret society, I don’t mean the traditional kind, but a super-modern one, in which each member or associate has a stake and earns a profit &mdash; that’s the only way to get them to identify more and more closely with its aims, although these will only really be known to a few. That’s the commercial side of things. The brothels will guarantee enough income to support the growing number of ventures the society undertakes. We’ll set up a revolutionary training camp in the mountains. The new recruits will undergo instruction in anarchist tactics, revolutionary propaganda, military engineering, industrial relations, so that the day they leave the colony they can set up a branch of the society anywhere … D’you follow me? The secret society will have its own academy, the Academy for Revolutionaries.”</div>
    <div class="paragraph">The clock on the wall struck five. Erdosain felt he had no time to lose, and blurted out: “I’m sorry to interrupt you. I’ve come on important business. Do you have 600 pesos?”</div>
    <div class="paragraph">The Astrologer put down his pointer and folded his arms:</div>
    <div class="paragraph">“What’s got into you?”</div>
    <div class="paragraph">“If I don’t repay the Sugar Company 600 pesos by tomorrow, I’ll go to gaol.”</div>
    <div class="paragraph">Intrigued, the two men stared at Erdosain. He must really be in a bad way to be begging like this. Erdosain went on:</div>
    <div class="paragraph">“You have to help me. Over the past few months I’ve stolen 600 pesos. Someone sent an anonymous letter betraying me. If I don’t return the money tomorrow I’ll be arrested.”</div>
    <div class="paragraph">“How did you steal the money?”</div>
    <div class="paragraph">“Bit by bit …”</div>
    <div class="paragraph">The Astrologer stroked his beard thoughtfully.</div>
    <div class="paragraph">“But how did you do it?”</div>
    <div class="paragraph">Erdosain had to go over the details. Whenever storekeepers were delivered goods, they signed a note promising to pay the value of what they had received. At the end of each month, Erdosain and two other collectors were given these notes, and they had thirty days to recover the money owed. The collectors kept all the notes that had not been cancelled &mdash; according to them &mdash; until such time as the debtor finally paid up. Erdosain continued:</div>
    <div class="paragraph">“Imagine, our bookkeeper was so careless that he never once checked the vouchers we claimed were unpaid, so that if we did collect the money but kept it back, we could balance the books with the money we got from another account settled later on. D’you follow?”</div>
    <div class="paragraph">Erdosain was the apex of the triangle formed by the three seated men. The Melancholy Thug and the Astrologer glanced at each other from time to time. Haffner flicked off the ash from his cigarette, then examined Erdosain from head to toe, one eyebrow raised. Finally, he put him this odd question:</div>
    <div class="paragraph">“Did you get any pleasure from stealing?”</div>
    <div class="paragraph">“No, none at all.”</div>
    <div class="paragraph">“Well then, how come your boots are such a mess?”</div>
    <div class="paragraph">“I earned hardly anything.”</div>
''';

  static const String title7_3 = 'CHAPTER ONE : THE ASTROLOGER (3)';
  static const String text7_3 = '''
    <div class="paragraph">“What about the money you stole?”</div>
    <div class="paragraph">“It never occurred to me to use it to buy shoes with.”</div>
    <div class="paragraph">This was true. The initial pleasure Erdosain had felt at getting away scot-free with something that was not his had soon evaporated, until one day he discovered in himself the kind of anguish that leads people to see sunny skies as blackened by a soot only visible to a soul in torment.</div>
    <div class="paragraph">When Erdosain had realised he owed 400 pesos, the shock drove him close to madness. From then on, he spent the money in the most stupid, frenzied ways possible. He bought expensive chocolates although he had never liked them, lunched on crab, turtle soup and frogs’ legs in restaurants where the mere privilege of sitting next to elegant people costs a fortune; he drank expensive liquors and wines that tasted insipid to his untutored palate; and yet he never thought of buying anything he needed for day-to-day living, like underwear, shoes, ties …</div>
    <div class="paragraph">He doled out money freely to beggars, and regularly left extravagant tips for the waiters who served him, in an effort to erase all traces of the stolen money in his pocket, knowing he could replenish it the next day without risk.</div>
    <div class="paragraph">“So it never occurred to you to buy shoes?” Haffner insisted.</div>
    <div class="paragraph">“Now that you come to mention it, it seems odd to me as well, but the truth is I never imagined that stolen money could be used to buy that kind of thing.”</div>
    <div class="paragraph">“So what did you spend it on?”</div>
    <div class="paragraph">“I gave 200 pesos to the Espilas, a family I’m friendly with, so that they could buy an accumulator and set up a galvano-plastics workshop to make a copper rose, which is …”</div>
    <div class="paragraph">“Yes, I already know about that …”</div>
    <div class="paragraph">“I’ve told him about it,” the Astrologer explained.</div>
    <div class="paragraph">“What about the other 400?”</div>
    <div class="paragraph">“I don’t know … I’ve spent it on ridiculous things …”</div>
    <div class="paragraph">“What do you intend to do now?”</div>
    <div class="paragraph">“I’ve no idea.”</div>
    <div class="paragraph">“Don’t you know anyone who could help?”</div>
    <div class="paragraph">“No, no-one. Ten days ago I asked a relative of my wife’s, Barsut. He said he couldn’t …”</div>
    <div class="paragraph">“So you’ll go to gaol then?”</div>
    <div class="paragraph">“It seems so.”</div>
''';

  static const String title7_4 = 'CHAPTER ONE : THE ASTROLOGER (4)';
  static const String text7_4 = '''
    <div class="paragraph">The Astrologer turned to the pimp and said: “You know, I have 1,000 pesos. I need it if my project is to get off the ground. All I can offer you, Erdosain, is 300 pesos. But what a mess you’ve got yourself into, haven’t you?”</div>
    <div class="paragraph">At this, Erdosain turned to Haffner as well and burst out:</div>
    <div class="paragraph">“It’s the despair, you see … that damned feeling of anguish that drags you down …”</div>
    <div class="paragraph">“What d’you mean?” the Thug asked.</div>
    <div class="paragraph">“Anguish is what it’s all about. That’s why you rob, and get in messes like this. You’re walking the streets under a yellow sun that’s like a plague sun … You must have felt the same. Having 5,000 pesos in your wallet, but still feeling crushed. Then all of a sudden a tiny whisper of an idea suggests robbery. That night you’re so overjoyed you can’t sleep. The next day you try it out nervously, and it’s such a success that there’s no other choice but to go on … just like when you tried to kill yourself.”</div>
    <div class="paragraph">As Erdosain said this, Haffner got up and crouched on the chair, clasping his knees in his hands. The Astrologer tried to interrupt Erdosain, but he was having none of it, and rushed on:</div>
    <div class="paragraph">“Yes, just like when you tried to kill yourself. I’ve often pictured it. You’d got bored with being a ponce &mdash; you can’t imagine how much I wanted to meet you! I would say to myself: this must be a really strange guy! Out of 100,000 men who live off women the way you do, there is only one like you. You asked me if I got any pleasure from stealing. What about you: do you enjoy being a pimp? Tell me, do you get any pleasure from it? … Ah, what the hell! I didn’t come here to explain myself. What I need is money, not words.”</div>
    <div class="paragraph">Erdosain had stood up, and was nervously twisting the brim of his hat between his fingers. He stared defiantly at the Astrologer, whose hat was blocking out the state of Kansas on the map, and at the Thug, who had slipped his hands into his waistband. Haffner dropped his feet down again out of the threadbare green velvet chair, rested his cheek on his plump fingers, and said coolly, with a sly smile:</div>
    <div class="paragraph">“Sit down, my friend, I’ll give you the 600 pesos.” Erdosain trembled. Then, rooted to the spot, he stared for a long while at the Thug, who repeated, stressing his words: “Sit down and don’t worry. I’ll give you the 600 pesos. That’s what we men are here for.”</div>
    <div class="paragraph">Erdosain did not know what to say. The same emptiness he felt when the man with the boar’s head had told him he could go, that same sad empty feeling gripped him now. So life was not so bad after all!</div>
    <div class="paragraph">“Let’s do it this way,” the Astrologer said. “I’ll give him 300, and you the other three.”</div>
    <div class="paragraph">“No,” Haffner objected. “You need the money. I don’t. I have three women looking after that.” Then he turned to Erdosain: “See how easily things can be sorted out? Are you satisfied?”</div>
    <div class="paragraph">He spoke with a wily calm, as confident as a farmer who knows that his experience of nature will always provide him with a way out of even the most complicated situation. It was only now that Erdosain became aware of the overpowering scent of the roses and the sound of the dripping tap through the half-open window. Outside, the paths wound round the house in the afternoon sun, and the birds weighed down the pomegranate trees, starred with their scarlet asterisks.</div>
    <div class="paragraph">A malicious gleam reappeared in the Thug’s eyes. He awaited Erdosain’s explosion of joy, one eyebrow lifted higher than the other, but when nothing happened, he said:</div>
''';

  static const String title7_5 = 'CHAPTER ONE : THE ASTROLOGER (5)';
  static const String text7_5 = '''
    <div class="paragraph">“Have you been living like this for a long time?”</div>
    <div class="paragraph">“Yes, a long time.”</div>
    <div class="paragraph">“D’you remember, even though you never said anything to me, I once told you you couldn’t go on living that way?” the Astrologer put in.</div>
    <div class="paragraph">“Yes, but I didn’t want to talk about it. I don’t know why, but you don’t share things you can’t explain to yourself with the people you trust the most.”</div>
    <div class="paragraph">“When are you going to give the money back?”</div>
    <div class="paragraph">“Tomorrow.”</div>
    <div class="paragraph">“I’ll write you a cheque now, then. You’ll have to cash it in the morning.”</div>
    <div class="paragraph">Haffner went over to the bureau. He took his cheque book out of his pocket and wrote the amount with a firm hand, then signed it.</div>
    <div class="paragraph">Erdosain was standing stock still, but his mind raced off on a minute-long journey like someone floating through a dream landscape &mdash; the kind of experience that afterwards seems to prove life is shot through with a prescient fatalism.</div>
    <div class="paragraph">“At your service, my friend.” Erdosain took the cheque and without looking at it, folded it in four and put it in his pocket. All this had only taken a minute.</div>
    <div class="paragraph">What had happened was more unreal than anything written in a novel, but there he was, a man of flesh and blood. A man who did not know what to say. A minute earlier, he had owed 600 pesos and seven cents. Now he didn’t, and this marvel had been achieved by a single gesture from the Thug. According to everyday logic, what had just happened was impossible, and yet it had all seemed so perfectly natural. He wanted to say something. He took stock again of the man slumped in the threadbare velvet armchair. The revolver bulged under the grey jacket while Haffner nonchalantly leant his cheek on three glittering fingernails. He wanted to thank the Thug, but could not find the words to do so. The other man understood; he turned to the Astrologer, who had sat on a stool next to the desk, and said:</div>
    <div class="paragraph">“So obedience will be one of the main pillars of your society?”</div>
    <div class="paragraph">“And industry. We need gold to capture men’s imaginations. Just as in the past there were the mysticisms of religion and chivalry, so now we have to make industry mystical. To show people it’s just as noble to be in charge of a blast furnace as it was in the past to discover a continent. My politician, my political disciple in the society, will be someone who aims to conquer happiness through industry. This revolutionary will be as much at ease talking about a process for fabric design as about demagnetising steel. That’s why I thought so highly of Erdosain when I met him. His mind worked along the same lines as mine. You remember how often we talked about the way our ideas coincided? Creating a proud, fine, inexorable man who can dominate multitudes and show them a future based on science. How else can a social revolution come about? Today’s leader has to be a man who knows everything. And we shall forge this prince of wisdom. Our society will ensure it creates his legend and spreads it. A Ford or an Edison are a thousand times more likely to bring about a revolution than any politician. Do you think that dictatorships in the future will be military? No, sir. Soldiers are worth nothing compared to industrialists. They may be their tools, but nothing more. Nothing more. Our future dictators will be the kings of oil, steel, of wheat. And our society will prepare the ground for this. We’ll spread our theories everywhere. That’s why we need to study propaganda thoroughly. We have to use men and women students. We have to make science seem attractive, to familiarise people with it so that …”</div>
    <div class="paragraph">“I’m leaving,” Erdosain said.</div>
    <div class="paragraph">He was about to say goodbye to Haffner, when the Thug said:</div>
    <div class="paragraph">“I’ll go with you.”</div>
    <div class="paragraph">“In that case, I need a word with you.”</div>
    <div class="paragraph">The Astrologer took him outside, while Erdosain waited. Then the two men came back in, and when Erdosain turned to look back from the gate to the house, he could see the gigantic figure of the Astrologer waving in a gesture of farewell.</div>
''';

  static const String title8_1 =
      'CHAPTER ONE : OPINIONS OF THE MELANCHOLY THUG (1)';
  static const String text8_1 = '''
    <div class="paragraph">After they had turned the street corner outside the house, Erdosain said: “I don’t know how to thank you for the tremendous favour you’ve done me. Why did you give me the money like that?”</div>
    <div class="paragraph">Haffner, whose shoulders twitched nervously as he walked along, turned to him coldly and replied: “I’ve no idea. You caught me at a good moment. It’d be a different matter if one had to do it every day … but like this … and anyway, remember that I’ll get it back within the week …”</div>
    <div class="paragraph">Erdosain could not help asking: “But how is it that with the fortune you have already, you’re still out there pimping?”</div>
    <div class="paragraph">Angry, Haffner turned to face him, then said: “Look, pimping isn’t something anyone could do. And why should I leave three women who between them bring in 2,000 pesos a month in the lurch? Would you? No. Well then?”</div>
    <div class="paragraph">“But don’t you care for them? Isn’t there anyone of them you’re particularly attracted to?” As soon as he had asked the question, Erdosain realised how stupid it was. The pimp stared at him for a moment, then retorted:</div>
    <div class="paragraph">“Just listen to me. If a doctor came to me tomorrow and told me: your Basque girl is going to die in a week, whether you take her out of the brothel or not, I’d allow that girl, who’s brought me in 30,000 pesos over the past four years, to work for six days and croak on the seventh.”</div>
    <div class="paragraph">The Thug’s voice had become harsh. There was a certain fierce bitterness to his words, the kind of bitterness that Erdosain would come to recognise in the voice of all the tight-lipped lowlifes, all the bored gangsters he was to meet.</div>
    <div class="paragraph">“Pity?” the other man went on. “The last thing those whores need is pity. They’re tough, vindictive bitches, that’s what they are. Don’t be astonished, I know what I’m talking about. They only respond to a good beating. Like nine out of ten people, you think the pimp is the one who does the exploiting, and that the girl is the victim. But tell me this: why does a girl need all the money she earns? What the novelists don’t write is that a prostitute who hasn’t got a man is always searching desperately for someone who’ll deceive her, beat up on her from time to time and take all her money, because that’s how dumb they are. It’s been said women are men’s equals. Pure hogwash. Women are inferior to men. Just look at savage tribes. There it’s the women who cook, work and do everything, while the males go hunting or off to fight. It’s the same today. Apart from making money, men do nothing. And make no mistake, a whore will despise any man who doesn’t take her money. Oh yes, as soon as they feel soft on you, the first thing they want is to be asked for money … you can’t imagine how delighted they are the day you say: ‘<em class="calibre11">Ma chérie</em>, could you lend me 100 pesos?’ It’s guaranteed to bowl her over, make her feel good. At last the filthy money she earns is going to a good cause, to making her man happy. Of course, no novelist has ever written that. So people reckon we’re monsters, or zoo animals, as we’re painted in cheap fiction. But if you come and live in our world and get to know it well, you’ll see it’s just the same as our bourgeoisie or our aristocracy. The kept woman looks down on the cabaret artiste, the artiste looks down on the streetwalker, the streetwalker looks down on the girl in a brothel, and what’s most surprising, the brothel girl nearly always chooses a real swine, while the cabaret artiste finds a daddy’s boy or a crooked doctor to run her. You want to know the psychology of a whore? A girl who a friend of mine had dropped put it in a nutshell when she told me in tears: ‘<em class="calibre11">Encore avec mon cul je peux soutenir un homme</em>.’ Ordinary people and novelists don’t know that. But it’s all in a French proverb: ‘<em class="calibre11">Gueuse seule ne peut pas mener son cul.</em>’”</div>
    <div class="paragraph">Erdosain stared at him dumbfounded. Haffner went on:</div>
    <div class="paragraph">“Who looks after her like her pimp? Who takes care of her when she’s ill, or been picked up by the police? What do people know? If one Saturday morning you heard a whore say to her ponce: ‘<em class="calibre11">Mon chéri</em>, I turned fifty more tricks than last week,’ you’d want to be a pimp too, wouldn’t you? Because she says that ‘fifty more tricks’ with just as much pride as an honest woman tells her husband: ‘Darling, this month I managed to save thirty pesos by not buying a new dress and by doing all the laundry myself.’ Take my word for it: women, honest or not, are creatures who like to sacrifice themselves. It’s the way they’re made. Why do you think the Fathers of the Church despised women so much? Most of them had lived in luxury off women, and knew what they were talking about. And whores are worse still. They’re like children: you have to tell them everything. ‘This is where you walk; don’t go past this corner; don’t give that mafioso the time of day. Don’t pick a fight with that woman.’ You have to teach them every single thing.”</div>
    <div class="paragraph">They were walking along past garden walls, and in the gentle evening air the pimp’s words left Erdosain gasping with shock. He realised he was brushing up against a life totally different from his own. He asked:</div>
    <div class="paragraph">“How did you get started?”</div>
    <div class="paragraph">“It was when I was young. I was twenty-three and a maths professor. That’s what I am,” Haffner explained proudly, “a mathematics professor. I was making my living teaching, when one night in a brothel on Rincon I met a young French girl I liked a lot. That was ten years ago. Just around that time I had inherited 5,000 pesos from a relative. I liked Lucienne, and asked her to come and live with me. She had a pimp, a huge brute of a fellow known as the Marsellais, who she saw occasionally. I don’t know whether it was my sweet talk or my looks, but the fact is she fell in love with me, and one stormy night I sneaked her out of the whorehouse. Talk about a drama! First we went to the hills in Cordoba, then to the seaside at Mar del Plata, and when we’d spent the whole 5,000, I told her: ‘Well, that’s the end of the idyll. It’s all over.’ But she said: ‘No, sweetheart, you and I will never part.’”</div>
''';

  static const String title8_2 =
      'CHAPTER ONE : OPINIONS OF THE MELANCHOLY THUG (2)';
  static const String text8_2 = '''
    <div class="paragraph">By now the two men were walking under leafy arches, intertwined branches and apses of greenery.</div>
    <div class="paragraph">“And I was jealous. Can you imagine what it’s like to be jealous of a woman who sleeps with everyone? Or how you feel at the first lunch she pays for with money from a sugar daddy? To eat with the wrong fork while the waiter looks at you both, realising what’s going on? Or the pleasure of going out into the street with her on your arm while the cops size you up? Or knowing that this woman, who sleeps with so many men, likes you, and only you? It’s a great feeling, I can tell you, when you’re with a streetwalker. And she’s the one who sees to it that you get another girl to use, she’s the one who brings her home, saying ‘we’re going to be sisters-in-law,’ she’s the one who breaks the new filly in so that she only turns tricks for you &mdash; and the more embarrassed and ashamed you are, the greater pleasure she gets from undermining your scruples, from bringing you down to her level, until suddenly … when you least suspect it, you’re up to your neck in filth … and that’s when the game really starts. And you have to take advantage while she’s stuck on you, because one fine day she’ll go crazy and fall for some other guy, and then in the same blind way she followed you, she’ll rush off again to the sacrifice. You might say: why does a woman need a man? But I tell you straight off: no brothel owner will deal with a woman. They always want to do business with her pimp. And the pimp’s the one who gives her peace of mind so that she can get on with her life. The cops don’t bother her. If she’s arrested, he gets her out; if she falls ill, he takes her to a clinic to be looked after; he keeps her out of trouble and does a thousand other unbelievable things just for her. Look, any woman who tries to work on her own in the business ends up either being assaulted, robbed or caught up in some other nasty affair. But a girl who’s protected by a man can work in peace, she’s no problems, nobody tries any funny stuff, everyone respects her. And since &mdash; for whatever reasons &mdash; she chose the life she’s leading, there’s no reason why she shouldn’t use her money to buy all the happiness she craves.</div>
    <div class="paragraph">“Of course, all this is new to you, but you’ll get used to the idea. And if you don’t agree, just explain how one ‘pimp’ can have as many as seven women. When that wop Repollo was in full swing, he had eleven girls working for him. And Julio the Dago had eight. Nearly all the Frenchies have three women. And not only do they all know each other, but they even live together, and compete to see who can give their man the most, because it’s an honour for them to be the favourite of someone who with a single glance can protect them from the toughest raid. And besides, the poor creatures are so crazy that you never know whether to feel sorry for them or to split their heads open with a blackjack.”</div>
    <div class="paragraph">Erdosain felt overwhelmed by the other man’s incredible contempt for women. He remembered how once the Astrologer had told him: “the Melancholy Thug is the kind of guy who when he sees a woman, the first thing he thinks is: ‘on the street, this filly would bring in five, ten or twenty pesos’. And nothing else.”</div>
    <div class="paragraph">Erdosain began to feel repelled by him. To change the conversation, he said: “OK, but tell me … d’you think the Astrologer’s scheme will work?”</div>
    <div class="paragraph">“No.”</div>
    <div class="paragraph">“Does he know that?”</div>
    <div class="paragraph">“Yes.”</div>
    <div class="paragraph">“So why do you go along with him?”</div>
    <div class="paragraph">“I only go along with him up to a certain point, and then simply because I’m so bored with everything. Life has no meaning, so why not follow whichever way the wind blows?”</div>
    <div class="paragraph">“So life has no meaning for you?”</div>
    <div class="paragraph">“Absolutely none. We’re born, we live, we die, but that doesn’t stop the stars spinning round or ants getting on with their work.”</div>
    <div class="paragraph">“And you’re really bored?”</div>
    <div class="paragraph">“So-so. I’ve planned out my life like an industrialist. Every day I go to bed at midnight and get up at nine in the morning. I do exercises for an hour, take a bath, read the newspapers, have lunch, sleep a siesta. Then at six I drink a cocktail and visit the barber. I dine at eight, then go out to a café, and two years from now when I’ve made 200,000 pesos, I’ll retire from the game and live for the rest of my life on my income.”</div>
    <div class="paragraph">“What’s your role in the Astrologer’s secret society meant to be then?”</div>
    <div class="paragraph">“If he finds the money, I’ll help him find the girls and set up the brothel.”</div>
''';

  static const String title8_3 =
      'CHAPTER ONE : OPINIONS OF THE MELANCHOLY THUG (3)';
  static const String text8_3 = '''
    <div class="paragraph">“But what d’you really think of the Astrologer deep down?”</div>
    <div class="paragraph">“That he’s a lunatic who may or may not succeed.”</div>
    <div class="paragraph">“But his ideas …”</div>
    <div class="paragraph">“Some of them are confused, others seem clear, but frankly I don’t know what he’s really aiming at. Sometimes it’s like listening to a reactionary, at others he sounds like a Red, and to tell you the truth I don’t think even he knows what he wants.”</div>
    <div class="paragraph">“And if he does succeed?”</div>
    <div class="paragraph">“Then God only knows what could happen! Oh, by the way, was it you who thought up the idea of cultivating Asiatic cholera bacillae?”</div>
    <div class="paragraph">“Yes … it would be a fantastic weapon against an army. Imagine releasing one batch in each army barracks. Thirty or forty men could destroy the army at a stroke and pave the way for the proletarian masses to make the revolution …”</div>
    <div class="paragraph">“The Astrologer thinks very highly of you. He’s always talked of you as someone who’s going to go a long way.”</div>
    <div class="paragraph">Erdosain grinned with pleasure.</div>
    <div class="paragraph">“Yes, we have to think of some way to destroy this society. But returning to what we were saying before: what I can’t grasp is your position with regard to the rest of us …”</div>
    <div class="paragraph">Haffner turned quickly towards Erdosain, looked him up and down as though surprised at his manner of speaking, then said with a mocking grin:</div>
    <div class="paragraph">“I’m not in any position, as you call it. You have to understand that helping the Astrologer is no skin off my nose. Beyond that, to me all his theories are so much hot air. He’s simply a friend who’s going to set up a business that’s legally accepted. That’s all. It’s the same to me whether he puts the money he makes from that business into a secret society or into a convent. So as you can see, any part I play in the famous society will be a completely disinterested one.”</div>
    <div class="paragraph">“But does it seem logical to you to base a revolutionary society on the exploitation of women through vice?”</div>
    <div class="paragraph">The Thug curled his lip. Then, shooting Erdosain a sideways glance, he replied:</div>
    <div class="paragraph">“You’re talking nonsense. Our present-day society is based on the exploitation of men, women and children. If you want to see what capitalist exploitation is really like, go take a look at the steelworks in Avellaneda, the meat-packing plants, the glassworks, or the match or tobacco factories.” He snickered unpleasantly as he said this. “Those of us who run girls have one or two of them; but industrialists control a whole mass of human beings. What would be the best name for them? And who is more heartless, a brothel owner or the shareholders of a large company? To look no further, didn’t they expect you to be honest on a wage of 100 pesos while you were carting around 10,000 in your wallet?”</div>
''';

  static const String title8_4 =
      'CHAPTER ONE : OPINIONS OF THE MELANCHOLY THUG (4)';
  static const String text8_4 = '''
    <div class="paragraph">“You’re right … but why did you give me the money then?”</div>
    <div class="paragraph">“That’s a different kettle of fish.”</div>
    <div class="paragraph">“But I’d like to know.”</div>
    <div class="paragraph">“OK, be seeing you.”</div>
    <div class="paragraph">And before Erdosain could even reply, the other man had turned off down a leafy street. He was walking quickly. Erdosain stared after him for a moment, then started in pursuit. He caught him by the next corner. Haffner whirled round angrily, and shouted at him:</div>
    <div class="paragraph">“D’you mind telling me exactly what you want from me?”</div>
    <div class="paragraph">“What I want? … I want to tell you this: that I haven’t the faintest intention of thanking you for the money you’ve given me. D’you want your cheque back? Here it is.”</div>
    <div class="paragraph">As he spoke, Erdosain held out the cheque, but the Thug just sneered at him:</div>
    <div class="paragraph">“Don’t be so ridiculous. Go and pay your debt.”</div>
    <div class="paragraph">The roadside walls wavered in front of Erdosain’s eyes. He was suffering so visibly that he turned a bright yellow. He leaned against a lamp-post, thinking he was about to vomit. Haffner came to a halt a few yards ahead and asked him sarcastically: “Getting over the dizzy spell?”</div>
    <div class="paragraph">“Yes … a bit …”</div>
    <div class="paragraph">“You’re not well … you should see a doctor …”</div>
    <div class="paragraph">They walked on a few yards in silence. The lights were shining too brightly for Erdosain, so they crossed to the other side of the street which was in shadow. Eventually they reached the train station. Haffner paced up and down the platform. All of a sudden he turned to Erdosain:</div>
    <div class="paragraph">“Have you ever been tempted to behave as cruelly as you could towards someone?”</div>
    <div class="paragraph">“Yes, sometimes …”</div>
    <div class="paragraph">“It’s strange … I was just remembering the time when I was determined to turn a blind girl into a prostitute …”</div>
    <div class="paragraph">“Is she still around?”</div>
''';

  static const String title8_5 =
      'CHAPTER ONE : OPINIONS OF THE MELANCHOLY THUG (5)';
  static const String text8_5 = '''
    <div class="paragraph">“Yes, she’s the daughter of a corset-maker. She’s only seventeen. I don’t know why, but she brings out the most savage fantasies in me.”</div>
    <div class="paragraph">“Does she still work for you?”</div>
    <div class="paragraph">“Yes, and now she’s pregnant. Can you imagine? Blind and pregnant. I’ll take you to see her one of these days. You can meet her. She’s an interesting sight, I can tell you. Can you imagine? Blind and pregnant. And quite crazy, always sticking needles in her hands … plus she’s as greedy as a pig. You’ll be fascinated.”</div>
    <div class="paragraph">“And you think …”</div>
    <div class="paragraph">“Yes, when the Astrologer sets up his brothel, she’ll be the first one I’ll put in. We’ll keep her a secret: she can be the surprise package we offer.”</div>
    <div class="paragraph">“You’re a lot weirder than her, d’you know that?”</div>
    <div class="paragraph">“Eh?”</div>
    <div class="paragraph">“Because you’re so hard to grasp. While you were talking about the blind girl, I was thinking of a story the Astrologer told me about you. That once you had met an honest woman, and by chance she ended up in your house, but you respected her. More than that &mdash; no, let me say it &mdash; this woman loved you, and she was a virgin, but you didn’t touch her.”</div>
    <div class="paragraph">“That’s beside the point. A little self-control, that’s all.”</div>
    <div class="paragraph">“What about the story of the necklace?”</div>
    <div class="paragraph">From the Astrologer, Erdosain knew that the Thug had once asked a dancer for a token of her affection for him; and that in the midst of a group of women, she had taken off a magnificent necklace given her by her lover, an old textile importer. The scene was all the odder because the lover was also present. Haffner took the necklace and then to everyone’s astonishment weighed it in his hand, examined the stones, then gave it back with a wry smile.</div>
    <div class="paragraph">“Well, that’s simple enough,” Haffner replied. “I was a bit drunk. But not enough not to realise that what I was doing would win me undying prestige among all that cabaret riffraff, especially the women, who are full of romantic notions. And the strangest thing of all was that half an hour later the old guy who had given Renee the necklace came up to me to humbly thank me for not accepting it. Can you imagine? He had seen the whole thing from a nearby table, where he sat quaking in his boots &mdash; but he’d done nothing because he was afraid of causing a scandal. What he was so worried about was what might happen to his necklace … how low can you get? Anyway, here’s the train to La Plata. See you soon … oh, yes, and make sure you don’t miss the meeting at the Astrologer’s next Wednesday. You’ll meet far more interesting people than me there.”</div>
    <div class="paragraph">Deep in thought, Erdosain crossed over to the platform for Buenos Aires. No doubt about it, Haffner was a monster.</div>
''';

  static const String title9_1 = 'CHAPTER ONE : HUMILIATION (1)';
  static const String text9_1 = '''
    <div class="paragraph">He reached home at eight that night.</div>
    <div class="paragraph">“There was a light on in the dining-room … but let me explain,” Erdosain told me: “my wife and I were in such dire straits that what we called the dining-room was simply a room almost empty of furniture. The other one was our bedroom. You might ask why if we were so poor we rented a house, but it was something my wife insisted on &mdash; she remembered happier days and could not get used to the idea of not ‘setting up home’.</div>
    <div class="paragraph">“The only piece of furniture in the dining-room was a pine table. Across one corner of the room was a wire we used to hang our clothes from, in another stood a trunk with tin clasps that gave the impression we led a nomadic life that would one day end with the final journey. Later on, I have often thought of that ‘sense of a journey’ the cheap trunk in the corner of our room created in the desperate mind of a man who knew himself to be at the gates of prison.</div>
    <div class="paragraph">“As I was saying, there was a light on. As soon as I opened the door, I froze. My wife was waiting for me, dressed to go out. She was sitting at the table, and wore a black tulle hat with a veil down over her rosy cheeks. A suitcase lay to the right of her feet, and, on the far side of the table, a man got up as I came in, or rather, as I stood paralysed with shock in the doorway.</div>
    <div class="paragraph">“For a second, none of us moved … The Captain standing there, one hand on the table and the other on the pommel of his sword, my wife’s eyes lowered to the floor, and me gaping at the two of them, still grasping the edge of the door. That second was enough for me never to forget the man. He was tall, and his firm, athletic build showed through his uniform. As his eyes left my wife, they took on a curious hardness. I am not exaggerating when I say he stared at me insolently, as if I were of a lower rank. I stared back at him. His sturdy physique contrasted with his small oval face, his delicate nose, and austere, thin lips. On his chest he wore the badge of an airforce pilot.</div>
    <div class="paragraph">“My first words were:</div>
    <div class="paragraph">“‘What’s going on here?’</div>
    <div class="paragraph">“‘This gentleman …’ but then Elsa blushed and corrected herself. ‘Remo,’ she said, calling me by my first name, ‘Remo, I can’t live with you any more.’”</div>
    <div class="paragraph">Erdosain did not even have time to react before the Captain went on:</div>
    <div class="paragraph">“Your wife, whom I met some time ago …”</div>
    <div class="paragraph">“And where exactly did you meet her?”</div>
    <div class="paragraph">“What kind of a question is that?” Elsa put in.</div>
    <div class="paragraph">“That’s right,” the Captain protested. “As you must know, there are certain things one doesn’t ask.”</div>
    <div class="paragraph">Erdosain flushed.</div>
    <div class="paragraph">“You may be right … I’m sorry …”</div>
    <div class="paragraph">“And since you don’t earn enough to keep her …”</div>
    <div class="paragraph">Erdosain squeezed the revolver butt in his trouser pocket and stared at the Captain. Then the thought that he had nothing to fear made him smile unintentionally: he could easily kill him if he wanted to.</div>
    <div class="paragraph">“I don’t see anything funny in what I’m saying.”</div>
''';

  static const String title9_2 = 'CHAPTER ONE : HUMILIATION (2)';
  static const String text9_2 = '''
    <div class="paragraph">“No, it was just something silly that crossed my mind … so she told you that as well?”</div>
    <div class="paragraph">“Yes, and she also said you were a frustrated genius …”</div>
    <div class="paragraph">“We talked about your inventions …”</div>
    <div class="paragraph">“Yes, your scheme for making metal flowers …”</div>
    <div class="paragraph">“Why are you leaving then?”</div>
    <div class="paragraph">“I’m tired, Remo.”</div>
    <div class="paragraph">Erdosain could feel rage twisting his mouth in curses. He would have insulted her, but the thought that the Captain could easily thrash him kept him in check. He simply said:</div>
    <div class="paragraph">“You’ve always been tired. You were tired at your parents’ house … and here … even in the mountains … d’you remember?”</div>
    <div class="paragraph">Nonplussed, Elsa merely nodded.</div>
    <div class="paragraph">“Tired … what have you got to be tired about? … All women seem to be tired … I’ve no idea why, but they’re tired … What about you, Captain, aren’t you tired too?”</div>
    <div class="paragraph">The interloper looked him up and down.</div>
    <div class="paragraph">“What exactly do you mean by tiredness?”</div>
    <div class="paragraph">“Boredom, anguish … have you noticed we seem to be in the times of tribulation the Bible speaks of? That’s what a friend of mine who’s married a cripple calls it. The cripple is the harlot of the Gospels …”</div>
''';

  static const String title9_3 = 'CHAPTER ONE : HUMILIATION (3)';
  static const String text9_3 = '''
    <div class="paragraph">“I’ve never given it any thought.”</div>
    <div class="paragraph">“I have, though. You may think it’s odd for me to talk of suffering in these circumstances … but that’s the way things are … men are so sad they need to be humiliated by someone.”</div>
    <div class="paragraph">“I can’t see that.”</div>
    <div class="paragraph">“Of course, with what you earn … What do you earn, by the way? Five hundred?”</div>
    <div class="paragraph">“Something like that.”</div>
    <div class="paragraph">“Of course, earning that much it’s logical …”</div>
    <div class="paragraph">“What’s logical?”</div>
    <div class="paragraph">“That you don’t feel trapped.”</div>
    <div class="paragraph">The Captain’s hard eyes settled on Erdosain.</div>
    <div class="paragraph">“Don’t listen to him, Germán,” Elsa interrupted. “Remo is always going on about anguish like that.”</div>
    <div class="paragraph">“Is that so?”</div>
''';

  static const String title9_4 = 'CHAPTER ONE : HUMILIATION (4)';
  static const String text9_4 = '''
    <div class="paragraph">“Yes … whereas she believes in being happy, the kind of ‘eternal happiness’ she would feel if she could spend the whole time enjoying herself …”</div>
    <div class="paragraph">“I hate being unhappy.”</div>
    <div class="paragraph">“Of course, because you don’t believe in unhappiness … the dreadful unhappiness that’s inside us, deep down … the unhappiness of the soul which eats at our bones like syphilis.” They fell silent. Visibly bored, the Captain was examining his carefully polished nails.</div>
    <div class="paragraph">Elsa stared through her veil at the gaunt face of a husband she had once loved so deeply, while Erdosain himself was trying to puzzle out why there was such a huge void inside him, a void that engulfed his consciousness, leaving him incapable of finding the words to howl out the eternal suffering he felt.</div>
    <div class="paragraph">All at once the Captain looked up.</div>
    <div class="paragraph">“How do you intend to make your metal flowers?”</div>
    <div class="paragraph">“It’s easy … you take a rose, for example, and plunge it into a silver nitrate solution dissolved in alcohol. Then you expose the flower to light, which transforms the nitrate to a metal, so that the rose is now covered with a thin film of silver which acts as a conductor. Then you apply the ordinary galvano-plastic method of copperplating to it … and there you have it, the flower is now a copper rose. The process could be applied in lots of ways.”</div>
    <div class="paragraph">“It’s an original idea.”</div>
    <div class="paragraph">“Didn’t I tell you, Germán, that Remo is talented?”</div>
    <div class="paragraph">“I can see that.”</div>
    <div class="paragraph">“Yes, I may be talented, but what I lack is life … enthusiasm … some kind of overwhelming dream … a great illusion that would drive me on to accomplish it … anyway, to change the subject, do you two hope to be happy?”</div>
    <div class="paragraph">“Yes.”</div>
    <div class="paragraph">They fell silent again. Their three faces were like wax masks in the yellow light from the bulb. Erdosain realised that in a few short minutes everything would be over. Gnawing at his despair, he asked the Captain:</div>
    <div class="paragraph">“Why did you come here?”</div>
''';

  static const String title9_5 = 'CHAPTER ONE : HUMILIATION (5)';
  static const String text9_5 = '''
    <div class="paragraph">The other man hesitated, then said:</div>
    <div class="paragraph">“I wanted to meet you.”</div>
    <div class="paragraph">“Did you think it would be fun?”</div>
    <div class="paragraph">The Captain flushed. “No … I swear to you, I didn’t.”</div>
    <div class="paragraph">“What then?”</div>
    <div class="paragraph">“I was curious. Your wife has told me a lot about you over the past few weeks. Besides, I never thought I’d be in a situation like this … when it comes down to it, I’ve no idea why I came.”</div>
    <div class="paragraph">“You see? There are things we can’t explain. I for example have been trying to explain to myself why I don’t shoot you dead since I’ve got a revolver here in my pocket.”</div>
    <div class="paragraph">Elsa looked up at Erdosain, who was standing at the head of the table … The Captain asked:</div>
    <div class="paragraph">“What’s holding you back?”</div>
    <div class="paragraph">“The truth is, I don’t know … or perhaps … yes, I’m sure this is the reason. I think each of us has a line of fate in their heart. It’s like being able to divine things thanks to some mysterious instinct. I feel everything that’s happening to me now is already marked on that line of fate … as if I had seen it all before … but I don’t know where …”</div>
    <div class="paragraph">“What’s that?”</div>
    <div class="paragraph">“What are you saying?”</div>
    <div class="paragraph">“It’s as if you’re not the one who’s caused this … no … like I say, I had a strange feeling it was bound to happen.” “I don’t understand you.” “But I understand myself. It’s like this. All of a sudden you get the feeling that certain things are destined to happen in your life … so that it can change and renew itself.”</div>
''';

  static const String title9_6 = 'CHAPTER ONE : HUMILIATION (6)';
  static const String text9_6 = '''
    <div class="paragraph">“And you …?”</div>
    <div class="paragraph">“So you think your life will …?”</div>
    <div class="paragraph">Ignoring the question, Erdosain interrupted the Captain:</div>
    <div class="paragraph">“What I mean is, none of this surprises me. If you told me to go and buy you a pack of cigarettes &mdash; by the way, do you have one?”</div>
    <div class="paragraph">“Help yourself … what then?”</div>
    <div class="paragraph">“I don’t know. My life has been pretty chaotic lately … I’ve been paralysed by this feeling of anguish. And you can see how calmly I’m talking to you.”</div>
    <div class="paragraph">“Yes, Remo was always expecting something extraordinary to happen.”</div>
    <div class="paragraph">“So were you.”</div>
    <div class="paragraph">“What &mdash; you too, Elsa?”</div>
    <div class="paragraph">“Yes.”</div>
    <div class="paragraph">“But he’s wrong, isn’t he, Elsa?”</div>
    <div class="paragraph">“D’you think so?”</div>
    <div class="paragraph">“Tell the truth, you’re also looking for something extraordinary to take you out of all this, aren’t you?” “I don’t know.” “You see, Captain? That’s how our life together always was. The two of us sitting in silence at this table here …”</div>
    <div class="paragraph">“Be quiet!”</div>
    <div class="paragraph">“What for? We’d be sitting here, and we’d understand without saying a word that we were two people with no hope, linked by an unequal love. And when we went to bed …”</div>
    <div class="paragraph">“Remo!”</div>
    <div class="paragraph">“Señor Erdosain!”</div>
    <div class="paragraph">“Don’t pretend to be prudish … don’t you two go to bed together?”</div>
''';

  static const String title9_7 = 'CHAPTER ONE : HUMILIATION (7)';
  static const String text9_7 = '''
    <div class="paragraph">“If you talk like that, there’s nothing more to say.”</div>
    <div class="paragraph">“OK, so then afterwards we’d both feel the same: is that all there is to the pleasures of life and love? … and again, without saying a word, we’d realise we both felt the same … but, to change the subject, are you thinking of staying here in the city?”</div>
    <div class="paragraph">“We’ll be going to Spain for a while.” His words triggered an icy vision of a journey in Erdosain’s mind. He could see Elsa leaning on a handrail beneath a row of glassy portholes, gazing at the blue line of the horizon. The sun glinted off the yellow foremasts and the black winch arms. It was late afternoon, but the two of them stood at the white rails in the lee of the cabins, their minds intent on distant climes. The iodine wind ruffled the waves as Elsa stared down at her shadow flickering on the shifting lattices of the water.</div>
    <div class="paragraph">From time to time she turned her pallid face to her companion, and it seemed they both could hear a voice of reproach rising from the depths of the ocean.</div>
    <div class="paragraph">And Erdosain imagined the voice was saying: “What have you done to the poor boy?” (“Because even at my age, I was like a boy” &mdash; Remo told me later on &mdash; “D’you see, a man who lets his wife be stolen from under his nose … he must be pitiful … he’s like a little boy, d’you see?”)</div>
    <div class="paragraph">Erdosain jerked out of his hallucination. His next question rose from deep inside him, against his will.</div>
    <div class="paragraph">“Will you write?”</div>
    <div class="paragraph">“What for?”</div>
    <div class="paragraph">“Yes, of course, what for?” Erdosain repeated, closing his eyes. Now more than ever he felt he was at the bottom of a pit deeper than anyone could imagine.</div>
    <div class="paragraph">“Well, señor Erdosain,” the Captain said, standing up, “we’ll be going now.”</div>
    <div class="paragraph">“Ah, you’re leaving … you’re leaving already?” Elsa held out a gloved hand.</div>
    <div class="paragraph">“You’re leaving?”</div>
    <div class="paragraph">“Yes … I’m going … you must see that …”</div>
    <div class="paragraph">“Yes … I see.”</div>
    <div class="paragraph">“It was impossible, Remo.”</div>
    <div class="paragraph">“Yes, of course, impossible … of course …”</div>
    <div class="paragraph">The Captain circled the table and picked up Elsa’s suitcase, the very same one she had brought here on her wedding day. “Goodbye, señor Erdosain.”</div>
    <div class="paragraph">“At your service, Captain … but just one thing … you’re leaving … you, Elsa, you’re leaving me?”</div>
    <div class="paragraph">“Yes, we’re going.”</div>
''';

  static const String title9_8 = 'CHAPTER ONE : HUMILIATION (8)';
  static const String text9_8 = '''
    <div class="paragraph">“If you don’t mind, I must sit down. Give me a moment, Captain, just a moment.” The interloper bit back an impatient retort. He felt a brutal urge to bark at the husband: “Stand to attention, you idiot!” but restrained himself for Elsa’s sake.</div>
    <div class="paragraph">Suddenly Erdosain rose from the chair. He walked slowly over to a corner of the room. Then he whirled round to face the Captain and said very clearly, in a voice which betrayed his repressed desire to keep from screaming:</div>
    <div class="paragraph">“Have you any idea why I don’t shoot you down like a dog?”</div>
    <div class="paragraph">The two of them stared at each other in alarm.</div>
    <div class="paragraph">“It’s because I can’t do it in cold blood.”</div>
    <div class="paragraph">By now Erdosain was pacing the room, hands clasped behind his back. They watched him and waited.</div>
    <div class="paragraph">Finally the husband, with a faint lopsided grin, went on in the same soft voice as before, trailing off as if forcing himself not to burst into tears: “Yes, I was too cold … I am too cold.”</div>
    <div class="paragraph">He gazed around him unseeing, but with the same strange, hallucinated smile on his lips. “Listen to me … you might not understand any of this, but I’ve found the explanation.”</div>
    <div class="paragraph">His eyes glittered fiercely, and his voice was hoarse from the effort of getting the words out. “You see … I’ve been so abused in my life … so damaged.”</div>
    <div class="paragraph">He fell silent, hunched in a corner of the room. On his face he still had the strange smile of a man living a perilous dream. In a fit of annoyance, Elsa was chewing the tip of her handkerchief. The Captain was standing on guard.</div>
    <div class="paragraph">Suddenly, Erdosain took the revolver from his pocket and flung it into the far corner. The Browning sent flakes of whitewash flying from the wall, then crashed to the floor.</div>
    <div class="paragraph">“Useless piece of rubbish!” he muttered. Then, with one hand in his jacket pocket and pressing his forehead against the wall, he went on slowly: “Yes … I’ve been so abused … humiliated. Believe me, Captain. Don’t be in such a rush to leave. I’ll tell you the story. It was my father who began the twisted task of humiliating me. When I was ten and had done something wrong, he would say to me: ‘tomorrow I’m going to thrash you’. That’s what he always said: ‘tomorrow’. What d’you think of that? Tomorrow … so that night I would sleep awfully, like a sick dog, waking at midnight and staring fearfully at the window to see if it was already day, but when I saw the moon clipping the transom I would force my eyes shut, and tell myself: ‘there’s a long time to go yet.’ Then when the cocks started crowing, I would wake up again. The moon had disappeared, but the panes let in a blue glow, so I would pull the covers over my head so as not to see it, even though I knew it was there … even though I knew no force on earth could get rid of it. Then after I had finally managed to get back to sleep, I would feel a hand on the pillow shaking me. It was my father, who would growl: ‘Come on … it’s time.’ And while I slowly got dressed, I could hear him placing the chair out in the yard. By the time I got there, he would be standing stiffly behind it, like a soldier. ‘Get a move on,’ he shouted at me again, and like a zombie I’d head straight for him; I wanted to say something, but his ferocious glare made it impossible. He would push me down on to my knees until my chest was flat against the seat of the chair, with my head caught between his knees. Then he began to whip me savagely. As soon as he let me go, I’d run to my room in tears. A tremendous sense of shame drove my soul down into the darkness. Because that darkness exists, whether you believe in it or not.”</div>
    <div class="paragraph">Elsa was staring at her husband in amazement. The Captain stood with his arms folded, aloof. Erdosain was still smiling inanely. He went on:</div>
    <div class="paragraph">“I knew that most of the kids at school did not get beaten by their fathers. Whenever they mentioned their homes I found myself paralysed by such a dreadful anxiety that if we were in class and the teacher asked me a question, I would stare at him so stupidly, without the faintest idea of what he had said, that one day he bawled at me: ‘What’s the matter with you, Erdosain? Are you an idiot or something?’ The whole class burst out laughing, and from that day on they all called me ‘Erdosain the idiot’. So, still further crushed, still more abused, I kept silent for fear of provoking another beating from my father, and simply smiled at all those who were insulting me … a feeble smile. Can you imagine, Captain? You’re being insulted, and you respond with a feeble smile, as if they were doing you a favour.”</div>
    <div class="paragraph">The intruder frowned. “Later on … if you’ll excuse me, Captain … later on I was often called ‘the idiot’. Whenever that happened, I could suddenly feel inside me that my soul was shrivelling up, and the feeling that my own soul was slinking away to hide within my flesh destroyed any courage I might have left. I felt I was sinking further and further, but while I searched in the eyes of the person insulting me, instead of knocking him down with a blow, I was thinking: ‘does this person realise just how much he is humiliating me?’ At that, I would crawl away, because I understood that these people were only completing something my father had begun.”</div>
    <div class="paragraph">“So now,” the Captain interjected, “it’s me who’s pushing you down?”</div>
    <div class="paragraph">“No, it’s not you. Of course by now I’ve suffered so much that any courage I have left is hidden away deep inside me. I look at myself and ask: ‘Just when will my courage burst out?’ That’s what I’m waiting for. One day something monstrous will explode in me, and I’ll be a different man. And then, if you’re still alive, I’ll come in search of you, and I’ll spit in your face.”</div>
    <div class="paragraph">The interloper measured him calmly.</div>
    <div class="paragraph">“But it won’t be from hatred, simply to test out my courage, which will seem like a brand-new creation to me … And now you may go.”</div>
    <div class="paragraph">The interloper hesitated a moment. Erdosain was staring at him with huge wild eyes. The Captain picked up the suitcase and left the room.</div>
    <div class="paragraph">Elsa paused nervously in front of her husband.</div>
''';

  static const String title9_9 = 'CHAPTER ONE : HUMILIATION (9)';
  static const String text9_9 = '''
    <div class="paragraph">“Well, I’m going, Remo … it had to end this way.”</div>
    <div class="paragraph">“But … you … you …?”</div>
    <div class="paragraph">“What would you have me do?”</div>
    <div class="paragraph">“I don’t know.”</div>
    <div class="paragraph">“Well then? Don’t get upset, please. I’ve left you your clean clothes. You need to change your collar. You always embarrass me that way.”</div>
    <div class="paragraph">“But you, Elsa … you? What about our plans?”</div>
    <div class="paragraph">“Illusions, Remo … splendid mirages.”</div>
    <div class="paragraph">“Yes, splendid mirages … but where did you learn such a fine phrase? Splendid mirages.”</div>
    <div class="paragraph">“I don’t know.”</div>
    <div class="paragraph">“So our life together is finished for ever?”</div>
    <div class="paragraph">“What do you expect? And yet at the start, I was kind to you. It was only later I began to hate you … but why weren’t you the same?”</div>
    <div class="paragraph">“Ah yes … the same … the same.”</div>
    <div class="paragraph">Suffering weighed down on him like a day of great heat in the tropics. His eyelids felt heavy. All he wanted to do was sleep. The meaning of words sank into his brain as slowly as a stone thrown into a thick swamp. And when the word reached the bottom of his soul, obscure powers stirred up his anguish even more. For a moment, quivering green strands of suffering floated deep inside his chest. Elsa went on, her voice softened by inner resignation:</div>
    <div class="paragraph">“It’s no use now … I’m leaving. Why couldn’t you have been kind to me? Why did you never try?”</div>
    <div class="paragraph">In that instant Erdosain was convinced she was as unhappy as he was, and the immense weight of the discovery crushed him on the edge of his seat next to the table, his head buried in the crook of his arm.</div>
    <div class="paragraph">“So you’re leaving? You’re really leaving?”</div>
    <div class="paragraph">“Yes, I want to see if our lives can be better this way. Take a look at my hands.” As she said this, she took off her right glove and showed him her hand, chapped from the cold, scarred by bleach, pricked by her sewing needle, blackened by her sooty pots and pans.</div>
    <div class="paragraph">Erdosain stood bolt upright, transfixed by another hallucination.</div>
    <div class="paragraph">He could picture his unhappy wife amid the monstrous turmoil of cement and iron cities, darting down dark streets in the slanting shadows of skyscrapers, beneath menacing lines of high-tension cables, lost among crowds of businessmen dry under their umbrellas. Her tiny face was paler than ever, but even as the stale breath from strangers stung her cheeks, she remembered him:</div>
    <div class="paragraph">“Where can my little boy be?”</div>
    <div class="paragraph">Erdosain interrupted his vision of the future: “Elsa … you already know … come whenever you want … you can come … but tell me truthfully, did you ever love me?”</div>
    <div class="paragraph">Her eyelids fluttered up, her eyes opened wider. Her voice filled the room with human warmth. Erdosain felt he was coming back to life.</div>
    <div class="paragraph">“I’ve always loved you … I love you now … never &mdash; why did you never talk to me before like you did tonight? I feel I’ll love you always … next to you, he is nothing more than the shadow of a man …”</div>
    <div class="paragraph">“My poor soul … what a life we lead … what a life …”</div>
''';

  static const String title9_10 = 'CHAPTER ONE : HUMILIATION (10)';
  static const String text9_10 = '''
    <div class="paragraph">The hint of a smile painfully twisted Elsa’s lips. She stared at him with longing for a moment. Then she said in a grave, pleading tone:</div>
    <div class="paragraph">“Look … promise you’ll wait for me. If life is the way you’ve always said it is, I’ll be back. And then, if you like, we can end it all together … does that make you happy?”</div>
    <div class="paragraph">Erdosain felt the blood rushing to his temples.</div>
    <div class="paragraph">“My soul, how good you are to me … give me your hand,” and while she was struggling to overcome her fright with a timid smile, he began to kiss it. “You’re not angry are you, my love?”</div>
    <div class="paragraph">Elsa straightened up, solemnly joyful.</div>
    <div class="paragraph">“Look, Remo … I’ll be back, I promise you. And if what you say about life is true … yes, I’ll come, I promise.”</div>
    <div class="paragraph">“You’re sure?”</div>
    <div class="paragraph">“Yes, with whatever I possess.”</div>
    <div class="paragraph">“Even if you’re rich?”</div>
    <div class="paragraph">“Even if I have all the earth’s millions, I’ll come back. I swear it!”</div>
    <div class="paragraph">“My poor soul! And you do have a noble soul! And yet you could not see who I was … but that doesn’t matter … what a life we’ve led!”</div>
    <div class="paragraph">“Our life … it’s true, what a life! But it doesn’t matter now. I’m so happy. Can you picture how surprised you’ll be, Remo? You’re alone one night … all alone … when suddenly … creak … the door opens … and it’s me … I’ve come back!”</div>
    <div class="paragraph">“And you’re wearing a ball gown … white shoes and a pearl necklace.”</div>
    <div class="paragraph">“I came alone on foot through the dark streets, searching for you … but you don’t see me, you’re all on your own … your head …”</div>
    <div class="paragraph">“Go on, tell me … talk, talk …”</div>
    <div class="paragraph">“Your head is in your hands, your elbow propped on the table … you look at me … and all of a sudden …”</div>
    <div class="paragraph">“I recognise you and say: ‘Elsa, is that you?’”</div>
    <div class="paragraph">“And I reply: ‘Yes, Remo, I came back &mdash; d’you remember that night? That night is tonight, and even though the storm is howling outside, we don’t feel any cold or fear. Are you happy, Remo?”</div>
    <div class="paragraph">“Yes, I’m happy, I swear to you.”</div>
    <div class="paragraph">“Well then, I have to go now.”</div>
''';

  static const String title9_11 = 'CHAPTER ONE : HUMILIATION (11)';
  static const String text9_11 = '''
    <div class="paragraph">“You’re going?”</div>
    <div class="paragraph">“Yes …”</div>
    <div class="paragraph">The man’s face fell in sudden anguish.</div>
    <div class="paragraph">“You’d better leave then.”</div>
    <div class="paragraph">“I’ll be back soon, my husband.”</div>
    <div class="paragraph">“What was that you said?”</div>
    <div class="paragraph">“I’m saying this to you, Remo: wait for me. Even if I have all the world’s millions, I’ll be back.”</div>
    <div class="paragraph">“Goodbye then … but give me a kiss.”</div>
    <div class="paragraph">“No, when I come back … goodbye, my husband.”</div>
    <div class="paragraph">Suddenly Erdosain, overcome by an indescribable impulse, seized her roughly by her wrists.</div>
    <div class="paragraph">“Tell me this: have you slept with him?”</div>
    <div class="paragraph">“Let go of me, Remo … I didn’t think that you …”</div>
    <div class="paragraph">“Admit it: did you sleep with him or not?”</div>
    <div class="paragraph">“No.”</div>
    <div class="paragraph">The Captain stood in the doorway. Erdosain sensed a vast weariness loosening the grip of his fingers. He felt he was falling, then saw nothing more.</div>
 ''';

  static const String title10_1 = 'CHAPTER ONE : LAYERS OF DARKNESS (1)';
  static const String text10_1 = '''
    <div class="paragraph">He never knew how he managed to drag himself to his bed.</div>
    <div class="paragraph">Time ceased to exist for Erdosain. He closed his eyes, obeying the need for sleep his aching insides were crying out for. If he had had the strength, he would have flung himself down a well. Great bubbles of despair frothed in his throat, choking the air from him, while his eyes became more sensitive to the darkness than a wound to salt. Occasionally he had to clench his teeth to stifle the jangling of his nerves, strung taught as wire in his soft, sponge-like flesh that yielded to the waves of darkness emanating from his brain.</div>
    <div class="paragraph">He squeezed his eyes shut as he felt himself falling down a bottomless hole. He dropped further and further &mdash; who could say how many leagues his body was stretched to in invisible length, only to find itself still incapable of reaching his plunging consciousness as it vanished into a pit of despair! Ever denser layers of darkness fell from his lids.</div>
    <div class="paragraph">His pain-ridden core struggled in vain. There was not a single chink in his soul for it to escape through. Erdosain carried all the world’s suffering inside him, all the grief of denying the world. Where on earth could there possibly be anyone whose skin was so gouged with bitterness? He felt he was no longer a man, but a raw wound that writhed and screamed with every throb of his veins. And yet, he was alive. Alive at a distance yet at the same time horrifically close to his own body. He was no longer an organism encompassing its suffering, but something far more inhuman … a monster-like creature curled up on itself in the black belly of the room. Each layer of darkness pouring from his eyelids was like placenta cutting him off further and further from the world of men. The rows of bricks in the walls grew higher and higher, while fresh outpourings of darkness crashed down into the hole where he lay curled up and throbbing, like a shell in the ocean depths. He did not know himself … he could not believe he was Augusto Remo Erdosain. He grasped his forehead in his fingers, but could recognise neither the flesh of his hands nor that of his brow, as though his body were made of two completely different substances. Who can say what had already died in him? All that remained of his feelings was an awareness which existed outside all that was happening to him, a soul as keenly thin as a swordblade, which slithered like an eel through the murky waters of his life. This consciousness took up no more than a square centimetre of his being. The rest dissolved in the darkness &mdash; he was a square centimetre of a man, a square centimetre of existence whose pulsating surface somehow kept this inchoate ghost alive. Everything else in him had died, had been absorbed into the placenta of darkness that insulated him inside this ghastly reality.</div>
    <div class="paragraph">He became more and more convinced that he was at the bottom of a concrete block. It was like nothing on this earth! An invisible orange sun in a storm-black sky beat endlessly on its walls. The wing of a solitary bird slashed across the blue sky above, but he was condemned to remain for ever at the bottom of this sullen pit, lit by a storm-orange sun.</div>
    <div class="paragraph">The contours of his life were reduced to that square centimetre of feeling. He could even “see” his heartbeat, and it was useless for him to try to spurn this grotesque figure weighing him down on the floor of the abyss, black and orange by turns. If he dropped his guard just a fraction, the reality inside him rose howling round his ears. Erdosain wanted but did not want to look … it was useless … there his wife was, at the far side of a blue-lined room. The Captain was busy in a corner. Erdosain knew, without anyone telling him, that this was a tiny hexagonal-shaped bedroom, almost completely filled by a wide, low bed. He did not want to look at Elsa … no, he did not want to, and yet if he faced death for it, he could not have taken his eyes off the man undressing in front of her … in front of his lawful wife, who was no longer with him but with someone else. Even more powerful than his fear was his need for more terror, more suffering, and then all at once Elsa, who until now had been hiding her face behind her hands, ran over to the naked man with his sturdy legs, his blotched purple manhood erect against the blue background.</div>
    <div class="paragraph">Erdosain felt himself crushed by a sense of pure dread. His life could not have been flatter if he had gone through the rollers of a sheet-metal mill. Wasn’t that how toads looked when flattened by a cartwheel on some country track, all squashed and frothing? But he did not want to look, he refused to look with such determination that he managed to see only a blurred outline of how Elsa was leaning against the man’s hairy, bulging chest, while his hands sought out her chin to lift her face to his mouth.</div>
    <div class="paragraph">Then suddenly Elsa cried out: “Me too, my darling, me too.” Her face was red with longing, her clothes a whirling mass over her milk-white thighs, her eyes staring wildly at the trembling man’s rigid muscle, as she revealed the unruly curls of her sex, her straining breasts … Ah! … why did he have to look?</div>
    <div class="paragraph">It was useless … Elsa … yes, Elsa, his lawfully wedded wife, was trying to caress the whole of the man’s sex with her tiny hand. Groaning with desire, the man clutched his head, covered his face with his forearm, but she leant forward to brand his ears with this burning iron: “You’re more beautiful than my husband! My God, how beautiful you are!”</div>
    <div class="paragraph">Erdosain could not have suffered more if someone had twisted his head round on his neck to screw this ghastly vision deep into his soul. He was suffering so much that if there had been any letup in his pain, he would have exploded like shrapnel. How can the soul stand so much pain? And yet he wanted to suffer more. Even if they had put him on a chopping block and sliced him into pieces … even if they had taken the four quarters of his carcass and thrown them into the garbage, he would have gone on suffering. There was not a single square centimetre of his body that was free of this crushing pressure of dread.</div>
    <div class="paragraph">All his nerve-strings had snapped as the horrific tension wrenched him apart: until all at once a sudden feeling of calm began to spread through his limbs.</div>
    <div class="paragraph">He wanted nothing any more. His life was pouring out silently like a lake after its dam has burst. As he lay there, eyes closed but not asleep, this lucid dissolution was a more effective anaesthetic for his pain than any chloroform-induced sleep.</div>
    <div class="paragraph">His heart was pumping strongly. He shifted his head laboriously to lift his scalp from the overheated pillow, and let himself go, without any other sense of being alive than the coolness on the back of his neck and the opening and closing of his heart which, like an immense eye, opened its sleepy lid to acknowledge the darkness, and nothing more. Nothing more than darkness?</div>
    <div class="paragraph">Elsa had shrunk so far from his memory that during this hypnotic state he could hardly believe he had ever known her. He doubted whether she even existed. Where before he could see her image so clearly, now he had to struggle to recognise her at all. Now his life was pouring silently out &mdash; he contemplated the years speeding backwards, until he was a boy staring at a green tree which shaded the rushing flow of a river full of red-striped pebbles. He himself was a waterfall of flesh in the shadows. Who could say when the draining of his blood would end! The only thing he could feel was the closing and opening of his heart, which like an immense eye lifted its sleepy lid to acknowledge the darkness. A slash of silver from the streetlamp halfway down the street filtered through a chink and fell on the gauze of the mosquito net. Slowly, painfully, he regained a sense of who he was.</div>
    <div class="paragraph">He was Erdosain. Now he knew once again who he was. With a huge effort, he sat upright. He could make out a yellow line under the dining-room door. He had forgotten to switch the light off. He owed … Ah! no, no … Elsa has left him … he owes 600 pesos and seven cents to the Sugar Company … but no, he doesn’t owe them any more, he’s got a cheque …</div>
    <div class="paragraph">Oh, reality, reality!</div>
    <div class="paragraph">The tilted oblong of light from the street which had turned the mosquito net to silver had led him to think he was living as he had before, like the day before, like ten years earlier.</div>
    <div class="paragraph">He did not want to see that sliver of light, just as when he had been a boy he had not wanted to be aware of the blue light shining in through the windows, even though he knew it was there, even though he knew there was no force on earth that could extinguish that light. Yes, just like when his father used to tell him that he was going to thrash him “tomorrow”. No, it could not be the same this time. In his childhood, the light had been blue, and now it was silver, although it was equally piercing, just as much a herald of the real world as the earlier one had been. His forehead, the fringe of hair round his temples were soaked with sweat. So Elsa had left, and would never be back? What was Barsut going to say?</div>
''';

  static const String title11_1 = 'CHAPTER ONE : THE SLAP (1)';
  static const String text11_1 = '''
    <div class="paragraph">Just then, someone came to a halt outside the street door. Erdosain realised it was Barsut, and leapt from his bed. As usual, Barsut began to knock softly as if doing his best to make no noise.</div>
    <div class="paragraph">Erdosain growled at him:</div>
    <div class="paragraph">“Come on in; what’s the matter with you?”</div>
    <div class="paragraph">Barsut came through the door, rocking back on his heels.</div>
    <div class="paragraph">“I’m on my way,” Erdosain shouted as the other man entered the dining-room.</div>
    <div class="paragraph">By the time he emerged from the bedroom, Barsut was already seated, legs crossed; as ever, he had his back to the door and was staring at the south-east corner of the room.</div>
    <div class="paragraph">“How’s things?”</div>
    <div class="paragraph">“How’s it going?”</div>
    <div class="paragraph">Barsut had propped his elbow on the edge of the table, and sat with his chin in his white hand, which took on a coppery glow in the dim electric light. A questioning look softened the harsh glassy stare of his green eyes beneath eyebrows that seemed to stretch all the way back to his ears.</div>
    <div class="paragraph">Erdosain felt he was seeing Barsut’s features through a mist of twinkling lights: the forehead sloping back towards pointed ears, the bony bird of prey nose, the lantern jaw capable of taking the hardest blows, the neat knot of his tie plumping out of its starched collar.</div>
    <div class="paragraph">In a strained voice, Barsut asked:</div>
    <div class="paragraph">“And Elsa?”</div>
    <div class="paragraph">Erdosain pulled himself together.</div>
    <div class="paragraph">“She’s gone out.”</div>
    <div class="paragraph">“Ah …”</div>
    <div class="paragraph">The two men fell silent. Erdosain stared fascinated at the right angle Barsut’s grey sleeve made with the white table edge, and the way the lamp lit his cheek with a coppery glow as far as the ridge of the nose, leaving the entire other half, from the roots of his hair to the cleft of his chin, in a darkness that the pool of shadow under his eye only made deeper. Barsut was shifting his legs uncomfortably.</div>
    <div class="paragraph">“Ah!” Erdosain heard, and asked: “What did you say?”</div>
    <div class="paragraph">The fact was it was only now that Erdosain heard the “ah” the other man had uttered seconds earlier. “So Elsa’s gone out?” As he said this, Barsut looked up, and his eyebrows lifted to let more light into his eyes. He hissed through half-open lips:</div>
    <div class="paragraph">“She’s gone?”</div>
''';

  static const String title11_2 = 'CHAPTER ONE : THE SLAP (2)';
  static const String text11_2 = '''
    <div class="paragraph">Erdosain frowned, cast a sideways glance down at the other man’s shoes, then knotted his brows, as if to judge Barsut’s discomfort through a screen, then slowly let fall:</div>
    <div class="paragraph">“Yes … she’s … gone off … with … a … man …”</div>
    <div class="paragraph">At that, he winked his left eye just as Ergueta the pharmacist was in the habit of doing. Beneath the bronze line of his brows, his pupils glittered fiercely. Erdosain added: “See? There’s the revolver. I could have killed them both, but I didn’t. What a strange animal man is, isn’t he?”</div>
    <div class="paragraph">“And you allowed him to steal your woman from under your nose?”</div>
    <div class="paragraph">All Erdosain’s pent-up hatred, added to the humiliation he had just received, were suddenly transformed into a kind of malicious glee. His mouth dry with bitterness, he retorted in a quavering voice:</div>
    <div class="paragraph">“What’s that to you?”</div>
    <div class="paragraph">A tremendous slap rocked him back on his chair. Later he was to recall that Barsut’s arm swung back and forth slapping him like dough. Erdosain covered his face in both hands as he desperately tried to escape from this crunching mass that bore down on him like an unleashed force of nature. His head thumped against the wall, and he fell to the floor.</div>
    <div class="paragraph">When he came round, Barsut was kneeling beside him. He noted that his collar was loose and that streams of water were trickling down his neck. He could feel a stabbing pain from the bridge of his nose, and felt as if he was constantly about to sneeze. His gums were oozing blood, and under his puffy lips his teeth felt jagged on his tongue.</div>
    <div class="paragraph">Erdosain struggled to his feet, then collapsed on to a chair; Barsut was so pale it seemed his eyes were like two jets of flame. Bands of muscles quivered beneath the skin of his cheeks. Erdosain felt as though he was being tossed in an endless nightmare, but he was aware of Barsut gripping him by the arm and saying:</div>
    <div class="paragraph">“Look, you can spit in my face if you like, but let me speak. I have to tell you everything. Sit properly … that’s it” &mdash; Erdosain had straightened up without realising it &mdash; “Listen to me. I beg you. You’ve seen, haven’t you, that I could kill you with my bare hands … I went too far just now … I swear … if you like, I’ll beg for your forgiveness on bended knee. I can’t help it, that’s the way I am. Look … ah … ah … if people only knew.”</div>
    <div class="paragraph">Erdosain spat blood. A red-hot stab of pain shot through his head. He doubled forward so far his forehead was resting on the table edge. Worried, Barsut asked him:</div>
    <div class="paragraph">“D’you want to wash your face? It’ll do you good. Wait a second, don’t move.” At that, he rushed out into the kitchen, and came back with a basin full of water. “Here, rinse your face. You’ll feel better. D’you want me to rub you? I’m sorry, it was instinctive. But why did you wink like that as though you were making fun of me? Wash your face, please.”</div>
    <div class="paragraph">Without a word, Erdosain plunged his face several times into the basin. Each time, he kept his head down until he ran out of air. Then he sat back and could feel the water evaporating from his wet hair. How tired he was! If only Elsa could see him now! How sorry she would feel for him! He shut his eyes tight. Barsut drew his chair up next to him and insisted:</div>
    <div class="paragraph">“I have to tell you everything. If I didn’t I’d feel like a coward. As you can see, I’m quite calm. If you don’t believe me, you can feel my pulse. I’m being frank with you. Well, I … it was me who … it was me who gave you away to the Sugar Company … I sent the anonymous letter.”</div>
    <div class="paragraph">Erdosain did not even lift his head. Barsut or someone else: what was the difference?</div>
''';

  static const String title11_3 = 'CHAPTER ONE : THE SLAP (3)';
  static const String text11_3 = '''
    <div class="paragraph">Barsut stared at him, waiting for him to speak. Then he said:</div>
    <div class="paragraph">“Why don’t you say anything? Yes, it was me who betrayed you. D’you understand? I betrayed you. I wanted you to be arrested, so that Elsa would be left with me, so that I could humiliate her. You can’t imagine how many nights I’ve dreamt of them arresting you! You had no way of repaying the money, so they were bound to hand you over to the police. Why don’t you say anything?”</div>
    <div class="paragraph">Erdosain raised his eyes. Barsut was there, it was definitely him, and he was saying all these things. Under the skin of his cheek, the muscles were trembling imperceptibly.</div>
    <div class="paragraph">Barsut looked down, planted his elbows on his knees as if he were by a fireside, and then went on with slow insistence:</div>
    <div class="paragraph">“I have to tell you everything. Who else could I tell all these things that are tearing me apart? They say, and it’s true, that the heart doesn’t really feel pain, but believe me, there are times when I ask myself: what am I living for? What’s the point of living if this is the way I am? D’you understand? You can’t imagine how often I’ve gone over and over these things in my mind. I shouldn’t even be telling you this. How is it that you can betray someone, then seek that same person out to tell your darkest secrets to, without feeling the slightest remorse? Time and again I’ve asked myself: why don’t you feel any remorse? What kind of life is this if we can be so cruel and not feel a thing? Can you tell me? According to what they taught us at school, sooner or later a crime eventually drives the criminal mad; so how can it be that you commit a crime and are not affected in the slightest?”</div>
    <div class="paragraph">Erdosain was staring so hard at Barsut, it seemed his image was imprinted on his consciousness. His life forces wove the pale outline from such a finely meshed net that the impression it captured at that moment would stay with him for ever.</div>
    <div class="paragraph">“Look,” Barsut continued, “I knew you hated me, and that you would have killed me if you could &mdash; and that made me feel happy and sad at the same time. How many nights I’ve gone to bed scheming about the best way to kidnap you! I even thought of sending you a bomb in the mail, or a snake in a cardboard box. Or of paying a driver to run you down in the street. I would shut my eyes and hours would go by while I thought of you two. I suppose you think I was in love with her?” Erdosain later observed that during their conversation that night, Barsut constantly avoided mentioning Elsa by name. “No, I’ve never been in love with her. But I would have loved to humiliate her. Humiliate her just for the sake of it: to see you down and out so that she would be forced to go on her knees and beg me for help. D’you understand? I’ve never loved her. That was why I gave you away like that: to humiliate her, because she was always so high and mighty with me. When you told me you had been swindling the Sugar Company, I felt a raging kind of satisfaction deep inside me. And even before you had finished speaking, I was saying to myself: Now we’ll see just how proud she can be.”</div>
    <div class="paragraph">Erdosain could not prevent himself asking:</div>
    <div class="paragraph">“But did you love her?”</div>
    <div class="paragraph">“No, I’ve never loved her. If you only knew all she has made me suffer! Love her, when she never so much as gave me her hand? Every time she looked at me, it was as if she were spitting in my face. You may have been her husband, but you never really knew her! What d’you know about the kind of woman she is? She could watch you die and not move a muscle in sympathy. D’you understand? I remember when the Astraldi place went bust and you were out on the street: if she had so much as asked me for everything I had, I would have gladly given it her. Would have given her my whole fortune just to hear her say ‘thank you’. That and nothing more. I would have left myself penniless just to hear those words. Then one day when I tried to talk about it, all she said was: ‘Remo is man enough to earn for both of us.’ Ah, you’ve no idea what she’s like! She’d be capable of watching you die without moving a muscle. And then I’d start thinking &mdash; my God, how many things pass through a man’s mind! I would fling myself down on my bed and start to imagine such crazy things … you had murdered someone … you had to be saved, so she came to beg for my help, and without saying a word of all my sacrifices, I would move heaven and earth for you. What a woman, Remo! I remember when she used to do her sewing. I would have gladly sat beside her just to hold her basket &mdash; and I knew she wasn’t happy with you. I could see it in her face, in her tiredness, in her smile.”</div>
    <div class="paragraph">The words Elsa had spoken scarcely an hour earlier floated into Erdosain’s mind: “It doesn’t matter … I’m happy. Can you picture how surprised you’ll be, Remo? You’re alone one night … all alone … when suddenly … creak … the door opens … and it’s me … it’s me, I’ve come back.”</div>
    <div class="paragraph">Barsut went on: “And of course I kept asking myself what made her put up with the life she led with you, alongside a man like you …”</div>
''';

  static const String title11_4 = 'CHAPTER ONE : THE SLAP (4)';
  static const String text11_4 = '''
    <div class="paragraph">“I came alone on foot through the dark streets, searching for you, but you don’t see me, you’re all alone, your head …”</div>
    <div class="paragraph">Erdosain felt as if all these thoughts were swirling around the top of his brain like a whirlpool. The huge vortex drilled down into the roots of his being. As it whirled giddily round, it drew a fresh, painful tenderness from his soul. How comforting Elsa’s words had been, how extraordinary!</div>
    <div class="paragraph">“I’ve always loved you. I love you now … never &mdash; why did you never talk to me before like you did tonight? I feel I’ll love you always, that next to you he is nothing more than the shadow of a man.”</div>
    <div class="paragraph">Erdosain felt sure these words would save his soul, although Barsut continued to pour out his jealous spite:</div>
    <div class="paragraph">“More than anything, I wanted to ask her what she saw in you &mdash; to dissect you in front of her eyes and show her until she was sick of it that you were no more than a madman, a swine, a coward … I swear there’s no anger in me as I tell you all this.”</div>
    <div class="paragraph">“And I believe you,” Erdosain replied.</div>
    <div class="paragraph">“Right now, looking at you, I ask myself: what does a woman see in a man? That’s something we’ll never know, don’t you agree? To me, you’re nothing more than a poor wretch, someone you can knock out of the way with a blow. But what exactly are you to her? That’s what’s so hard to fathom. D’you think you ever knew? Tell me honestly: did you ever know in your heart what you meant to your wife? What did she see in you to withstand so much at your side, to put up with you the way she did?”</div>
    <div class="paragraph">How solemn Barsut was! His hoarse questions demanded an answer. Sitting so close to him, Erdosain felt him not as another man, but as his double, a phantom with a bony nose and bronze-coloured hair who had suddenly become part of his own consciousness, because Barsut was posing him precisely the same questions as it had done in the past. It dawned on him with a cold certainty: for him to live in peace, he would have to get rid of Barsut.</div>
    <div class="paragraph">“Like plunging a sword into a bale of cotton,” Erdosain later remarked.</div>
    <div class="paragraph">Barsut had not the faintest idea that at that very moment Erdosain had condemned him to death. When Erdosain was explaining to me how the idea came to him, he said:</div>
    <div class="paragraph">“Have you ever seen a general on the field of battle? … But to explain it more clearly, I’ll speak as an inventor: for a long time, you search for the solution to a problem. You know for certain that the answer, the secret, is somewhere within you, but you can’t get at it because it’s hidden beneath so many layers of uncertainty. Then one day, when you least expect it, the plan, the complete vision of the machine, suddenly appears before your eyes, and you’re dazzled by its simple perfection. It’s a miracle! Imagine a general on the battlefield … everything seems lost, but then suddenly he discovers a perfect, simple solution, one he would never have imagined he knew, but which had been there all the time, within his grasp, deep within himself. At that instant I knew I needed to have Barsut killed. Opposite me, he went on pouring out senseless words, oblivious to the fact that, with my puffy mouth and swollen nose, I was having to contain this explosion of joy, this sense of amazement similar to the one you feel when something you discover is as inevitable as a law of mathematics. Perhaps there’s also a mathematics of the spirit, whose terrible laws are merely not as inflexible as those governing the relations between numbers or lines.<sup class="calibre15">1</sup> Here’s the strangest thing. That slap which made my gums bleed was like the stamp of a hydraulic press casting the outlines of a murder plot on to my consciousness. D’you follow me? A plan consists of three main lines, the combination of three straight lines, nothing more. And my excitement stamped out the cold imprint of those three guidelines, which took the following shape: abducting Barsut, having him killed and then using the money to set up the secret society the Astrologer was dreaming of. D’you follow me? The plan for the crime came to me spontaneously, while Barsut was whining on about how both our souls were damned. It was traced as clearly on my mind as if it had been stamped on a metal sheet at thousands of pounds’ pressure.</div>
    <div class="paragraph">“How can I explain it to you? All at once I forgot everything: I was caught up in an icy, joyous contemplation of him, which came over me like the dawn an inveterate night-owl welcomes because it soothes his exhaustion after a wearisome, dissolute night. D’you follow me? Having Barsut killed by someone who needed money urgently to carry out his master plan. And this new dawn stirring inside was so perfectly part of me, I have often wondered since what secrets a man’s soul must contain for it to constantly astound him with fresh vistas of this sort, reveal things to him which are so apparently inexplicable that they leave him stunned.”</div>
    <div class="paragraph">In my retelling of this episode, I have omitted to mention that when Erdosain got carried away, he would circle around his central “idea” with a torrent of words. In the grip of a slow frenzy which as he spoke gave him the feeling of being extraordinary rather than a useless nobody, he had to exhaust every last possibility of expression. I had no doubt he was telling the truth. What confused me was the question I kept asking myself: where did this man get the strength from to bear the sight of himself like this for so long? It seemed his whole vocation was to look into himself, to analyse what was going on inside him, as if the very accumulation of details could convince him he was really alive. I insist: a dead man blessed with the power of speech could not have said more than Erdosain did, to persuade himself he was not in fact dead.</div>
    <div class="paragraph">Without the slightest idea of all that was happening in Erdosain, Barsut went on:</div>
    <div class="paragraph">“Ah, you don’t know her … you’ve never known her. For example … listen to what I’m going to tell you. One evening I came to see you, but I knew you weren’t in, it was her I really wanted to see &mdash; nothing more than that. I arrived in a lather, I don’t know how many blocks I’d walked in the sun before I plucked up enough courage.”</div>
    <div class="paragraph">“Just like me, in the sun,” thought Erdosain.</div>
    <div class="paragraph">“I walked, even though as you know I can well afford a taxi. Then when I asked after you she said, without moving from the doorway:</div>
    <div class="paragraph">“‘I’m sorry, I can’t ask you in because my husband’s not here.’ D’you see what a bitch she is?”</div>
    <div class="paragraph">Erdosain thought:</div>
    <div class="paragraph">“There’s still a train to Temperley.”</div>
    <div class="paragraph">Barsut continued:</div>
''';

  static const String title11_5 = 'CHAPTER ONE : THE SLAP (5)';
  static const String text11_5 = '''
    <div class="paragraph">“As far as I could tell, you were nothing more than a poor devil, so I kept wondering: what could Elsa have seen in this dimwit for her to fall in love with him?”</div>
    <div class="paragraph">In the calmest of voices, Erdosain asked him:</div>
    <div class="paragraph">“And you can see from my face that I’m such an idiot?”</div>
    <div class="paragraph">Barsut looked up in surprise. For a moment, he kept his flashing green eyes fixed on Erdosain.</div>
    <div class="paragraph">The curtain of light that fell on their two heads created an illusion of great distance. It seemed Barsut realised he was as much a phantom as the other man, because he shook his head with great difficulty, as if his neck muscles had suddenly gone stiff, and replied:</div>
    <div class="paragraph">“No, now I look at you closely, you seem more like someone with an obsession … God knows what.”</div>
    <div class="paragraph">Erdosain laughed:</div>
    <div class="paragraph">“You’re a real psychologist. Of course, I’ve no idea either what the obsession might be … but it’s strange, it never occurred to me you would think of trying to take my wife from me … and how calmly you say these things!”</div>
    <div class="paragraph">“You can’t deny I’m being completely frank with you.”</div>
    <div class="paragraph">“No …”</div>
    <div class="paragraph">“And anyway, I wanted to humiliate her, not steal her from you. What would have been the point of that? I knew she would never love me.”</div>
    <div class="paragraph">“How did you work that out?”</div>
    <div class="paragraph">“That’s what I don’t know. Because people do things they can never explain. Because I kept on seeing you, and you kept on receiving me, even though we couldn’t ‘stand’ each other. I came because that way I made you suffer, and suffered myself. Every day I would tell myself: ‘I’m not going there again … I’m not going there again …’ but as soon as the time arrived, I would get all nervous. It was as though I was being called from somewhere, so I’d get dressed in a hurry … and come over …”</div>
''';

  static const String title11_6 = 'CHAPTER ONE : THE SLAP (6)';
  static const String text11_6 = '''
    <div class="paragraph">All of a sudden Erdosain had a strange idea:</div>
    <div class="paragraph">“While we’re on the subject … I’m not sure if you know, but this morning they discovered the anonymous letter at the Sugar Company. If I can’t pay up by tomorrow, they’ll have me arrested. I think you’ll be the first to admit that the one and only person to blame for all this is you: so it’s you who should give me the money. Where on earth am I to get it otherwise?”</div>
    <div class="paragraph">Barsut sat bolt upright in astonishment.</div>
    <div class="paragraph">“What’s that? Here I am, cuckolded and beaten like a dog, Elsa’s gone and I’ve done something terrible, and you expect me to come up with the money? Are you crazy? What possible reason could I have for giving you 600 pesos?”</div>
    <div class="paragraph">“And seven cents …”</div>
    <div class="paragraph">Erdosain stood up.</div>
    <div class="paragraph">“Is that your final word?”</div>
    <div class="paragraph">“You have to understand … how could I …?”</div>
    <div class="paragraph">“Well then, ‘kid’ … we’ll have to wait and see. Now do me a favour and get out, I want to go to sleep.”</div>
    <div class="paragraph">“Don’t you feel like going out?”</div>
    <div class="paragraph">“I’m tired. Leave me now.” Barsut hesitated, then stood up as well, clutching his hat brim in one hand, and stumbled from the room.</div>
    <div class="paragraph">Erdosain heard the street door slam, stood there frowning for a few moments, searched in his pocket for a railway guide, looked up the timetable, then went and washed his face again, and finally combed his hair in front of the mirror. His lip was swollen, and there were red weals round his nose and on the side of his head by the hairline.</div>
    <div class="paragraph">He looked round in search of something, spotted the revolver on the floor, stooped to pick it up, and went out. Then he realised he had left the light on, so came back in and turned the lamp off. In the darkness the light continued to gleam in his eyes for a brief moment as he went out again. For the second time that day, he was heading for the Astrologer’s house.</div>
''';

  static const String title12_1 = 'CHAPTER ONE : “BEING” THANKS TO A CRIME (1)';
  static const String text12_1 = '''
    <div class="paragraph">Light shone from the telegraph office door and dimly lit part of the Temperley station platform. Erdosain sat in the darkness on a bench next to the points switches. He was chilled, perhaps with a fever. He felt that the idea of the crime was an extension of his own body, just like the shadow he could cast into the light. A red disc shone at the end of an invisible signal arm: other red and green circles were pinned further off in the darkness, and their reflection fused with the rails as they curved into the night, lending them alternately a bluish or a pink glow. Sometimes the red or green light changed position. Then there was silence, as the chains stopped clanking against their supports, and the wires ceased to hum.</div>
    <div class="paragraph">Erdosain was only half-awake.</div>
    <div class="paragraph">“What am I doing here? Why am I staying here? Is it true I want to kill him? Or is it because I want to have the will to kill him? Why should that matter? At this very moment, she is rolling around in bed with him. What’s that to me? Before, when she was alone at home and I was in the café, I felt sorry for her, because she was unhappy with me … now it’s different … they’ll be asleep already, she’ll have her head on his chest. Good God! Can this be all there is? To feel lost, all the time lost? But am I really who I am? What if I were someone else? The strange distance! To live so distant from yourself! That’s what I do. Just like him. When he’s not around I can see him for what he is, a poor wretch. He almost broke my nose. How incredible! Now somehow it turns out he’s the one who’s been cuckolded and beaten, and not me! Me! … Really, life is a grotesque joke! Yet there must be more to it than that. Why do I loathe him so much when he’s with me?” Shadows flitted behind the yellow window of the telegraph office.</div>
    <div class="paragraph">“To kill him or not to kill him? What does it matter to me? Does it matter if I kill him? Let’s be honest. Is it important to me to kill him? Or is it all the same to me? Is it all the same if he lives? Yet I want to have the will to kill him. If a god appeared before me now and asked: ‘Do you want to have the power to destroy the whole of humanity?’ would I do it? Would I destroy it? No, I wouldn’t. Simply knowing I had the power to do so would rob the idea of all interest. Anyway, what would I do all alone on earth? Watch dynamos in workshops grow rusty, or the skeletons perched astride the furnaces crumble into dust? It’s true he slapped me around, but do I care? What a list! What a collection! The Captain, Elsa, Barsut, the Man with the Hogshead, the Astrologer, the Thug, Ergueta. What a list! Where can all these monsters have sprung from? I’m not at the centre of my being either, I am not who I am, and yet I need to do something to prove my existence, to affirm it. That’s it, affirm it. Because it’s as if I were dead. For the Captain, for Elsa, for Barsut I simply don’t exist. If they like, they can have me arrested, Barsut can slap me again, Elsa run off with someone else under my nose, the Captain can steal her from me again. I’m like the negation of life for all of them. Something like non-being. A man is not simply action, therefore he does not exist. Or does he exist in spite of not being? He is and is not. Take a look at men. Probably they have wives, children, houses. Perhaps they’re all losers. But if anyone tries to break into their home, to steal a cent from them, or lays a finger on their wife, they turn into wild animals. So why didn’t I revolt? Who can answer that for me? I certainly can’t. I only know that’s how I exist, as a negation. And when I say this kind of thing I’m not sad: my soul stays silent, my head empty. Then out of that silence and emptiness a curiosity about killing surges up from my heart. Precisely that. I’m not crazy, because I know how to think, to reason. It’s a curiosity that rises in me, a curiosity that must be my ultimate sorrow, the sorrow of curiosity. Or the demon of curiosity. To find out how I am thanks to a crime. That’s exactly it. To find out how my consciousness and my sensibility react to committing a crime.</div>
    <div class="paragraph">“And yet these words don’t make me feel the crime, just as a cable about a disaster in China doesn’t give me the feeling of that disaster. It’s as if someone else were thinking of the murder, and not me. Someone else who like me would be a man who was all surface, the shadow of a man, like in the cinema. He has a silhouette, he moves about, he seems to exist, to suffer, and yet he is nothing more than a shadow. He has no life. I swear to God, all this makes sense. So, what would this shadow man do? He would be aware of what had happened, but would be unable to feel its weight, because he had no volume to absorb it into. He is only a shadow. And I too see what’s happened, but can’t absorb it. This must be a new theory. I wonder what a criminal court judge would make of it? Would he realise how honest I’m being? Do people like that believe in honesty? Things move around me, beyond the limits of my body, but to them my life must be as inconceivable as living on the earth and the moon at the same time. I’m nothing to anyone. And yet, if tomorrow I throw a bomb or kill Barsut, then I become everything, a man who exists, a man who generations of legal experts have prepared punishments, gaols, and theories for. So I, who am nothing, would set in motion that fearful machinery of experts, secretaries, journalists, lawyers, prosecutors, warders, prison vans. Nobody would see me as a poor devil, but as an antisocial being, the enemy society would have to be protected from. That’s so strange! And yet it is only thanks to crime that I can affirm my existence, just as it is only evil which affirms man’s presence on earth. I would be the Erdosain who was predicted and feared, defined by the penal code; among the thousands of anonymous Erdosains who infect this world, I would be the other, authentic Erdosain, the one who is and always will be. All this is very strange. And yet despite everything, darkness does exist, and man’s soul is full of sorrow. Infinite sorrow. But that cannot be all there is to life. Something inside me tells me life cannot be like that. If I could only discover the precise reason why life cannot be that way, I could stick a pin in myself, and all this hot air of lies would be deflated like a balloon. Out of my present state a brand-new man would emerge, a man as powerful as one of the primeval gods of creation. But all this is getting me away from the point. Shall I go and see the Astrologer or not? What will he say when he sees me back again? Perhaps he’s expecting me. Like me, he’s a mystery to himself. That’s the truth of it. He’s as uncertain as I am about where he’s heading. A secret society! For him, the whole of society is summed up in those words: a secret society! Another devil. What a collection! Barsut, Ergueta, the Thug and me … Even if you wanted to, you couldn’t come up with such an assortment. And to top it all, the pregnant blind girl. What a monster!”</div>
    <div class="paragraph">The station guard walked past Erdosain a second time. He realised he was arousing the man’s suspicions, so he got up and set off for the Astrologer’s house. It was a moonless night. Streetlamps shone among the leafy branches at the street-corners. The sounds of a piano drifted out from one of the houses, and as he walked on, Erdosain could sense his heart shrivelling still further, oppressed once more by a sense of anguish at this glimpse of happiness behind the walls of houses cooled by the shade, each with its car drawn up outside the garage.</div>
''';

  static const String title13_1 = 'CHAPTER ONE : THE PROPOSAL (1)';
  static const String text13_1 = '''
    <div class="paragraph">The Astrologer was about to go to bed when he heard footsteps on the gravel path to the house. Since the dog did not bark, he opened the shutter a little way. In the yellow oblong of light that shone out on to the tops of the pomegranate trees he could see Erdosain coming his way, the light shining directly on his face.</div>
    <div class="paragraph">“That’s strange!” the Astrologer thought. “I hadn’t noticed until now that the kid wears a straw boater! What can he want?” Then after making sure he had his revolver in his waistband (an instinctive gesture with him) he unlocked the door. Erdosain stepped in.</div>
    <div class="paragraph">“I was afraid you were in bed.”</div>
    <div class="paragraph">“Come on in.”</div>
    <div class="paragraph">Erdosain went into the study. The map of the United States was still there, with black flags stuck in the regions the Ku-Klux-Klan dominated. The Astrologer must have been working on a horoscope because there was a compass box open on the table. A breeze from the garden stirred the papers, and Erdosain waited while the other man put some of them away in the cabinet, then he sat down with his back to the window.</div>
    <div class="paragraph">He sat and stared at the Astrologer’s broad, flat face, his twisted nose plunging down from the tumultuous forehead, the cauliflower ears, the barrel chest stuffed inside the faded black jacket, the copper chain dangling across his waistcoat, the steel ring with its purple stone on a gnarled, weather-beaten hand. Without his hat, the Astrologer’s hair was short, thick and curly. He had stretched out his legs and was leaning the full weight of his body on the arms of the chair. His unpolished boots completed the image he gave of a peasant from the mountains, or a gold prospector. “Surely this is what prospectors in Patagonia look like?” Erdosain thought, gazing absent-mindedly at the map of the United States and going over what he had heard the Astrologer say that afternoon as he pointed out the different states to the Thug.</div>
    <div class="paragraph">“The Ku-Klux-Klan is powerful in Texas, Ohio, Indianapolis, Oklahoma, Oregon …”</div>
    <div class="paragraph">“Well then, my friend … what …?”</div>
    <div class="paragraph">“Ah, that’s right! I came to see you …”</div>
    <div class="paragraph">“I was just about to go to bed. I’ve been working on a horoscope for some idiot …”</div>
    <div class="paragraph">“If I’m disturbing you, I’ll leave.”</div>
    <div class="paragraph">“No, stay. Have you been in a fight? What’s the matter?”</div>
    <div class="paragraph">“Lots of things. Tell me, if you could … Don’t be taken aback by my question … but if, to get your secret society started, if to raise the 20,000 pesos you need … if to raise the money you had to kill someone, would you do it?”</div>
''';

  static const String title13_2 = 'CHAPTER ONE : THE PROPOSAL (2)';
  static const String text13_2 = '''
    <div class="paragraph">The Astrologer sat upright in the chair, his body jerked into a right angle by his astonishment … Although the thoughts Erdosain was voicing made him lift his head in surprise, it still seemed to weigh mightily on his shoulders. He rubbed his hands and searched Erdosain’s face.</div>
    <div class="paragraph">“Why on earth are you asking me a question like that?”</div>
    <div class="paragraph">“I’ve found the guy with the 20,000 pesos. We could kidnap him, and if he refuses to sign the cheque for us, we could torture him.”</div>
    <div class="paragraph">The Astrologer frowned deeply. He was even more perplexed as he heard the details of the proposal, and began to twist the ring on his right hand. The purple stone reflected time and again in the bronze watch-chain. Although he had his face down, his eyes peered up at Erdosain’s face from beneath the line of his brows. In this position, his misshapen nose seemed like a buttress overhanging the chin sunk into the black cloth of his bow tie.</div>
    <div class="paragraph">“You’ll have to explain it all to me, I haven’t understood a word so far.” He had straightened up again, his face looking as though it could withstand a hail of blows. “It’s simple but brilliant. Tonight, my wife left me to go and live with another man. So he …”</div>
    <div class="paragraph">“Who is he …?”</div>
    <div class="paragraph">“Barsut, my wife’s cousin … Gregorio Barsut … he came to see me and confessed it was he who betrayed me to the Sugar Company.”</div>
    <div class="paragraph">“Ah … so he was the one who betrayed you?”</div>
    <div class="paragraph">“Yes, and to top it all …”</div>
    <div class="paragraph">“What reason did he have?”</div>
    <div class="paragraph">“How should I know! To humiliate me … anyway, he’s pretty crazy. He’s someone who’s out of control. He’s got 20,000 pesos. His father died in an asylum. That’s where he’s going to end up. He inherited the 20,000 from an aunt on his father’s side.”</div>
    <div class="paragraph">The Astrologer bowed his head on his hand. He was more lost than ever. The idea intrigued him, but he was not sure he understood. He insisted:</div>
    <div class="paragraph">“Tell me everything, bit by bit.”</div>
    <div class="paragraph">Erdosain began again from the beginning. He told the story as we already know it. He had lost his earlier nervousness at revealing his proposal to the Astrologer, and spoke slowly and carefully.</div>
    <div class="paragraph">By now he was bent right forward on the edge of his seat, elbows on knees, his hands cupping his cheeks as he stared down at the floor. The yellow skin stretched taut across his wide cheekbones made him look like a consumptive. A stream of depravity poured endlessly from his throat, as though he were flatly reciting a lesson cast on his mind like a die. Covering his mouth with his fingers, the Astrologer sat listening to him dumbfounded. He had imagined many things, but not all this.</div>
    <div class="paragraph">Erdosain spoke slowly, choosing his words carefully in order not to make any mistake, as he spilled out the list of all his fears, his humiliations, memories, sorrows, all his sleepless nights and bitter quarrels. One of the many things he said was:</div>
''';

  static const String title13_3 = 'CHAPTER ONE : THE PROPOSAL (3)';
  static const String text13_3 = '''
    <div class="paragraph">“It might seem crazy to you that although I came here to propose we kill someone, I see myself as innocent &mdash; but I’m talking about when I was twenty and still very much a kid. Have you any idea what kind of sadness it is that leads a person to spend their nights in some ghastly bar, whiling away the time in futile conversations and drinking cheap rum? Do you know what it’s like to be in a brothel when all of a sudden you find it impossible to control yourself and not break down in tears? You’re staring at me in amazement &mdash; perhaps you thought of me as a bit odd, but you had no idea that all the strangeness was born of the anguish I carry deep inside. I’m even amazed at the precision I can describe all this with. Who am I? Where am I headed? I’ve no idea. And yet I sense you are just like me, and that’s why I came here to suggest we kill Barsut. We can use the money to set up the secret group, and that way we’ll rock the foundations of this society.”</div>
    <div class="paragraph">The Astrologer butted in:</div>
    <div class="paragraph">“Why have you always been like this?”</div>
    <div class="paragraph">“That’s what I don’t know. Why do you want to set up your organisation? Why does the Melancholy Thug go on exploiting women and polishing his own boots when he already has a fortune? Why did Ergueta ditch the million-airess and marry a whore? Do you think I put up with the slap Barsut gave me, or what the Captain did, just like that? On the face of it, I am a coward, Ergueta is a madman, the Thug a miser, you a man obsessed. On the face of it, that’s what we are, but deep down inside, somewhere beneath our own awareness and conscious thoughts, there’s another life that’s far more powerful and vaster … so that if we put up with everything it’s because we believe that by hanging on, by doing so we’ll finally get at the truth … I mean, the truth about ourselves.”</div>
    <div class="paragraph">The Astrologer got to his feet, walked over to Erdosain and patted him on the head. He said, uncertainly:</div>
    <div class="paragraph">“You’re quite right, my boy. We’re mystics without knowing it. The Melancholy Thug is a mystic, Ergueta is a mystic, so are you, me, her, and all of them … the lack of religion that is this century’s evil has so destroyed our understanding that we look outside ourselves for what in fact exists within the mystery of our own subconsciousness. We need a religion to save us from the catastrophe that has befallen us. You might object that what I’m saying is nothing new. Fine, but just remember that on this earth all that changes is the style, the way things are done; the substance stays the same. If you believed in God you would have been spared your wretched life; if I believed in God I wouldn’t be listening to you now proposing to kill a fellow man. And the worst of all is that for us the time to discover a belief, a faith, has already passed. If we went to see a priest, he wouldn’t understand our problems. All he could do would be to recommend we recite the Lord’s Prayer and go to mass every week.”</div>
    <div class="paragraph">“And all the time we ask ourselves what is to be done …”</div>
    <div class="paragraph">“That’s right. What is to be done … In days gone by we would at least have had the chance to take refuge in a convent or to go on a journey to distant, magical lands. Nowadays you can eat an ice cream in Patagonia in the morning and bananas in Brazil in the afternoon. What is to be done? I read a lot, and believe me, all the books from Europe are full of the same current of bitterness and despair you speak of in your own life. Just look at the United States. Movie stars have platinum ovary implants; and there are murderers trying to beat the record for the most horrible crime. You’ve been around, you’ve seen it. House after house, different faces but the same hearts. Humanity has lost its ability to celebrate, to feel joy. Mankind is so unhappy it’s even lost God! Even a 300-horsepower engine is only fun when driven by a madman who is likely to smash himself to pieces in a ditch. Man is a sad animal who only rejoices in wonders. Or massacres. Well, in our society we’ll make sure we give them wonders &mdash; plagues of Asiatic cholera, myths, the discovery of gold deposits or diamond mines. I’ve seen it when we two talk. You only come alive when some fresh wonder is mentioned. It’s the same with everyone, criminal or saint.”</div>
    <div class="paragraph">“Well then, are we going to kidnap Barsut?”</div>
    <div class="paragraph">“Yes. Now we have to work out exactly how we’ll get hold of him and his money.”</div>
    <div class="paragraph">The wind stirred the leaves in the garden. Erdosain sat for a few moments looking at the shaft of light which shone from the half-open window on to the pomegranate trees. The Astrologer had scraped back his chair, and now lolled with his head against the dark brown cabinet top. He was once again twisting the steel ring on his finger, up in front of his face.</div>
    <div class="paragraph">“How will we get hold of him? That’s easy. I’ll tell Barsut I’ve found out where the Captain has taken Elsa …”</div>
    <div class="paragraph">“Yes, that’s a good idea. But how have you found out &mdash; that’s what he’s bound to ask …”</div>
''';

  static const String title13_4 = 'CHAPTER ONE : THE PROPOSAL (4)';
  static const String text13_4 = '''
    <div class="paragraph">“I’ll tell him I went to the Personnel Department at the War Ministry.”</div>
    <div class="paragraph">“Perfect … that’s very good … fine …”</div>
    <div class="paragraph">The Astrologer had leaned forward enthusiastically, and was watching Erdosain with interest.</div>
    <div class="paragraph">“And with the excuse that we want him to convince Elsa to come back to me, we’ll bring him here.”</div>
    <div class="paragraph">“Excellent. Let me think it through. Everything you’ve suggested … seems to fit. Ah … tell me one thing: does he have any family?”</div>
    <div class="paragraph">“Not except for my wife.”</div>
    <div class="paragraph">“Where does he live?”</div>
    <div class="paragraph">“In a rented room. The owner’s daughter is cross-eyed.”</div>
    <div class="paragraph">“What will they say when Barsut vanishes?”</div>
    <div class="paragraph">“Here’s what we can do. We send his landlady a telegram from Rosario signed by him, asking her to send his things to a certain hotel, where you’ll be staying under his name.”</div>
    <div class="paragraph">“Perfect! You’ve thought it all out very well. The plan’s perfect. It’s true that everything’s in our favour: the Captain, the address from the ministry, the fact he has no relatives, that he lives in lodgings. It’s as clear-cut as a chess move. Perfect!”</div>
    <div class="paragraph">After he had finished talking, the Astrologer began to pace up and down the room. Each time he passed in front of the window, he blocked the light to the garden, or cast a huge shadow across the cabinet and up to the roofbeams. Erdosain was right to say that the plan was as sharply defined as if “it had been stamped at thousands of pounds’ pressure”.</div>
    <div class="paragraph">The Astrologer’s boots thumped loudly with each step, and Erdosain was already beginning to regret that the “plan” was so simple, so devoid of any literary twists and turns. He would have liked to add some extra perilous adventure, to make it less geometrically perfect.</div>
    <div class="paragraph">“Damn it: this is no fun! This way, anyone can be a murderer!”</div>
''';

  static const String title13_5 = 'CHAPTER ONE : THE PROPOSAL (5)';
  static const String text13_5 = '''
    <div class="paragraph">“And is there nothing between Gregorio and the cross-eyed girl?”</div>
    <div class="paragraph">“No.”</div>
    <div class="paragraph">“Why did you mention her then?”</div>
    <div class="paragraph">“I don’t know.”</div>
    <div class="paragraph">“You’re not afraid you’ll be remorse-stricken after ‘it’ happens?”</div>
    <div class="paragraph">“I think that only happens in novels. In real life I’ve done both good and bad, and in neither case have I felt the slightest joy or the least sense of remorse. I reckon that what’s called remorse is simply fear of punishment. In Argentina they don’t hang people, and only cowards …”</div>
    <div class="paragraph">“What about you …?”</div>
    <div class="paragraph">“Excuse me, but I’m no coward. I am coldblooded, which is different. Just think about it. If I’ve let my wife be taken from me without reacting, if I’ve let myself be slapped around by someone who betrayed me, isn’t it even more likely I’ll watch him die without moving a muscle, provided it’s not a bloodbath?”</div>
    <div class="paragraph">“That’s true. It’s very logical. Everything you say is logical. D’you know, you’re a really interesting guy, Erdosain?”</div>
    <div class="paragraph">“That’s what my wife used to say. But that didn’t stop her going off with someone else.”</div>
    <div class="paragraph">“And you hate him for it?”</div>
    <div class="paragraph">“Sometimes. It depends. Perhaps with me it’s more of a physical revulsion than hatred. And really, no, I don’t hate him, you can’t hate people you know are capable of exactly the same kind of baseness as you are.”</div>
    <div class="paragraph">“So why do you want to have him killed?”</div>
''';

  static const String title13_6 = 'CHAPTER ONE : THE PROPOSAL (6)';
  static const String text13_6 = '''
    <div class="paragraph">“And why do you want to set up your society?”</div>
    <div class="paragraph">“Do you think this crime is going to have any effect on your life?”</div>
    <div class="paragraph">“That’s what I’m curious to find out. To find out if my life, my way of seeing things or my sensibility change after watching him die. Anyway, I feel the need to kill someone. Even if only to take me out of myself.”</div>
    <div class="paragraph">“And you want me to do the dirty work for you?”</div>
    <div class="paragraph">“Of course! … Because for you, ‘doing my dirty work’ means getting the 20,000 pesos you need to set up your organisation and the brothels …”</div>
    <div class="paragraph">“What made you think I was someone who would do ‘that’?”</div>
    <div class="paragraph">“What? I’ve been observing you for a long time. But I became convinced you were the sort of person who would take this kind of risk a year ago, when I met you at the Theosophy Society.”</div>
    <div class="paragraph">“How’s that?”</div>
    <div class="paragraph">“I remember it as if it were now. A woman who sold coal was on your left, talking about the perispirit with a shoemaker. Have you ever noticed how fascinated shoemakers are by the occult sciences, by the way?”</div>
    <div class="paragraph">“And …?”</div>
    <div class="paragraph">“And then you started talking to a Polish gentleman who was in contact with Sobiezki’s spirit.”</div>
    <div class="paragraph">“I don’t remember …”</div>
    <div class="paragraph">“I do. The Polish gentleman, as you yourself later told me, was a building labourer … You and the Polish gentleman moved on from talking about Sobiezki to a discussion on ‘the homing instinct of pigeons’, and you told him: ‘the only importance the homing instinct of pigeons has for me is so they could act as go-betweens in a blackmail plot’. Then you began to explain what you meant … and by the time you had finished, to the astonishment of the Polack, the coal-seller and the shoemaker, I was saying to myself: ‘There’s a man ready for anything …’”</div>
    <div class="paragraph">“Ha, hal You’re quite a guy, d’you know that?”</div>
    <div class="paragraph">“Sure. Remember: the mechanism of our plot is made up of three smaller parts that all have to mesh together perfectly, though they’re independent of each other. The first part is the kidnapping. The second is your trip to Rosario, where you’ll send for and receive the luggage in Barsut’s name. The third is the murder itself and the disposal of the body.”</div>
    <div class="paragraph">“Will we get rid of it?”</div>
    <div class="paragraph">“Of course. Either with nitric acid or in a big furnace … in which case, we’ll need a heat of at least 500 degrees to make sure the bones are reduced to ash.”</div>
''';

  static const String title13_7 = 'CHAPTER ONE : THE PROPOSAL (7)';
  static const String text13_7 = '''
    <div class="paragraph">“How do you know all this?”</div>
    <div class="paragraph">“I’m an inventor, remember. Ah, and we can use part of the 20,000 pesos to mass-produce my copper roses. At the moment, a family I know is making them for me. One of the boys might be a candidate for your society. And just recently I’ve been thinking of a way to modify Stephenson’s steam engine with electromagnetics. It would make it a hundred times simpler. D’you know what I really need? To get away for a while, to go to the mountains, to get some rest and study.”</div>
    <div class="paragraph">“You could go to the camp we’re organising.”</div>
    <div class="paragraph">“So you agree to the plan?”</div>
    <div class="paragraph">“Just one thing … where did Barsut get his money?”</div>
    <div class="paragraph">“Three years ago he sold a house he had inherited.”</div>
    <div class="paragraph">“So he has it in a savings account?”</div>
    <div class="paragraph">“No, in his current account.”</div>
    <div class="paragraph">“He doesn’t live off the interest?”</div>
    <div class="paragraph">“No, he’s spending it bit by bit. Two hundred pesos a month. He says he’ll be dead before he’s got through it all.”</div>
    <div class="paragraph">“That’s strange. What sort of man is he?”</div>
''';

  static const String title13_8 = 'CHAPTER ONE : THE PROPOSAL (8)';
  static const String text13_8 = '''
    <div class="paragraph">“Strong. Cruel. You’ll have to plan the abduction very carefully, because he’ll resist like a wild animal.”</div>
    <div class="paragraph">“OK.”</div>
    <div class="paragraph">“Ah … before I go. Are you planning to tell the Thug about any of this?”</div>
    <div class="paragraph">“No. It’s a secret between the two of us. The Thug’s job is simply to organise the brothels, that’s all. You’ll pay back the Sugar Company tomorrow, is that right?”</div>
    <div class="paragraph">“Yes.”</div>
    <div class="paragraph">“Now I come to think of it, I know a counterfeiter. He can draw up the document from the War Ministry.” Erdosain paced up and down the room for a while. “The kidnapping should be easy. You go to Rosario and send a telegram for the trunks. The thing is, when you’re faced with actually committing a crime …”</div>
    <div class="paragraph">“This won’t be the only one we’ll commit …”</div>
    <div class="paragraph">“What?”</div>
    <div class="paragraph">“Of course not. Something else I’m concerned about is how we’ll keep things secret in the society. Here’s what I thought: we’ll have revolutionary cells in every corner of Argentina. The central committee will be based here in the capital. It will be made up as follows: each provincial leader will be a member, and each leader of a provincial district will be a member of the provincial capital committee, and each leader of a provincial town will be a member of the provincial capital committee, and so on.”</div>
    <div class="paragraph">“Doesn’t that seem a bit complicated?”</div>
    <div class="paragraph">“I don’t know, we’ll work it out. I’ve thought of other organisational details as well: each cell will have a radio receiver and transmitter, and every ten members will commit themselves to buying a vehicle, ten rifles and two machine guns. Every hundred members will be responsible for buying a warplane, bombs, and so on. All promotions will be decided by the central committee, all lesser appointments will be decided by restricted voting. But now it’s time to go to bed. There’s a train in a few minutes … or would you prefer to sleep here?”</div>
    <div class="paragraph">Erdosain had no real reason to leave. The clock had already struck three, and all the last part of what the Astrologer had said had passed him by in a daze. He could not take any more in. He needed to get away, that was all. To get as far away as possible.</div>
    <div class="paragraph">They shook hands; the Astrologer said goodbye at the top of the steps, and Erdosain made his way, exhausted, through the garden. When he turned to look back from the shadows, the lighted window hung like a yellow rectangle in the darkness.</div>
''';

  static const String title14_1 = 'CHAPTER ONE : UP THE TREE (1)';
  static const String text14_1 = '''
    <div class="paragraph">Day is breaking. Erdosain is walking along the track on the broken ground outside the walled gardens. The morning chill penetrates to the remotest cell of his tired lungs. The sky above is still dark, making everything in the distance invisible, and everything else seem closer. At the far end of the labyrinth of streets, a few greenish stripes are lightening the sky.</div>
    <div class="paragraph">As he walks along, Erdosain is thinking: “This is as sad as a desert. At this hour, she’s asleep with him.”<sup class="calibre15">2</sup></div>
    <div class="paragraph">Wisps of white mist seep into the streets from the watery light of dawn.</div>
    <div class="paragraph">Erdosain says to himself:</div>
    <div class="paragraph">“And yet I must be strong. I remember when I was a child. I imagined I saw huge men walking on the crest of clouds, their hair streaming out and their limbs sheathed in light. In fact, they were striding through the land of joy I had within me.</div>
    <div class="paragraph">“Oh, losing a dream is almost as bad as losing a fortune. What am I saying? It’s far worse. You have to be strong, that’s all there is to it. And to have no compassion. And however weary you are, to say to yourself: I may be tired now, I may regret everything now, but things will be different tomorrow. That’s all there is: tomorrow.”</div>
    <div class="paragraph">Erdosain closes his eyes. A perfume of carnations or balsam fills the air with a strange carnival atmosphere.</div>
    <div class="paragraph">And Erdosain thinks:</div>
    <div class="paragraph">“In spite of everything, life must be filled with joy. This is no way to live. It’s not right. There must be some kind of joy that rises above all our misery, I don’t know, something nobler than our ugly human face, our appalling human truth. The Astrologer is right. We have to usher in the realm of falsehood, of magnificent lies. To worship someone. Force a way through this forest of stupidity. But how?”</div>
    <div class="paragraph">Erdosain goes on talking to himself as the sun brings a pink blush to his cheeks:</div>
    <div class="paragraph">“What does it matter if I’m a murderer or a degenerate? Does it? No. It’s a minor problem. There’s something far more important than the baseness of the whole of mankind put together, and that is joy. If I could rejoice, then happiness would absolve me of my crime. Joy is all that matters. That, and loving someone …”</div>
    <div class="paragraph">The sky turns green in the distance, while the trunks of the trees are still submerged in low-lying darkness. Erdosain frowns. Wisps of memory float free from his mind, golden mists, glittering rails stretching into the distance of an afternoon landscape under a canopy of sun. And the face of a girl, a small, pale face with green speckled eyes and black curls escaping from beneath a straw hat, rises to the surface.</div>
    <div class="paragraph">Two years ago. No. Three. Yes, three years earlier. What was her name? Maria, Maria Esther. What was it? Her sweet face warms the night-time world of his fantasy. He remembers so well! He was sitting beside her, the wind was ruffling her black curls, and all at once he stretched out his hand and cupped her chin in his hands. Where can she be now? What roof is she sleeping under? If he saw her, would he recognise her? Three years ago. He met her on a train, talked with her a few minutes for a fortnight or so, then she disappeared. That was all there was to it. And she did not know he was married. What would she have said if she had known? Yes, now he remembers. Her name was Maria. But what does that matter? Not at all. There was something more precious in it all: the gentle warmth that shone from those eyes of hers, now green, now brown. And her silence. Erdosain remembers the train journeys; he is sitting next to the girl; she rests her head on his shoulder, he twists her curls round his fingers, and the girl trembles in silence. If she knew he was planning to kill someone, what would she say? She might not even understand the word. Erdosain remembers how she reached up like a shy schoolgirl to stroke his rough, unshaven cheeks, and just possibly the happiness he has lost is exactly what is needed to wipe all traces of ugliness from the human face.</div>
''';

  static const String title14_2 = 'CHAPTER ONE : UP THE TREE (2)';
  static const String text14_2 = '''
    <div class="paragraph">Now Erdosain begins to question himself. Why is he thinking all this? What right does he have? Since when do apprentice murderers think? And yet despite everything, there is something in him which gives thanks to the universe. Could it be humility or love? He does not know, but he perceives there is a sweetness in this very lack of coherence, it seems to him that when a poor soul is driven mad, it is thankful to abandon the sorrows of this earth. And underpinning this feeling of pity, an irresistible, almost ironic force leads him to curl his lip in disdain.</div>
    <div class="paragraph">The gods exist. They live concealed under the skin of certain people who can remember life on this planet when the earth was still young. Erdosain also has a god within him. Could it be possible? He feels his nose, still throbbing from the beating Barsut has given him, and the irresistible force once again insists: he does have a god concealed beneath his painful skin. Does the penal code provide for the punishment of a murderous god? What would the judge say if he answered him: “I sin because I have a god inside me”?</div>
    <div class="paragraph">And yet, isn’t it true? This love, this strength that flows through him in the dawn under the trees dripping dew, is it not proof of his godlike nature? Once more the memory stands out on the surface of his mind: a pale, oval face with green eyes and black curls that the breeze blew across her throat. How simple it all is! He is in such a trance he has no need to say anything. Although he might just as well have gone mad thinking like this about the schoolgirl under the dripping trees. What other reason could there be for his soul being so different from when it kept him in torment the previous night? Or can it be that at night we think only dark thoughts? Even if this is true, it does not matter. He is another man now. He is smiling under the trees. Isn’t it all wonderfully absurd? The Melancholy Thug, the depraved blind girl, Ergueta and his Christ myth, the Astrologer, all those incomprehensible phantoms who speak a human language, who put flesh on words, what are any of them compared to him as he leans on a post by a climbing wistaria, as he feels life surging through his breast?</div>
    <div class="paragraph">He is another man, from the simple fact of having thought of the child resting her head on his shoulder in a train compartment. Erdosain closes his eyes. The acrid smell of earth makes him shiver. A feeling of giddiness rises from his weary body.</div>
    <div class="paragraph">Someone comes towards him on the path. A raucous whistle reaches him from the station. Other men in caps or lopsided hats pass by in the distance.</div>
    <div class="paragraph">What on earth is he doing here? Erdosain blinks one eye, aware he is cheating on God, playing out the comedy of someone unable to avoid God’s curse on him. Yet now and again flashes of darkness pass before his eyes, and a kind of dull intoxication takes hold of his senses. He wants to violate something. To violate common sense. If there had been any bundles of hay nearby, he would have set fire to them … his face swells with a repugnant look, takes on the vile expression of madness; suddenly he sees a tree, jumps into the air, grabs on to a branch, clings to it while he scrabbles with his feet on the trunk, gets his elbows over the top, and manages to pull himself up into the fork of the acacia.</div>
    <div class="paragraph">His shoes slip on the shiny bark, twigs whip against his face, but he clambers upright holding on to another branch, and peers through the wet leaves. Down below, the road winds among islands of trees.</div>
    <div class="paragraph">Now he is up in the tree. He has violated common sense, for the sake of it, for no reason, like someone who kills a passer-by simply because he bumped into him, to see if the police will track him down. Over in the east, gloomy chimneys stand out against the green-streaked sky; beyond them mounds of green fill the lowlying land of Banfield like monstrous herds of elephants; and still he feels desolate. He knows now it is not enough to violate common sense to feel happy. He makes one last effort and shouts out loud:</div>
    <div class="paragraph">“Hey, you sleeping beasts! Hey! … I swear that … but no … I want to violate the laws of common sense, so stay calm, little animals. No. What I really want to preach is daring, a new life. I am speaking out of a tree, but I’m not ‘up a gum tree’, it’s an acacia: Hey, you sleeping beasts!”</div>
    <div class="paragraph">His strength quickly drains away. He looks all around as if surprised at finding himself in this position, then all at once the face of the distant girl blooms in his mind like a flower. Suddenly ashamed of the scene he is making,<sup class="calibre15">3</sup> he climbs down from the tree. He is vanquished. A broken man.</div>
    <br class="calibre1" />
    <div class="paragraph">Footnotes</div>
    <div class="paragraph"><sup class="calibre15">1</sup> This chapter in Erdosain’s confessions led me to wonder whether the idea of the crime he was going to commit did not already exist in his subconscious mind, which would serve to explain his passivity in the face of Barsut’s aggression.</div>
    <div class="paragraph"><sup class="calibre15">2</sup> It was only later Erdosain learnt that at that very moment Elsa was being looked after by a sister of charity. A single ill-advised gesture from the Captain had been enough for her to realise the predicament she had got herself into, and she had leapt from the vehicle they were in. She decided to go to a hospital, where she was taken in by the mother superior, who realised she was dealing with a woman at her wits’ end.</div>
    <div class="paragraph"><sup class="calibre15">3</sup> Erdosain offered me two explanations for this state. The first was that he was immensely pleased at pretending to be mad, like someone “who has drunk one glass of wine but pretends to be drunk to his friends, in order to trick them”. Erdosain gave a sad smile while he was explaining all this, and told me that when he climbed down out of the acacia he felt ashamed in the same way as someone who dresses up for Carnival and shows off in front ofa group ofstrangers, but instead of making them laugh, elicits only a contemptuous remark. “I was so sick of myself I even thought of committing suicide, and was sorry I didn’t have my revolver with me. It was only when I was getting undressed back at home that I realised I’d forgotten I had my gun in my trouser pocket.”</div>
''';

  static const String title15 = 'CHAPTER TWO';
  static const String text15 = '''
    <div class="paragraph">...</div>
''';

  static List<Map<String, String>> pages = [
    {
      'title': title1_1,
      'text': text1_1,
    },
    {
      'title': title1_2,
      'text': text1_2,
    },
    {
      'title': title2_1,
      'text': text2_1,
    },
    {
      'title': title2_2,
      'text': text2_2,
    },
    {
      'title': title2_3,
      'text': text2_3,
    },
    {
      'title': title3_1,
      'text': text3_1,
    },
    {
      'title': title3_2,
      'text': text3_2,
    },
    {
      'title': title4_1,
      'text': text4_1,
    },
    {
      'title': title4_2,
      'text': text4_2,
    },
    {
      'title': title4_3,
      'text': text4_3,
    },
    {
      'title': title4_4,
      'text': text4_4,
    },
    {
      'title': title5_1,
      'text': text5_1,
    },
    {
      'title': title5_2,
      'text': text5_2,
    },
    {
      'title': title5_3,
      'text': text5_3,
    },
    {
      'title': title6_1,
      'text': text6_1,
    },
    {
      'title': title6_2,
      'text': text6_2,
    },
    {
      'title': title7_1,
      'text': text7_1,
    },
    {
      'title': title7_2,
      'text': text7_2,
    },
    {
      'title': title7_3,
      'text': text7_3,
    },
    {
      'title': title7_4,
      'text': text7_4,
    },
    {
      'title': title7_5,
      'text': text7_5,
    },
    {
      'title': title8_1,
      'text': text8_1,
    },
    {
      'title': title8_2,
      'text': text8_2,
    },
    {
      'title': title8_3,
      'text': text8_3,
    },
    {
      'title': title8_4,
      'text': text8_4,
    },
    {
      'title': title8_5,
      'text': text8_5,
    },
    {
      'title': title9_1,
      'text': text9_1,
    },
    {
      'title': title9_2,
      'text': text9_2,
    },
    {
      'title': title9_3,
      'text': text9_3,
    },
    {
      'title': title9_4,
      'text': text9_4,
    },
    {
      'title': title9_5,
      'text': text9_5,
    },
    {
      'title': title9_6,
      'text': text9_6,
    },
    {
      'title': title9_7,
      'text': text9_7,
    },
    {
      'title': title9_8,
      'text': text9_8,
    },
    {
      'title': title9_9,
      'text': text9_9,
    },
    {
      'title': title9_10,
      'text': text9_10,
    },
    {
      'title': title9_11,
      'text': text9_11,
    },
    {
      'title': title10_1,
      'text': text10_1,
    },
    {
      'title': title11_1,
      'text': text11_1,
    },
    {
      'title': title11_2,
      'text': text11_2,
    },
    {
      'title': title11_3,
      'text': text11_3,
    },
    {
      'title': title11_4,
      'text': text11_4,
    },
    {
      'title': title11_5,
      'text': text11_5,
    },
    {
      'title': title11_6,
      'text': text11_6,
    },
    {
      'title': title12_1,
      'text': text12_1,
    },
    {
      'title': title13_1,
      'text': text13_1,
    },
    {
      'title': title13_2,
      'text': text13_2,
    },
    {
      'title': title13_3,
      'text': text13_3,
    },
    {
      'title': title13_4,
      'text': text13_4,
    },
    {
      'title': title13_5,
      'text': text13_5,
    },
    {
      'title': title13_6,
      'text': text13_6,
    },
    {
      'title': title13_7,
      'text': text13_7,
    },
    {
      'title': title13_8,
      'text': text13_8,
    },
    {
      'title': title14_1,
      'text': text14_1,
    },
    {
      'title': title14_2,
      'text': text14_2,
    },
    {
      'title': title15,
      'text': text15,
    },
  ];

  static int length = pages.length;

  static String getText(int page) {
    return pages[page]['text'] ?? '';
  }
}
